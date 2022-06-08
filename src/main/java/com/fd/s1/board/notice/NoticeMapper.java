package com.fd.s1.board.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fd.s1.util.Pager;


@Mapper
public interface NoticeMapper {
	
	public Long getTotal()throws Exception;
	
	//public List<NoticeFilesVO> getFileList(NoticeVO noticeVO)throws Exception;
	
	public int setFileAdd(NoticeFilesVO noticeFilesVO)throws Exception;
	
	public NoticeFilesVO getFileDetail(NoticeFilesVO noticeFilesVO)throws Exception;
	
	public int setFileDelete(NoticeFilesVO noticeFilesVO)throws Exception;
	
	public List<NoticeVO> getList(Pager pager)throws Exception;
	
	public NoticeVO getDetail(NoticeVO noticeVO)throws Exception;
	
	public int setHit(NoticeVO noticeVO)throws Exception;
	
	public int setAdd(NoticeVO noticeVO)throws Exception;
	
	public int setUpdate(NoticeVO noticeVO)throws Exception;
	
	public int setDelete(NoticeVO noticeVO)throws Exception;
	
	public Long getTotalCount(Pager pager)throws Exception;
	
	
}

