package com.fd.s1.delivery;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fd.s1.shop.ShopVO;

@Mapper
public interface DeliveryMapper {
	
	public List<ShopVO> findShops(Double maxX,Double minX,Double maxY,Double minY )throws Exception;

	public List<CartVO> getCart(CartVO cartVO) throws Exception;
	
	public int setCartAdd(CartVO cartVO)throws Exception;
	
	public CartVO addCheck(CartVO cartVO)throws Exception;
	
	public int update(CartVO cartVO)throws Exception;

	public int delete(CartVO cartVO)throws Exception;
}
