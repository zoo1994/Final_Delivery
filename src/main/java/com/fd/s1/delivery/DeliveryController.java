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

@Controller
@RequestMapping("/delivery/*")
public class DeliveryController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private DeliveryService deliveryService;
	
	@GetMapping("home")
	public ModelAndView deliveryHome(MenuVO menuVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		menuVO.setMenuSale(1); //일반사용자에겐 판매가능 메뉴만 보이게끔
		List<MenuVO> ar = menuService.getList(menuVO);
		mv.addObject("list", ar);
		mv.addObject("category",menuVO.getCategory());
		mv.setViewName("delivery/home");
		
		return mv;
	}
	
	@GetMapping("cart")
	public ModelAndView getCart(HttpSession session) throws Exception {
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
	
}


