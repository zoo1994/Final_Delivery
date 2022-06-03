package com.fd.s1.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fd.s1.member.MemberVO;
import com.fd.s1.menu.MenuMapper;
import com.fd.s1.menu.MenuVO;
import com.fd.s1.shop.ShopVO;
import com.fd.s1.util.Pager;

@Service
public class DeliveryService {

	@Autowired
	private DeliveryMapper deliveryMapper;
	
	@Autowired
	private MenuMapper menuMapper;
	
	public List<ShopVO> findShops(Double maxX,Double minX,Double maxY,Double minY )throws Exception{
		return deliveryMapper.findShops(maxX, minX, maxY, minY);
	}
	
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
	
	public int delete(CartVO cartVO)throws Exception{
		return deliveryMapper.delete(cartVO);
	}
	
	public int payAdd(PaymentVO paymentVO)throws Exception{
		return deliveryMapper.payAdd(paymentVO);
	}
	
	public OrdersVO getOrder(OrdersVO ordersVO)throws Exception{
		return deliveryMapper.getOrder(ordersVO);
	}
	
	public int orderAdd(OrdersVO ordersVO)throws Exception{
		
		
		int result = deliveryMapper.orderAdd(ordersVO);
		ordersVO = deliveryMapper.getOrder(ordersVO);
		CartVO cartVO = new CartVO();
		cartVO.setId(ordersVO.getId());
		List<CartVO> ar = deliveryMapper.getCart(cartVO);
		for(CartVO c:ar) {			
		OrderDetailVO orderDetailVO = new OrderDetailVO();
		orderDetailVO.setDeliNum(ordersVO.getDeliNum());
		orderDetailVO.setMenuNum(c.getMenuNum());
		orderDetailVO.setMenuPrice(c.getTotalPrice()/c.getCount());
		orderDetailVO.setOrderCount(c.getCount());
		orderDetailVO.setPayNum(ordersVO.getPayNum());
		orderDetailVO.setShopNum(c.getShopNum());
		result = deliveryMapper.orderDetailAdd(orderDetailVO);
		result = deliveryMapper.delete(c);
		}
		return result;
	}
	
	public List<OrdersVO> orderList(Pager pager,MemberVO memberVO)throws Exception{
		pager.makeRow();
		pager.setId(memberVO.getId());
		pager.makeNum(deliveryMapper.getOrderTotal(pager));
		List<OrdersVO> ar = deliveryMapper.orderList(pager);
		return ar;
	}
	
	public List<OrderDetailVO> getOrderDetail(OrderDetailVO orderDetailVO)throws Exception{
		return deliveryMapper.getOrderDetail(orderDetailVO);
	}


	
}
