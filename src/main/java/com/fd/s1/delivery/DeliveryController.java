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
import com.fd.s1.util.Pager;

@Controller
@RequestMapping("/delivery/*")
public class DeliveryController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private DeliveryService deliveryService;
	
	@GetMapping("home")
	public ModelAndView deliveryHome(MenuVO menuVO, Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		pager.setCategory(menuVO.getCategory());
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		if(memberVO == null) {
			pager.setUserType(2L);
		}else if(memberVO.getUserType() == 0L) {
			pager.setUserType(memberVO.getUserType());			 
		}else {
			pager.setUserType(1L);
		}
		List<MenuVO> ar = menuService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("category",menuVO.getCategory());
		mv.setViewName("delivery/home");
		
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
	
}


