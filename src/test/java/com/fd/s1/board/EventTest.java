package com.fd.s1.board;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import com.fd.s1.board.event.EventMapper;
import com.fd.s1.board.event.EventVO;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.MessageListRequest;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@SpringBootTest
public class EventTest {
	
	@Autowired
	private EventMapper eventMapper;
	
	
	 @Value("${apikey}") 
	 private String apikey;
	
	@Value("${apiSecret}")
	private String apiSecret;
	
	private DefaultMessageService messageService;
	
	//@Test
	public void listTest()throws Exception{
		//List<EventVO> ar = eventMapper.getList();
		//assertEquals(1, ar.size());
	}
	
//	public EventTest() {
//		this.messageService = NurigoApp.INSTANCE.initialize(apikey,apiSecret, "https://api.coolsms.co.kr");
//	}
//	
//	@Test
//	public void messageTest() {
//		DefaultMessageService ms= NurigoApp.INSTANCE.initialize(apikey,apiSecret, "https://api.coolsms.co.kr");
//		assertNotNull(ms);
//	}
	
	//@Test
	public void sendOne() {
		System.out.println("실행");
		DefaultMessageService ms= NurigoApp.INSTANCE.initialize(apikey,apiSecret, "https://api.coolsms.co.kr");
		Message message = new Message();
		message.setFrom("01084162122");
		message.setTo("01082968416");
		message.setText("실험");
		SingleMessageSentResponse response =  ms.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);
		
	}
	
	//@Test
	public void addTest()throws Exception{
		for(int i =  0; i<0 ;i++) {
		EventVO eventVO = new EventVO();
		eventVO.setContents("testcon"+i);
		eventVO.setId("eventid0"+i);
		eventVO.setTitle("testti"+i);
		int result = eventMapper.setAdd(eventVO);
		assertEquals(1, result);
		}
	}
	
}
