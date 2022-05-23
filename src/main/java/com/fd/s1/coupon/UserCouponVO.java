package com.fd.s1.coupon;

import java.sql.Date;

import lombok.Data;

@Data
public class UserCouponVO {
	private Long num;	
	private String id;
	private Long couponId;
	private String couponNum;
	private Date downDate;
	private Long usageStatus;
	
}
