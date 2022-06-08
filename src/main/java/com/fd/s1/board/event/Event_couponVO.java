package com.fd.s1.board.event;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import com.fd.s1.coupon.CouponVO;

import lombok.Data;

@Data
public class Event_couponVO {
	private Long eventNum;
	private Long couponId;
	private Date eventSchedule;
	private CouponVO couponVO;

}
