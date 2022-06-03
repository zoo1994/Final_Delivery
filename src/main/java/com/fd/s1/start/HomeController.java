package com.fd.s1.start;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.admin.AdminService;
import com.fd.s1.admin.BannerFileVO;

@Controller
public class HomeController {
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/")
	public ModelAndView start()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BannerFileVO> list = adminService.getBannerFileList();
		System.out.println(list.size());
		mv.addObject("list",list);
		
		mv.setViewName("index");
		
		return mv;
	}
}
