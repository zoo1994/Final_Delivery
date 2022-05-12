package com.fd.s1.board.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fd.s1.util.Pager;

@Mapper
public interface QnaMapper {

	public List<QnaVO> getQnaList(Pager pager) throws Exception;

	public Long getTotal ()throws Exception;

	public QnaVO getQnaDetail(QnaVO qnaVO)throws Exception;
	
	public int setQnaAdd(QnaVO qnaVO)throws Exception;
	
	public int setQnaUpdate(QnaVO qnaVO)throws Exception;

	public int setQnaDelete(QnaVO qnaVO)throws Exception;
	
	public int setQnaFileAdd(QnaFilesVO qnaFilesVO)throws Exception;

	public int setQnaFileDelete(QnaFilesVO qnaFilesVO)throws Exception;
}
