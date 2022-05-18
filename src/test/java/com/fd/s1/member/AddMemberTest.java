package com.fd.s1.member;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fd.s1.board.notice.NoticeMapper;
import com.fd.s1.board.notice.NoticeVO;
@SpringBootTest
class AddMemberTest {

	@Autowired
	private MemberMapper memberMapper;
	
	@Test
	void setAddTest()throws Exception{
		
		for(int i=2;i<100;i++) {
			if(i%10 ==0) {
				Thread.sleep(1000);
			}
//			VALUES (#{id},#{pw},#{name},#{email},#{phone},0,#{gender},#{roadAddress},#{detailAddress},#{birth},0)
			MemberVO memberVO = new MemberVO();
			memberVO.setId("t"+i);
			memberVO.setPw("t"+i);
			memberVO.setName("t"+i);
			memberVO.setEmail("t"+i+"@naver.com");
			memberVO.setPhone("01011111111");
			memberVO.setGender(0L);
			memberVO.setRoadAddress("경기 부천시 경인로 605");
			memberVO.setDetailAddress("t"+i);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("uuuu-MM-dd",Locale.KOREA);
			memberVO.setBirth(LocalDate.parse("1997-05-05",formatter));
			int result = memberMapper.join(memberVO);
		
		}
		System.out.println("Finish");
		//assertEquals(1, result);
	}
}
