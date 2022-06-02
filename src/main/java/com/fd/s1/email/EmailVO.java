package com.fd.s1.email;

import java.sql.Date;

import lombok.Data;

@Data
public class EmailVO {

	private Long emailNum;
	private String receiver;
	private String title;
	private String contents;
	private Date sendDate;
	
	
}
