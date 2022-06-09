package com.fd.s1.start;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.admin.AdminService;
import com.fd.s1.admin.BannerFileVO;
import com.fd.s1.board.event.EventService;
import com.fd.s1.board.event.EventVO;
import com.fd.s1.util.Pager;

@Controller
public class HomeController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private EventService eventService;
	
	@GetMapping("/")
	public ModelAndView start(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BannerFileVO> list = adminService.getBannerFileList();
		pager.setPerPage(6);
		Long count = eventService.getTotal(pager);
		
		List<EventVO> ar = eventService.getList(pager, count);
		mv.addObject("eventList",ar);
		mv.addObject("count",count);
		mv.addObject("pager",pager);
		mv.addObject("list",list);
		
		mv.setViewName("index");
		
		return mv;
	}
}
