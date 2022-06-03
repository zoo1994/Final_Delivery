package com.fd.s1.shop;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fd.s1.delivery.OrdersVO;
import com.fd.s1.member.MemberVO;

@Mapper
public interface ShopMapper {
	
	public int setChaneSale(ShopVO shopVO) throws Exception;
	
	public List<ShopStopVO> getStopList()throws Exception;
	
	public int setStopDel(ShopStopVO shopStopVO) throws Exception;
	
	public ShopStopVO getShopStop(ShopVO shopVO) throws Exception;
	
	public int setShopStop(ShopStopVO shopStopVO) throws Exception;
	
	public int setMenu(ShopMenuVO shopMenuVO) throws Exception;
	
	public List<ShopMenuVO> getList(ShopMenuVO shopMenuVO) throws Exception;
	
	public ShopVO getShopNum(MemberVO memberVO) throws Exception;
	
	public int setUpdateSale(ShopMenuVO shopMenuVO) throws Exception;

	public int setUpdateShopSystem(ShopVO shopVO) throws Exception;
	
	public List<OrdersVO> getShopOrderList(OrdersVO ordersVO)throws Exception;
	
	public List<ShopMenuVO> getShopInfo(Map<Object, Object> map) throws Exception;
	
	public List<SettlementVO> getSettlement(SettlementVO settlementVO)throws Exception;
}
