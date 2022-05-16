package com.fd.s1.board.notice;

import java.sql.Date;
import java.util.List;

import lombok.Data;
@Data
public class NoticeVO {

	private Long num;
	private String id;
	private String title;
	private String contents;
	private Date regDate;
	private Long hit;
	
	private Long searchCount;
	
	private NoticeFilesVO noticeFilesVO;
	private List<NoticeFilesVO> noticeFilesVOs;
	
}
