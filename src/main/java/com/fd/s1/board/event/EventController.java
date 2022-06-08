package com.fd.s1.board.event;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.util.Pager;

@Controller
@RequestMapping("/event/*")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@PostMapping("fileDelete")
	public ModelAndView setFileDelete(EventFilesVO fileVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = eventService.setFileDelete(fileVO);
		mv.addObject("result",result);
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView getList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		pager.setPerPage(6);
		Long count = eventService.getTotal(pager);
		
		List<EventVO> ar = eventService.getList(pager, count);
		mv.addObject("list",ar);
		
		mv.addObject("count",count);
		mv.addObject("pager",pager);
		mv.setViewName("board/event/list");
		return mv;
	}
	
	//이벤트리스트 ajax
	@GetMapping("list1")
	public ModelAndView getList1(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		pager.setPerPage(6);
		Long count = eventService.getTotal(pager);
		
		List<EventVO> ar = eventService.getList(pager, count);
		mv.addObject("list",ar);
		
		mv.addObject("count",count);
		mv.addObject("pager",pager);
		mv.setViewName("board/event/eventList");
		System.out.println(pager.getStartRow());
		System.out.println(pager.getPerPage());
		return mv;
	}
	
	
	
	@GetMapping("add")
	public ModelAndView setAdd(@ModelAttribute EventVO eventVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/event/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(@Valid EventVO eventVO,BindingResult bindingResult,MultipartFile[] files, MultipartFile[] thumbFiles, Event_couponVO ecVO)throws Exception{
		ModelAndView mv = new ModelAndView();		
		if(bindingResult.hasErrors()) {
			mv.setViewName("board/event/add");
			return mv;
		}
		int result = eventService.setAdd(eventVO,files, thumbFiles);
		if(ecVO.getCouponId() != null) {

			ecVO.setEventNum(eventVO.getEventNum());
			eventService.setEventCouponAdd(ecVO);
		}
				
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(EventVO eventVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		eventVO = eventService.getDetail(eventVO);

		if(eventVO.getEcVO().getEventSchedule() != null) {
			int compare = eventVO.getEcVO().getEventSchedule().compareTo(eventVO.getTime());
			System.out.println(compare);
			mv.addObject("compare", compare);
		}	
//		if(eventVO.getEcVO().getEventSchedule() >= eventVO.getTime()) {}
		
		mv.addObject("vo",eventVO);
		mv.setViewName("board/event/detail");
		return mv;
	}
	
	@PostMapping("delete")
	public  ModelAndView setDelete(EventVO eventVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(eventVO.getEventNum());
		int result = eventService.setDelete(eventVO);
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("update")
	public  ModelAndView setUpdate(@ModelAttribute EventVO eventVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<EventFilesVO> thumbFilesVO = eventService.getThumb(eventVO);
		eventVO = eventService.getDetail(eventVO);
		mv.addObject("thumbFilesVO",thumbFilesVO);
		mv.addObject("eventVO",eventVO);
		mv.setViewName("board/event/update");
		return mv;
	}
	
	@PostMapping("update")
	public  ModelAndView setUpdate(@Valid EventVO eventVO,BindingResult bindingResult,MultipartFile[] files, MultipartFile[] thumbFiles, Event_couponVO event_couponVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		if(event_couponVO.getEventSchedule() == null) {
			System.out.println("hi");
		}
			
		if(bindingResult.hasErrors()) {
			mv.setViewName("board/event/update");
			return mv;
		}
		eventService.setFileAdd(eventVO, files, thumbFiles);
		System.out.println(event_couponVO.getCouponId());
		System.out.println(event_couponVO.getEventSchedule());
		eventService.setUpdate(eventVO, event_couponVO);
		mv.setViewName("redirect:./list");
		return mv;
	}
}
