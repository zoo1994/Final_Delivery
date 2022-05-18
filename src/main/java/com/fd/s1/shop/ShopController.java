package com.fd.s1.shop;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.member.MemberVO;
import com.fd.s1.menu.MenuService;
import com.fd.s1.menu.MenuVO;
import com.fd.s1.util.Pager;

@Controller
@RequestMapping("/ceo/*")
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	@Autowired
	private MenuService menuService;
	
	@GetMapping("sellerMain")
	public ModelAndView getMain() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ceo/sellerMain");
		
		return mv;
	}
	
	@GetMapping("ceoMenu")
	public ModelAndView getCeoMain(Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		ShopVO shopVO =  shopService.getCeo(memberVO);
		pager.setUserType(1L);
	//	List<ShopMenuVO> ar = shopService.getList(null)
		
		
	//	mv.addObject("allMenuList", ar);
		 
		mv.setViewName("ceo/ceoMenu");
		
		return mv;
	}
}
