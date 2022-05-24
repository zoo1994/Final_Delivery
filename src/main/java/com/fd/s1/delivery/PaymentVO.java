package com.fd.s1.delivery;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentVO {
	
	private String payNum;
	private Integer type;
	private Long price;
	private Date payDate;
	
}
