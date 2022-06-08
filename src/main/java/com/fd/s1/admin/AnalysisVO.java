package com.fd.s1.admin;

import java.sql.Date;

import lombok.Data;
@Data
public class AnalysisVO {
/*	private Long num;
	private String id;
	private String title;
	private String contents;
	private Long category;
	private Date regDate;	*/
	
	private String y_month;
	private double won;
	private Long user;
	
	private String weekday;
	private int hour;
	private Long value;
	
	private String shopName;
	private String gender;
	private String ageGroup;
}
