package com.fd.s1.delivery;

import com.fd.s1.menu.MenuVO;

import lombok.Data;

@Data
public class OrderDetailVO {
	
	private Long detailNum;
	private Long deliNum;
	private String payNum;
	private Integer menuNum;
	private Integer shopNum;
	private Long orderCount;
	private Long menuPrice;
	
	private MenuVO menuVO;
}
