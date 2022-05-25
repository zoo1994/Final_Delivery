package com.fd.s1.board.event;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import com.fd.s1.coupon.CouponVO;

import lombok.Data;

@Data
public class EventVO {
	private Long eventNum;
	private String id;
	@NotBlank(message="제목을 입력하세요")
	private String title;
	@NotBlank(message="내용을 입력하세요")
	private String contents;
	private Date regDate;
	private Long hit;
	private List<EventFilesVO> filesVO;

	private Event_couponVO ecVO;
	private CouponVO couponVO;
	private Date time;
}
