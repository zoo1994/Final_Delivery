package com.fd.s1.coupon;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponVO {

	private Long couponId;
	private String couponName;
	private Long discount;
	private Long activeDate;
	
}
