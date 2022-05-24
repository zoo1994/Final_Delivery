package com.fd.s1.delivery;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrdersVO {
	
	private Long deliNum;
	private String payNum;
	private String id;
	private String address;
	private String phone;
	private String request;
	private Integer coupon;
	private Date orderDate;
	private Long totalPrice;
	private List<OrderDetailVO> detailVOs;
}
