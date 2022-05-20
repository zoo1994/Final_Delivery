package com.fd.s1.shop;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.admin.AdminMapper;
import com.fd.s1.admin.AdminService;
import com.fd.s1.member.MemberVO;
import com.fd.s1.menu.MenuService;
import com.fd.s1.menu.MenuVO;
import com.fd.s1.util.Pager;

@Controller
@RequestMapping("/shop/*")
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	@Autowired
	private AdminService adminService;
	
	@GetMapping("sellerMain")
	public ModelAndView getMain() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/sellerMain");
		
		return mv;
	}
	
	@GetMapping("shopStop")
	public ModelAndView shopStop(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		ShopVO shopVO = new ShopVO();
		shopVO.setId(memberVO.getId());
		shopVO = adminService.getShopDetail(shopVO);
		mv.addObject("vo",shopVO);
		mv.setViewName("shop/shopStop");
		return mv;
	}
	
	//각 점포 메뉴 list
	@GetMapping("shopMenu")
	public ModelAndView getCeoMain(Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		//로그인한 session 정보 받아와 해당 id의 매장번호 받아오기
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		ShopVO shopVO =  shopService.getShopNum(memberVO);
		ShopMenuVO shopMenuVO = new ShopMenuVO();
		shopMenuVO.setShopNum(shopVO.getShopNum());
		//해당 매장의 메뉴 list
		List<ShopMenuVO> ar = shopService.getList(shopMenuVO);
		
		mv.addObject("shopMaster", shopVO);
		
		
		mv.addObject("allMenuList", ar);
		 
		mv.setViewName("shop/shopMenu");
		
		return mv;
	}
	
	//메뉴 상태변경용 ajax 
	@PostMapping("shopMenu")
	public ModelAndView setUpdateSale(ShopMenuVO shopMenuVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(shopMenuVO.getSale());
		int result = shopService.setUpdateSale(shopMenuVO);
		mv.setViewName("common/result");
		mv.addObject("result",result);
		return mv;
	}
	
	@GetMapping("shopSystem")
	public ModelAndView getShopSystem(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		ShopVO shopVO = new ShopVO();
		shopVO.setId(memberVO.getId());
		shopVO = adminService.getShopDetail(shopVO);
		mv.addObject("shopMaster", shopVO);
		mv.addObject("vo",shopVO);
		mv.setViewName("shop/shopSystem");
		
		return mv;
	}
	
	@PostMapping("setUpdateShopSystem")
	public ModelAndView setUpdateShopSystem(ShopVO shopVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(shopVO.getShopName());
		int result = shopService.setUpdateShopSystem(shopVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/result");
		
		return mv;
	}
}
