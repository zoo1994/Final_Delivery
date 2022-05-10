package com.fd.s1.menu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

@Mapper
public interface MenuMapper {
	
	public int setFileDelete(MenuFileVO menuFileVO) throws Exception;
	
	public int setFileAdd(MenuFileVO menuFileVO) throws Exception;
	
	public MenuFileVO getFileDetail(MenuFileVO menuFileVO) throws Exception;
	
	public List<MenuVO> getList() throws Exception;
	
	public int setAdd(MenuVO menuVO) throws Exception;
	
	public int setUpdate(MenuVO menuVO) throws Exception;
	
	public MenuVO getDetail(MenuVO menuVO) throws Exception;
	
	public int setDelete(MenuVO menuVO) throws Exception;
	
	
}
