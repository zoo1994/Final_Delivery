package com.fd.s1.delivery;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.member.MemberVO;
import com.fd.s1.menu.MenuService;
import com.fd.s1.menu.MenuVO;
import com.fd.s1.shop.ShopMenuVO;
import com.fd.s1.shop.ShopService;
import com.fd.s1.shop.ShopVO;
import com.fd.s1.util.Pager;

@Controller
@RequestMapping("/delivery/*")
public class DeliveryController {
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private ShopService shopService;
	@Autowired
	private DeliveryService deliveryService;
	
	@GetMapping("home")
	public ModelAndView deliveryHome(MenuVO menuVO, Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		pager.setCategory(menuVO.getCategory());
//		if(memberVO == null) {
//			pager.setUserType(2L);
//		}else if(memberVO.getUserType() == 0L) {
//			pager.setUserType(memberVO.getUserType());			 
//		}else {
//			pager.setUserType(1L);
//		}
//		List<MenuVO> ar = menuService.getList(pager);
//		mv.addObject("list", ar);
//		mv.addObject("category",menuVO.getCategory());
//		mv.setViewName("delivery/home");
		ShopVO shopVO = (ShopVO)session.getAttribute("shop");
		List<ShopMenuVO> ar = shopService.getShopInfo(shopVO);
		mv.addObject("list", ar);
		mv.setViewName("delivery/home");
		


		
		return mv;
	}
	
	@PostMapping("goDeli")
	public ModelAndView goDeli(Double x, Double y,String location, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		//1km 는  위도y : 1/109.958489129649955 경도x : 1/88.74
		//5km 반경구하기
		double gapX = 1/88.74;
		double gapY = 1/109.958489129649955;
		double maxX = x+gapX*5;//반경5키로
		double minX = x-gapX*5;
		double maxY = y+gapY*5;
		double minY = y-gapY*5;
		if(minX>maxX) {
			maxX=x-gapX*5;
			minX=x+gapX*5;
		}
		if(minY>maxY) {
			maxY= y-gapY*5;
			minY= y+gapY*5;
		}
		List<ShopVO> ar = deliveryService.findShops(maxX, minX, maxY, minY);
		if(ar.size()==0) {
			String message= "주문가능한 매장이 없습니다";
			String path = "/";
			mv.addObject("message",message);
			mv.addObject("path",path);
			mv.setViewName("common/joinResult");
			return mv;
		}
		double [] a = new double[ar.size()];
		for(int i =0; i<ar.size();i++) {
			a[i]=this.distance(y,x,ar.get(i).getY_axis(),ar.get(i).getX_axis());
		}
		Double min = a[0];
		int minName = 0;
		for(int j = 0 ; j<(a.length-1);j++) {
			if (min>a[j]) {
				min = a[j];
				minName=j;
			}
		}

		session.setAttribute("shop", ar.get(minName));
		session.setAttribute("location", location);
		mv.setViewName("redirect:./home");
		return mv;
	}
	
	@GetMapping("addAddress")
	public ModelAndView addAddress(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		mv.addObject("vo",memberVO);
		mv.setViewName("delivery/addAddress");
		return mv;
	}
	
	@GetMapping("cart")
	public ModelAndView cart(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		CartVO cartVO = new CartVO();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		cartVO.setId(memberVO.getId());
		List<CartVO> ar = deliveryService.getCart(cartVO);
		mv.addObject("list", ar);
		mv.setViewName("delivery/cart");
		return mv;
		
	}
	
	
	@PostMapping("cartAdd")
	public ModelAndView setCartAdd(HttpSession session,CartVO cartVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		cartVO.setId(memberVO.getId());
		int result = deliveryService.setCartAdd(cartVO);
		mv.addObject("result", result);		
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView update(CartVO cartVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = deliveryService.update(cartVO);
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView delete(CartVO cartVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = deliveryService.delete(cartVO);
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("order")
	public ModelAndView getOrder(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		CartVO cartVO = new CartVO();
		cartVO.setId(memberVO.getId());
		List<CartVO> ar = deliveryService.getCart(cartVO);
		mv.addObject("list", ar);
		mv.setViewName("delivery/order");
		return mv;
	}
	
	@PostMapping("order")
	public ModelAndView order(OrdersVO ordersVO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		ordersVO.setId(memberVO.getId());
		int result= deliveryService.orderAdd(ordersVO);
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("payment")
	public ModelAndView payment(PaymentVO paymentVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = deliveryService.payAdd(paymentVO);
		mv.addObject("result", result);
		mv.addObject("pay", paymentVO);
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("orderComplite")
	public ModelAndView orderComplite()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("delivery/orderComplite");
		return mv;
	}
    // 거리구하기 식
    private static double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }
     
    // 거리구하기 실
    private static double rad2deg(double rad) {
        return (rad * 180 / Math.PI);
    }
    
    private double distance(double lat1, double lon1, double lat2, double lon2) {
        
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
         
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        dist = dist * 1609.344;
       
 
        return (dist);
    }
	
}


