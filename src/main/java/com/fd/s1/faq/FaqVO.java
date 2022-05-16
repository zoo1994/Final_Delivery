package com.fd.s1.faq;

import java.sql.Date;

import lombok.Data;
@Data
public class FaqVO {
	private Long num;
	private String id;
	private String title;
	private String contents;
	private Long category;
	private Date regDate;	
}
