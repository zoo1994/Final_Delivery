package com.fd.s1.menu;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fd.s1.util.FileManager;

@Service
@Transactional(rollbackFor = Exception.class)
public class MenuService {
	
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private FileManager fileManager;
	
	public int setIngredientAdd(IngredientVO ingredientVO) throws Exception {
		return menuMapper.setIngredientAdd(ingredientVO);
	}
	
	public int setIngredientUpdate(IngredientVO ingredientVO) throws Exception {
		return menuMapper.setIngredientUpdate(ingredientVO);
	}
	
	public int setFileDelete(MenuFileVO menuFileVO) throws Exception {
		System.out.println("삭제파일번호 : "+menuFileVO.getFileNum());
		menuFileVO = menuMapper.getFileDetail(menuFileVO);
		System.out.println("삭제파일이름 : "+menuFileVO.getFileName());
		int result = menuMapper.setFileDelete(menuFileVO);
		if(result > 0) {
			boolean check = fileManager.fileDelete(menuFileVO.getFileName(), "resources/upload/menu/");
		}
		return result;
	}
	
	public List<MenuVO> getList() throws Exception{
		return menuMapper.getList(); 
	}
	
	public int setAdd(MenuVO menuVO, MultipartFile file) throws Exception {
		int result = menuMapper.setAdd(menuVO);
		
		if(file != null && result > 0) {
			
			String fileName = fileManager.fileSave(file, "resources/upload/menu/");
			System.out.println(fileName);
			
			MenuFileVO menuFileVO = new MenuFileVO();
			menuFileVO.setMenuNum(menuVO.getMenuNum());
			menuFileVO.setFileName(fileName);
			menuFileVO.setOriName(file.getOriginalFilename());
			result = menuMapper.setFileAdd(menuFileVO);
			
			if(result<1) {
				throw new SQLException();
			}
		}
		
		return result;
	}
	
	public MenuVO getDetail(MenuVO menuVO) throws Exception {
		return menuMapper.getDetail(menuVO);
	}
	
	public int setUpdate(MenuVO menuVO, MultipartFile file) throws Exception {
		int result = menuMapper.setUpdate(menuVO);
		
		if(file != null) {
			String fileName = fileManager.fileSave(file, "resources/upload/menu/");
			System.out.println(fileName);
			
			MenuFileVO menuFileVO = new MenuFileVO();
			menuFileVO.setMenuNum(menuVO.getMenuNum());
			menuFileVO.setFileName(fileName);
			menuFileVO.setOriName(file.getOriginalFilename());
			result = menuMapper.setFileAdd(menuFileVO);
		}
		
		return result;
	}
	
	public int setDelete(MenuVO menuVO) throws Exception {
		
		MenuFileVO file = new MenuFileVO();
		file.setMenuNum(menuVO.getMenuNum());
		file = menuMapper.getFileDetail(file);

		
		int result = menuMapper.setDelete(menuVO);
		
		if(result > 0) {
			if(file!=null) {
				boolean check = fileManager.fileDelete(file.getFileName(),"resources/upload/menu/");
			}
		}
		
		return result;
	}
}
