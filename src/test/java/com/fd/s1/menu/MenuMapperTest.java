package com.fd.s1.menu;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MenuMapperTest {

	@Autowired
	private MenuMapper menuMapper;
	
	//@Test
	public void getListTest() throws Exception {
		List<MenuVO> ar = menuMapper.getList();
		assertEquals(1, ar.size());			
	}
	
	//@Test
	public void setUpdateTest() throws Exception {
		MenuVO menuVO = new MenuVO();
		menuVO.setMenuNum(1);
		menuVO.setMenuName("1955® 버거");
		menuVO.setPrice(8200);
		menuVO.setMenuDetail("113g 두툼한 순 쇠고기 패티, 특별한 1955 소스에 깊은 풍미의 그릴드 어니언까지! 맥도날드가 처음 생긴 1955년의 맛을 담은 영원한 오리지널 1955 버거");
		menuVO.setMenuSale(0);
		menuVO.setCategory(1);
		int result = menuMapper.setUpdate(menuVO);
		assertEquals(1, result);
	}
	
	//@Test
	public void getDetailTest() throws Exception {
		MenuVO menuVO = new MenuVO();
		menuVO.setMenuNum(3);
		menuVO = menuMapper.getDetail(menuVO);
		assertNotNull(menuVO);
	}
	
	@Test
	public void setDeleteTest() throws Exception {
		MenuVO menuVO = new MenuVO();
		menuVO.setMenuNum(3);
		int result = menuMapper.setDelete(menuVO);
		assertEquals(1, result);
	}

}
