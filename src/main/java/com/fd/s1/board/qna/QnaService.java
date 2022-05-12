package com.fd.s1.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fd.s1.util.FileManager;
import com.fd.s1.util.Pager;

@Service
public class QnaService {

	@Autowired
	private QnaMapper qnaMapper;

	@Autowired
	private FileManager fileManager;

	public List<QnaVO> getQnaList(Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(qnaMapper.getTotal());
		return qnaMapper.getQnaList(pager);
	}

	public QnaVO getQnaDetail(QnaVO qnaVO) throws Exception {
		return qnaMapper.getQnaDetail(qnaVO);
	}

	@Transactional(rollbackFor = Exception.class)
	public int setQnaAdd(QnaVO qnaVO, MultipartFile[] files) throws Exception {
		int result = qnaMapper.setQnaAdd(qnaVO);
		System.out.println(files[0].getName());
		if (files != null) {

			for (MultipartFile f : files) {
				if (f.isEmpty()) {
					continue;
				}
				String fileName = fileManager.fileSave(f, "upload/board/qna/");
				QnaFilesVO qnaFilesVO = new QnaFilesVO();
				qnaFilesVO.setNum(qnaVO.getNum());
				qnaFilesVO.setFileName(fileName);
				qnaFilesVO.setOriName(f.getOriginalFilename());
				result = qnaMapper.setQnaFileAdd(qnaFilesVO);
				if (result < 1) {
					throw new Exception();
				}
			}
		}
		return result;
	}

	public int setQnaUpdate(QnaVO qnaVO) throws Exception {
		return qnaMapper.setQnaUpdate(qnaVO);
	}

	public int setQnaDelete(QnaVO qnaVO) throws Exception {
		return qnaMapper.setQnaDelete(qnaVO);
	}
	
	public int setQnaFileDelete(QnaFilesVO qnaFilesVO)throws Exception{
		String fileName = qnaFilesVO.getFileName();
		String path = "upload/board/qna/";
		int result = 0;
		boolean check = fileManager.remove(fileName, path);
		if(check) {
			result = qnaMapper.setQnaFileDelete(qnaFilesVO);
		}
		return result;
	}

}
