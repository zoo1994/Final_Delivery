package com.fd.s1.board;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fd.s1.board.notice.NoticeMapper;
import com.fd.s1.board.notice.NoticeVO;
@SpringBootTest
class NoticeTest {

	@Autowired
	private NoticeMapper noticeMapper;
	
	
	@Test
	void setAddTest()throws Exception{
		
		for(int i=0;i<100;i++) {
			if(i%10 ==0) {
				Thread.sleep(1000);
			}
			
			NoticeVO noticeVO = new NoticeVO();
			noticeVO.setTitle("addTitle"+i);
			noticeVO.setId("addWriter"+i);
			noticeVO.setContents("addContents"+i);
			int result = noticeMapper.setAdd(noticeVO);
		
		}
		System.out.println("Finish");
		//assertEquals(1, result);
	}
	
	

}
