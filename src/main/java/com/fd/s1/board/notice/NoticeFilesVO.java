package com.fd.s1.board.notice;

import com.fd.s1.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeFilesVO extends FileVO{
	private Long noticeNum;
}
