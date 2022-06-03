package com.fd.s1.delivery;

import com.fd.s1.menu.MenuVO;

import lombok.Data;

@Data
public class CartVO {

	private Long cartNum;
	private String id;
	private Integer menuNum;
	private Integer shopNum;
	private Long count;
	private Long totalPrice;
	
	private MenuVO menuVO;
	
}
