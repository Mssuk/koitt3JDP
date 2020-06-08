package com.koitt.tim.utils;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@Component
public class CommonUtils {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	// Cloudinary cloud_name, API_Key and API_Secret
	private static final String CLOUDINARY_CLOUD_NAME = "dbtw8youc";
	private static final String CLOUDINARY_API_KEY = "166432243782593";
	private static final String CLOUDINARY_API_SECRET = "BS2QSJxghfGCj_twUpKqWpyYJZQ";

	private static final String SAVE_PATH = "C:\\upload\\";
	private static final String PREFIX_URL = "/upload/";

	// 파일업로드(로컬)
	public String FileUploader(MultipartFile mFile) throws IOException {

		String url;
		String fileExtension = mFile.getOriginalFilename().substring(mFile.getOriginalFilename().lastIndexOf("."));
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + fileExtension;

		File file = new File(SAVE_PATH + storedFileName);
		mFile.transferTo(file);
		url = PREFIX_URL + storedFileName;
		return url;
	}

	// 파일업로드(ftp)
//	public String FileUploaderFTP(MultipartFile mFile) throws IOException {
//
//		String url;
//		String fileExtension = mFile.getOriginalFilename().substring(mFile.getOriginalFilename().lastIndexOf("."));
//		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + fileExtension;
//		url = PREFIX_URL + storedFileName;
//
//		try {
//			final Message<byte[]> message = MessageBuilder.withPayload(mFile.getBytes())
//					.setHeader("fileName", storedFileName).setHeader("remoteDir", "/upload/").build();
//
//			boolean uploadSuccess = ftpChannel.send(message);
//			if (uploadSuccess == false) {
//				logger.warn("{}", "업로드 실패");
//			}
//			logger.info("{}", "Ftp file upload is success.");
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return url;
//	}

	// 파일업로드(클라우드)
	public String FileUploaderCDN(MultipartFile mFile, String folderName) throws IOException {

		String fileExtension = mFile.getOriginalFilename().substring(mFile.getOriginalFilename().lastIndexOf("."));
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + fileExtension;

		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", CLOUDINARY_CLOUD_NAME, "api_key",
				CLOUDINARY_API_KEY, "api_secret", CLOUDINARY_API_SECRET, "secure", true));

		Map<String, Object> cloudinaryURL = null;
		Map params = ObjectUtils.asMap("public_id", folderName + storedFileName);
		File convFile = new File(storedFileName);
		mFile.transferTo(convFile);

		try {
			Map<String, Object> result = (Map<String, Object>) cloudinary.uploader().upload(convFile, params);
			cloudinaryURL = result;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return (String) (cloudinaryURL.get("url"));
	}

	// Timestamp 형식으로 변환
	public Timestamp timeConcat(String pDate, String pTime) {
		return Timestamp.valueOf(pDate + " " + pTime + ":00.0");
	}
}
