package com.fd.s1.board.event;

import com.fd.s1.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class EventFilesVO extends FileVO{
	private Long eventNum;
}
