package com.fd.s1.board;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fd.s1.board.event.EventMapper;
import com.fd.s1.board.event.EventVO;

@SpringBootTest
public class EventTest {
	
	@Autowired
	private EventMapper eventMapper;
	
	//@Test
	public void listTest()throws Exception{
		//List<EventVO> ar = eventMapper.getList();
		//assertEquals(1, ar.size());
	}
	
	@Test
	public void addTest()throws Exception{
		for(int i =  0; i<100 ;i++) {
		EventVO eventVO = new EventVO();
		eventVO.setContents("testcon"+i);
		eventVO.setId("eventid0"+i);
		eventVO.setTitle("testti"+i);
		int result = eventMapper.setAdd(eventVO);
		assertEquals(1, result);
		}
	}
	
}
