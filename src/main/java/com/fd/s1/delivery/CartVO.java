package com.fd.s1.delivery;

import lombok.Data;

@Data
public class CartVO {

	private Long cartNum;
	private String id;
	private Long menuNum;
	private Long shopNum;
	private Long count;
	private Long totalprice;
	
	
}
