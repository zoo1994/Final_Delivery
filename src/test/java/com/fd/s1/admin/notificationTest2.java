package com.fd.s1.admin;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class notificationTest2{
	
	//@Test
	public void test()throws Exception{
		String a = "dddd";
		String [] b = a.split(",");
		System.out.println(b.length);
		
		for(int i=0;i<b.length;i++) {
			System.out.println(b[i]);
		}
		
//		if(b.leng)
	}
	
	
	
	@Test
	public void getnotification()throws Exception{
	       	String user = "macdomanager@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
	        String password = "jgfsxeczynjbxfdc"; // 패스워드

	        // SMTP 서버 정보를 설정한다.
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com"); 
	        prop.put("mail.smtp.port", 465); 
	        prop.put("mail.smtp.auth", "true"); 
	        prop.put("mail.smtp.ssl.enable", "true"); 
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
	        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });


            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress("watmoon34@gmail.com")); 

            // Subject
            message.setSubject("제목을 입력하세요"); //메일 제목을 입력

            // Text
            message.setText("내용을 입력하세요");    //메일 내용을 입력

            // send the message
            System.out.println(4);
            
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
	        
	}
	
	
}
