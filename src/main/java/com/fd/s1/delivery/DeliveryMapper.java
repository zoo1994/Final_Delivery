package com.fd.s1.delivery;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fd.s1.shop.ShopVO;
import com.fd.s1.util.Pager;

@Mapper
public interface DeliveryMapper {
	
	public Long getShopTotal()throws Exception;
	
	public List<ShopVO> shopList(Pager pager)throws Exception;
	
	public List<ShopVO> findShops(Double maxX,Double minX,Double maxY,Double minY )throws Exception;

	public List<CartVO> getCart(CartVO cartVO) throws Exception;
	
	public int setCartAdd(CartVO cartVO)throws Exception;
	
	public CartVO addCheck(CartVO cartVO)throws Exception;
	
	public int update(CartVO cartVO)throws Exception;

	public int delete(CartVO cartVO)throws Exception;

	public int payAdd(PaymentVO paymentVO)throws Exception;
	
	public int orderAdd(OrdersVO ordersVO)throws Exception;
	
	public int orderDetailAdd(OrderDetailVO orderDetailVO)throws Exception;
	
	public OrdersVO getOrder(OrdersVO ordersVO)throws Exception;
	
	public List<OrdersVO> orderList(Pager pager)throws Exception;
	
	public Long getOrderTotal(Pager pager)throws Exception;
	
	public List<OrderDetailVO> getOrderDetail(OrderDetailVO orderDetailVO)throws Exception;
	
	public ShopVO findShop(ShopVO shipVO)throws Exception;
	
}
