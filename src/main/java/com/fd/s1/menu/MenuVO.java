package com.fd.s1.menu;

import java.util.List;

import lombok.Data;

@Data
public class MenuVO {

	private Integer menuNum;
	private String menuName;
	private String menuEng;
	private Integer price;
	private String menuDetail;
	private Integer menuSale;
	private Integer category;
	
	private MenuFileVO menuFileVO;
}
