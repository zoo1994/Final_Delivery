package com.fd.s1.shop;

import java.sql.Date;

import lombok.Data;

@Data
public class SettlementVO {

	private String menuName;
	private Long sumC;
	private Long sumP;
	private Integer shopNum;
	private Date startDate;
	private Date endDate;
}
