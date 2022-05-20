package com.fd.s1.delivery;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeliveryMapper {

	public List<CartVO> getCart(CartVO cartVO) throws Exception;
	
	public int setCartAdd(CartVO cartVO)throws Exception;
	
	public CartVO addCheck(CartVO cartVO)throws Exception;
	
	public int update(CartVO cartVO)throws Exception;

	public int delete(CartVO cartVO)throws Exception;
	
	public int payAdd(PaymentVO paymentVO)throws Exception;
	
	public int orderAdd(OrdersVO ordersVO)throws Exception;
	
	public int orderDetailAdd(OrderDetailVO orderDetailVO)throws Exception;
	
	public OrdersVO getOrder(OrdersVO ordersVO)throws Exception;
}
