package com.fd.s1.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {

	@Autowired
	private QnaMapper qnaMapper;
	
	public List<QnaVO> getQnaList()throws Exception{
		return qnaMapper.getQnaList();
	}
	
	public QnaVO getQnaDetail(QnaVO qnaVO)throws Exception{
		return qnaMapper.getQnaDetail(qnaVO);
	}
	
	public int setQnaAdd(QnaVO qnaVO)throws Exception{
		return qnaMapper.setQnaAdd(qnaVO);
	}
	
	public int setQnaUpdate(QnaVO qnaVO)throws Exception{
		return qnaMapper.setQnaUpdate(qnaVO);
	}

	public int setQnaDelete(QnaVO qnaVO)throws Exception{
		return qnaMapper.setQnaDelete(qnaVO);
	}
	
}
