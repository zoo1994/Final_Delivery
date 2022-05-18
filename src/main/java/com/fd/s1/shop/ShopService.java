package com.fd.s1.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fd.s1.member.MemberVO;

@Service
public class ShopService {
	
	@Autowired
	private ShopMapper shopMapper;
	
	public List<ShopMenuVO> getList(ShopMenuVO shopMenuVO) throws Exception {
		return shopMapper.getList(shopMenuVO);
	}
	
	public ShopVO getCeo(MemberVO memberVO) throws Exception {
		return shopMapper.getCeo(memberVO);
	}

}
