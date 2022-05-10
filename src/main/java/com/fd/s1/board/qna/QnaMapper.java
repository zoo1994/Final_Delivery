package com.fd.s1.board.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QnaMapper {

	public List<QnaVO> getQnaList() throws Exception;

	public QnaVO getQnaDetail(QnaVO qnaVO)throws Exception;
	
	public int setQnaAdd(QnaVO qnaVO)throws Exception;
	
	public int setQnaUpdate(QnaVO qnaVO)throws Exception;

	public int setQnaDelete(QnaVO qnaVO)throws Exception;
}
