package com.fd.s1.board.notice;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fd.s1.menu.MenuFileVO;
import com.fd.s1.util.FileManager;
import com.fd.s1.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private FileManager fileManager;
	
	public int setFileDelete(NoticeFilesVO noticeFilesVO)throws Exception{
		noticeFilesVO = noticeMapper.getFileDetail(noticeFilesVO);
		int result = noticeMapper.setFileDelete(noticeFilesVO);
		//int result = fileManager.fileDelete(fileName, "/resources/upload/notice/")
		if(result > 0) {
			boolean check = fileManager.remove(noticeFilesVO.getFileName(), "resources/upload/notice/");
		}
		return result;
	}
/*	
	public String setSummerFileUpload(MultipartFile files)throws Exception{
		// file HDD에 저장하고 저장된 파일명을 return
		String fileName = fileManager.fileSave(files, "resources/upload/notice");
		fileName = "/resources/upload/notice/"+fileName;
		return fileName;
	}
	
	public NoticeFilesVO getFileDetail(NoticeFilesVO noticeFilesVO)throws Exception{
		return noticeMapper.getFileDetail(noticeFilesVO);
	}
*/

	public int setDelete(NoticeVO noticeVO)throws Exception{
				
//		List<NoticeFilesVO> ar = noticeMapper.getFileList(noticeVO);
		int result = noticeMapper.setDelete(noticeVO);
		
//		System.out.println("file size : "+ar.size());
//		for(NoticeFilesVO f : ar) {
//			fileManager.fileDelete(f.getFileName(), "resources/upload/notice");
//		}
		
		return result;
	}
	
	public int setUpdate(NoticeVO noticeVO,  MultipartFile [] files)throws Exception{
		
		int result = noticeMapper.setUpdate(noticeVO);
		
		if(files != null && result >0) {
			
			for(MultipartFile mf : files) {
				
				if(mf.isEmpty()) {
					continue;
				}
				//1. File을 HDD에 저장
				 String fileName = fileManager.fileSave(mf, "resources/upload/notice/");
				 System.out.println(fileName);
				//2. 저장된 정보를 DB에 저장
				 NoticeFilesVO noticeFilesVO = new NoticeFilesVO();
				 noticeFilesVO.setNoticeNum(noticeVO.getNum());
				 noticeFilesVO.setFileName(fileName);
				 noticeFilesVO.setOriName(mf.getOriginalFilename());
				 result = noticeMapper.setFileAdd(noticeFilesVO);
				 
				 if(result <1) {
					 //notice table insert한 것도 rollback
					 throw new SQLException();
				 }
				 
			}
		}
		
		return result;
	}
	
	public NoticeVO getDetail(NoticeVO noticeVO)throws Exception{
		return noticeMapper.getDetail(noticeVO);
	}
	
	public int setAdd(NoticeVO noticeVO, MultipartFile [] files)throws Exception{
//		System.out.println("Insert 전 : "+noticeVO.getNum());
		int result = noticeMapper.setAdd(noticeVO);
//		System.out.println("Insert 후 : "+noticeVO.getNum());
		
		if(files != null && result >0) {
		
			for(MultipartFile mf : files) {
				
				if(mf.isEmpty()) {
					continue;
				}

				
				//1. File을 HDD에 저장
				 String fileName = fileManager.fileSave(mf, "resources/upload/notice/");
				 System.out.println(fileName);
				//2. 저장된 정보를 DB에 저장
				 NoticeFilesVO noticeFilesVO = new NoticeFilesVO();
				 noticeFilesVO.setNoticeNum(noticeVO.getNum());
				 noticeFilesVO.setFileName(fileName);
				 noticeFilesVO.setOriName(mf.getOriginalFilename());
				 result = noticeMapper.setFileAdd(noticeFilesVO);
				 
				 if(result <1) {
					 //notice table insert한 것도 rollback
					 throw new SQLException();
				 }
				 
			}
		}
		
		return result;//
	}
	
	public List<NoticeVO> getList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(noticeMapper.getTotalCount());
		System.out.println("start : "+pager.getStartNum());
		System.out.println("perPage : "+pager.getPerPage());
		return noticeMapper.getList(pager);
	}
	
	
}
