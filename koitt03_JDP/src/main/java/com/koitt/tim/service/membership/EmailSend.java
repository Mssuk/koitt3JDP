package com.koitt.tim.service.membership;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import javax.sql.DataSource;
import java.io.File;
import java.util.Properties;

public class EmailSend implements Runnable {
    MembershipServiceImpl serviceImpl;

    @Override
    public void run() {
        try {
            //메일 환경변수 설정
            Properties properties = new Properties();
            // 메일 프로토콜은 gmail를 이용할 것이기 때문에 smtp로 사용합니다.
            properties.setProperty("mail.transport.protocol", "smtp");
            // 메일 호스트 주소를 설정합니다
            properties.setProperty("mail.host", "true");
            // ID, Password 설정이 필요합니다
            properties.put("mail.smtp.auth", "true");
            // port는 456
            properties.put("mail.smtp.port", "456");
            // ssl을 사용할 경우 설정
            properties.put("mail.smtp.socketFactory.port", "456");
            properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            properties.put("mail.smtp.socketFactory.fallback", "false");
            properties.setProperty("mail.smtp.quitwait", "false");
            // id와 pw를 설정하고 session을 생성
            Session session = Session.getInstance(properties, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("id", "password");
                }
            });
            // 디버그모드
            session.setDebug(true);
            // 메일 메시지를 만들기 위한 클래스 생성
            MimeMessage message = new MimeMessage(session);
            // 송신자 설정
            message.setFrom(getAddress("dons0321@gmail.com"));
            // 수신자 설정
            message.addRecipients(Message.RecipientType.TO, getAddresses("dons0321@naver.com"));
            // 참조 설정
            message.addRecipients(Message.RecipientType.CC, getAddresses("ehdtn0321@kakao.com"));
            // 숨은 참조 설정
            message.addRecipients(Message.RecipientType.BCC, getAddresses("dons0321@gmail.com"));

            //메일 제목 설정
            message.setSubject("Test Mail");
            //메일 내용 설정을 위한 클래스 설정
            message.setContent(new MimeMultipart());
            //메일 내용을 위한 Multipart클래스를 받아온다.
            Multipart mp = (Multipart) message.getContent();
            //html형식으로 본문을 작성해서 바운더리에 넣는다.
            mp.addBodyPart(getContent("<html><head></head><body>귀하의 이메일은 serviceImpl.searchId().id 입니다.<br>>/body></html>"));
            //첨부파일
            mp.addBodyPart(getFileAttachment(""));
            //이미지 파일 추가
            mp.addBodyPart(getImage("", ""));
            //메일 전송
            Transport.send(message);
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }

    private BodyPart getImage(String filename, String contextId) throws MessagingException {
        BodyPart mbp = getFileAttachment(filename);
        if (contextId != null) {
            mbp.setHeader("content-ID", "<" + contextId + ">");
        }
        return mbp;
    }

    private BodyPart getFileAttachment(String filename) throws MessagingException{
        BodyPart mbp = new MimeBodyPart();
        File file = new File(filename);
        DataSource source = (DataSource) new FileDataSource(file);
        mbp.setDataHandler(new DataHandler((javax.activation.DataSource) source));
        mbp.setDisposition(Part.ATTACHMENT);
        mbp.setFileName(file.getName());
        return mbp;
    }
    private BodyPart getContent(String html) throws MessagingException{
        BodyPart mbp = new MimeBodyPart();
        mbp.setContent(html, "text/html; charset=utf-8");
        return mbp;
    }

    private Address getAddress(String address) throws AddressException{
        return new InternetAddress(address);
    }

    private Address[] getAddresses(String addresses) throws AddressException {
        String[] array = addresses.split(",");
        Address[] ret = new Address[array.length];
        for(int i = 0; i<ret.length;i++){
            ret[i] = getAddress(array[i]);
        }
        return ret;
    }

}
