package com.fd.s1.board.qna;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class QnaVO {
	
	private Long num;
	@NotBlank(message = "id를 입력해주세요")
	private String id;
	@NotBlank
	private String location;
	@Min(value = 1)
	private Long kind;
	@Email
	private String email;
	@NotBlank
	private String phone;
	@NotBlank
	private String title;
	@NotBlank
	private String contents;
	private Date regDate;
	private Long reply;
	private Long ref;
	private Long step;
	private Long depth;
	
	
}
