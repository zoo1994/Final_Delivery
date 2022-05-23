package com.fd.s1.coupon;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Random;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fd.s1.admin.AdminMapper;
@SpringBootTest
public class CreateCouponRandom {
	
	@Autowired
	private AdminMapper adminMapper;
	
	//@Test
	void CreateCouponRandomTest()throws Exception{
		
		String [] randCharacter = {	"0","1","2","3","4",
									"5","6","7","8","9",
									"A","B","C","D","E",
									"F","G","H","I","J",
									"K","L","M","N","O",
									"P","Q","R","S","T",
									"U","V","W","X","Y","Z"};
//		System.out.println(randCharacter.length);
		Random rd = new Random();
//		Long result = rd.nextLong();
		int cpLength = 8;//쿠폰 글자수
		int cur =5;//생성 쿠폰 갯수
		
		System.out.println("hi1");
		while(0<cur) {
//			System.out.println(cur);
			StringBuffer sb = new StringBuffer();
			for(int i=0;i<cpLength;i++) {
				sb.append(randCharacter[rd.nextInt(36)]);
			}
			System.out.println("couponNUM : "+sb.toString());
			cur--;
		}
		

	}
	
	@Test
	void CreateCouponRandomTest1()throws Exception{
		
		String [] randCharacter = {	"0","1","2","3","4",
									"5","6","7","8","9",
									"A","B","C","D","E",
									"F","G","H","I","J",
									"K","L","M","N","O",
									"P","Q","R","S","T",
									"U","V","W","X","Y","Z"};
		
		Random rd = new Random();
		int cpLength = 8;//쿠폰 글자수
		int cur =5;//생성 쿠폰 갯수
		String [] coupon= new String[cur];//쿠폰 담을 배열
		int count =0;//쿠폰 갯수
		
		StringBuffer sb=null;
		
		while(count<cur) {
			sb = new StringBuffer();
			for(int i=0;i<cpLength;i++) {
				sb.append(randCharacter[rd.nextInt(36)]);
			}
			coupon[count] = sb.toString();
			count++;
		}
		System.out.println("dd");
		for(int i =0;i<count;i++) {
			System.out.println("couponNUM : "+coupon[i]);
		}
	}
}
