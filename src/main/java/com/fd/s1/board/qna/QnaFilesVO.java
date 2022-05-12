package com.fd.s1.board.qna;

import com.fd.s1.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class QnaFilesVO extends FileVO {

	private Long num;
	
}
