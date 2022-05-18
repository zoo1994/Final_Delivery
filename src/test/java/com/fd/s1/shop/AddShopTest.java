package com.fd.s1.shop;



import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.fd.s1.admin.AdminMapper;
import com.fd.s1.member.MemberVO;

@SpringBootTest
public class AddShopTest {

	@Autowired
	private AdminMapper adminMapper;
	
	@Test
	void addShopTest()throws Exception {
		int result1=0;
		for(int i=1;i<101;i++) {
			if(i%10 ==0) {
				Thread.sleep(1000);
			}
//			VALUES (#{id},#{pw},#{name},#{email},#{phone},0,#{gender},#{roadAddress},#{detailAddress},#{birth},0)
			ShopVO shopVO = new ShopVO();
			
			shopVO.setId("b"+i);
			shopVO.setShopName("bb"+i);
			shopVO.setLocation("bbb"+i);
			shopVO.setShopPhone("010"+i);
			
//			shopVO.setOpenTime(null);
//			shopVO.setCloseTime(null);
//			shopVO.setSale(null);
//			shopVO.setDistance(null);
//			shopVO.setOpen(null);
			
			int result = adminMapper.setShopAdd(shopVO);
			result1 = result1 + result;
		}
		System.out.println("Finish");
		assertEquals(100, result1);
	}
	
}
