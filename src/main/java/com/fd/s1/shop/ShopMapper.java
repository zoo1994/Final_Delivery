package com.fd.s1.shop;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.fd.s1.member.MemberVO;

@Mapper
public interface ShopMapper {
	
	public int setMenu(ShopMenuVO shopMenuVO) throws Exception;
	
	public List<ShopMenuVO> getList(ShopMenuVO shopMenuVO) throws Exception;
	
	public ShopVO getShopNum(MemberVO memberVO) throws Exception;
	
	public int setUpdateSale(ShopMenuVO shopMenuVO) throws Exception;
}
