package com.fd.s1.coupon;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.Random;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fd.s1.admin.AdminMapper;
import com.fd.s1.member.MemberVO;

@SpringBootTest
public class CouponTest2 {

	@Autowired
	private AdminMapper adminMapper;
	
	@Test
	void setAddTest()throws Exception{
//		Random rd = new Random();
//		int result1=0;
//		for(int i=100;i<205;i++) {
//			if(i%10 ==0) {
//				Thread.sleep(1000);
//			}
////			VALUES (#{id},#{pw},#{name},#{email},#{phone},0,#{gender},#{roadAddress},#{detailAddress},#{birth},0)
//			CouponVO couponVO = new CouponVO();
//			couponVO.setCouponId(null);
//			couponVO.setCouponName("c"+i);
//			Long result = rd.nextLong(1,8);
//			couponVO.setActiveDate(result);
//			Long [] dis = {1000L,2000L,3000L,1000L,2000L,3000L,4000L};
//			couponVO.setDiscount(dis[result.intValue()-1]);
//			result1 += adminMapper.setCouponAdd(couponVO);
//		}
//		System.out.println("Finish");
//		assertEquals(105, result1);
	}
	
	
	
}
