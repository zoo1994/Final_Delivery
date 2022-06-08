package com.fd.s1.shop;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fd.s1.delivery.OrdersVO;
import com.fd.s1.member.MemberVO;
import com.fd.s1.util.Pager;

@Service
public class ShopService {
	
	@Autowired
	private ShopMapper shopMapper;
	
	public int setChaneSale(ShopVO shopVO) throws Exception{
		return shopMapper.setChaneSale(shopVO);
	}
	
	public List<ShopStopVO> getStopList()throws Exception{
		return shopMapper.getStopList();
	}
	
	public int setStopDel(ShopStopVO shopStopVO) throws Exception{
		return shopMapper.setStopDel(shopStopVO);
	};
	
	public ShopStopVO getShopStop(ShopVO shopVO) throws Exception{
		return shopMapper.getShopStop(shopVO);
	};
	
	public int setShopStop(ShopStopVO shopStopVO) throws Exception {
		return shopMapper.setShopStop(shopStopVO);
	}
	
	public int setMenu(ShopMenuVO shopMenuVO) throws Exception {
		return shopMapper.setMenu(shopMenuVO);
	}
	
	public List<ShopMenuVO> getList(ShopMenuVO shopMenuVO) throws Exception {
		return shopMapper.getList(shopMenuVO);
	}
	
	public ShopVO getShopNum(MemberVO memberVO) throws Exception {
		return shopMapper.getShopNum(memberVO);
	}
	
	public int setUpdateSale(ShopMenuVO shopMenuVO) throws Exception {
		return shopMapper.setUpdateSale(shopMenuVO);
	}
	
	public int setUpdateShopSystem(ShopVO shopVO) throws Exception {
		return shopMapper.setUpdateShopSystem(shopVO);
	}
	
	public List<ShopMenuVO> getShopInfo(ShopVO shopVO, Integer category) throws Exception {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("category", category);
		map.put("shopVO", shopVO);
		return shopMapper.getShopInfo(map);
	}
	
	public List<OrdersVO> getShopOrderList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(shopMapper.getOrderTotal(pager));
		return shopMapper.getShopOrderList(pager);
	}
	
	public List<SettlementVO> getSettlement(SettlementVO settlementVO)throws Exception{
		return shopMapper.getSettlement(settlementVO);
	}

}
