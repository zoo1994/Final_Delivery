package com.fd.s1.menu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.fd.s1.shop.ShopMenuVO;
import com.fd.s1.util.Pager;

@Mapper
public interface MenuMapper {
	
	public int setDeleteMenu(ShopMenuVO shopMenuVO) throws Exception;
	
	public int setUpdateSale(MenuVO menuVO) throws Exception;
	
	public Long getTotalCount(Pager pager) throws Exception;
	
	public int setFileDelete(MenuFileVO menuFileVO) throws Exception;
	
	public int setFileAdd(MenuFileVO menuFileVO) throws Exception;
	
	public MenuFileVO getFileDetail(MenuFileVO menuFileVO) throws Exception;
	
	public List<MenuVO> getList(Pager pager) throws Exception;
	
	public int setAdd(MenuVO menuVO) throws Exception;
	
	public int setUpdate(MenuVO menuVO) throws Exception;
	
	public MenuVO getDetail(MenuVO menuVO) throws Exception;
	
	public int setDelete(MenuVO menuVO) throws Exception;
	
	public int setIngredientAdd(IngredientVO ingredientVO) throws Exception;
	
	public int setIngredientUpdate(IngredientVO ingredientVO) throws Exception;
	
	public int setShopMenuAdd(ShopMenuVO shopMenuVO) throws Exception;
	
	public Long getTotal(Pager pager)throws Exception;
}
