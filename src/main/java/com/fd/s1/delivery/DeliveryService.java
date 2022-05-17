package com.fd.s1.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fd.s1.menu.MenuMapper;
import com.fd.s1.menu.MenuVO;

@Service
public class DeliveryService {

	@Autowired
	private DeliveryMapper deliveryMapper;
	
	@Autowired
	private MenuMapper menuMapper;
	
	public List<CartVO> getCart(CartVO cartVO)throws Exception{
		List<CartVO> ar = deliveryMapper.getCart(cartVO);
		
		if(ar.size()>0) {
			for(CartVO c:ar) {
				MenuVO menuVO = new MenuVO();
				menuVO.setMenuNum(c.getMenuNum());
				menuVO = menuMapper.getDetail(menuVO);
				c.setMenuVO(menuVO);
			}
		}
		return ar;
	}
	
	public int setCartAdd(CartVO cartVO)throws Exception {
		CartVO check = deliveryMapper.addCheck(cartVO);
		if(check!=null) {
			return 0;
		}
		return deliveryMapper.setCartAdd(cartVO);
	}
	
	public int update(CartVO cartVO)throws Exception{
		return deliveryMapper.update(cartVO);
	}
	
}
