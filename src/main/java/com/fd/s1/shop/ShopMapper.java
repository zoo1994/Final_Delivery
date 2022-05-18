package com.fd.s1.shop;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fd.s1.member.MemberVO;

@Mapper
public interface ShopMapper {
	
	public int setMenu(Map<Integer, Integer> map) throws Exception;
	
	public List<ShopMenuVO> getList(ShopMenuVO shopMenuVO) throws Exception;
	
	public ShopVO getCeo(MemberVO memberVO) throws Exception;
}
