package com.fd.s1.member;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Random;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MeberCheckTest {
	//@Test
	public void memberCheck()throws Exception {
		String phone = "01012345678";
		String phone1 = phone.substring(0, 3);
		System.out.println(phone1);
		assertEquals("010", phone1);
	}
	//@Test
	public void member() throws Exception{
		char a = 'ㄱ';
		char b = '1';
		System.out.println(Character.isDigit(a));
		System.out.println(Character.isDigit(b));
	}
	//@Test
	public void random() {
		Random random = new Random();
		System.out.println(random.nextInt(10000));
		System.out.println(random.nextInt(10000));
		System.out.println(random.nextInt(10000));
	}
}
