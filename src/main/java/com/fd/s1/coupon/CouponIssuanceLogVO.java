package com.fd.s1.coupon;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponIssuanceLogVO {
	private Long logNum;
	private Long couponId;
	private Long count;
	private String couponNum;
	private String detail;
	private Date issuanceDate;
	
}
