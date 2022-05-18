package com.fd.s1.shop;

import com.fd.s1.menu.MenuVO;

import lombok.Data;

@Data
public class ShopMenuVO {
	
	private Integer menuNum;
	private Integer shopNum;
	private Integer sale;
	
	private MenuVO menuVO;
	
}
