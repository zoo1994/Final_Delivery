package com.fd.s1.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class MessageController {
//	@Value("${apikey}")
//	private String apikey;
//	@Value("${apiSecret}")
//	private String apiSecret;
//	
//	@PostMapping("/send")
//	public SingleMessageSentResponse sendOne() {
//		System.out.println("실행");
//		DefaultMessageService ms= NurigoApp.INSTANCE.initialize(apikey,apiSecret, "https://api.coolsms.co.kr");
//		Message message = new Message();
//		message.setFrom("01084162122");
//		message.setTo("01082968416");
//		message.setText("testmessage");
//		SingleMessageSentResponse response =  ms.sendOne(new SingleMessageSendingRequest(message));
//		return response;
//		
//	}
//	
}
