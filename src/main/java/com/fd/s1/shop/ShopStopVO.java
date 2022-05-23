package com.fd.s1.shop;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ShopStopVO {
	private Integer num;
	private Integer shopNum;
	private LocalDateTime startTime;
	private LocalDateTime finishTime;
	private Integer reason;

}
