package com.fd.s1.ceo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.menu.MenuService;
import com.fd.s1.menu.MenuVO;
import com.fd.s1.util.Pager;

@Controller
@RequestMapping("/ceo/*")
public class CeoController {
	
	@Autowired
	private CeoService ceoService;
	@Autowired
	private MenuService menuService;
	
	@GetMapping("sellerMain")
	public ModelAndView getMain() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ceo/sellerMain");
		
		return mv;
	}
	
	@GetMapping("ceoMenu")
	public ModelAndView getCeoMain(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ceo/ceoMenu");
		pager.setUserType(1L);
		List<MenuVO> ar = menuService.getList(pager);
		mv.addObject("allMenuList", ar);
		
		return mv;
	}
}
