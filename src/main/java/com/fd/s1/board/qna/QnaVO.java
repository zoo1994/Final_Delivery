package com.fd.s1.board.qna;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVO {
	
	private Long num;
	private String id;
	private String location;
	private Long kind;
	private String email;
	private String phone;
	private String title;
	private String contents;
	private Date regDate;
	private Long reply;
	private Long ref;
	private Long step;
	private Long depth;
	
	
}
