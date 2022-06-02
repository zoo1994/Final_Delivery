package com.fd.s1.admin;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class notificationTest{
	
	@Test
	public void getnotification()throws Exception{
		System.out.println("start");
		  String host = "smtp.gmail.com";
		  String user = "macdoManager";
		  String password = "macdo0610";//jgfsxeczynjbxfdc
		  
		  
		  String from = "macdoManager.gmail.com";
		  String to = "watmoon34@gmail.com";

		  
		  // Get the session object
		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.ssl.enable", "true");
		  props.put("mail.smtp.ssl.trust", host);
		  Session session = Session.getDefaultInstance(props, new Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
			   return new PasswordAuthentication(user, password);
		   }
		  });

		  // Compose the message
		   Message message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(from));
		   message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));

		   // Subject
		   message.setSubject("[Subject] Java Mail Test");
		   
		   // Text
		   message.setText("Simple mail test..");

		   // send the message
		   Transport.send(message);
		   System.out.println("message sent successfully...");
		
		
	}
	
	
}
