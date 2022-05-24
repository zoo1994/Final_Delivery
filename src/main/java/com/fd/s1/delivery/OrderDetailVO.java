package com.fd.s1.delivery;

import lombok.Data;

@Data
public class OrderDetailVO {
	
	private Long detailNum;
	private Long deliNum;
	private String payNum;
	private Integer menuNum;
	private Long shopNum;
	private Long orderCount;
	private Long menuPrice;
	
}
