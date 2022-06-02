package com.fd.s1.coupon;

import java.sql.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class UserCouponVO {
	
	private Long num;	
	private String id;
	private Long couponId;
//	@NotBlank(message = "쿠폰 8자를 입력하세요.")	//@Size(max = 8, min = 8)
	private String couponNum;
	private Date downDate;
	private Long usageStatus;
	private CouponVO couponVO;

	//couponVO - activeDate
	private Long activeDate;
	
}
