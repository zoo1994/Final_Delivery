package com.fd.s1.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeliveryService {

	@Autowired
	private DeliveryMapper deliveryMapper;
	
	public List<CartVO> getCart(CartVO cartVO)throws Exception{
		return deliveryMapper.getCart(cartVO);
	}
	
	public int setCartAdd(CartVO cartVO)throws Exception {
		return deliveryMapper.setCartAdd(cartVO);
	}
	
}
