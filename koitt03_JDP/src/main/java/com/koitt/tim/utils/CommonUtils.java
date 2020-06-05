package com.koitt.tim.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.UUID;

public class CommonUtils {

    private static final String SAVE_PATH = "C:\\upload\\";
    private static final String PREFIX_URL = "/upload/";

    //파일업로드
    public String FileUploader(MultipartFile mFile) throws IOException {

        String url;
        String fileExtension = mFile.getOriginalFilename().substring(mFile.getOriginalFilename().lastIndexOf("."));
        String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + fileExtension;

        File file = new File(SAVE_PATH + storedFileName);
        mFile.transferTo(file);
        url = PREFIX_URL + storedFileName;
        return url;
    }

    //Timestamp 형식으로 변환
    public Timestamp timeConcat(String pDate, String pTime) {
        return Timestamp.valueOf(pDate + " " + pTime + ":00.0");
    }
}
