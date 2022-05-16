package com.fd.s1.board.notice;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.util.FileManager;
import com.fd.s1.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	
	@Autowired
	private NoticeService noticeService;

	@ModelAttribute("board")
	public String getBoard() {
		return "Notice";
	}
	@PostMapping("fileDelete")
	public ModelAndView setFileDelete(NoticeFilesVO noticeFilesVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setFileDelete(noticeFilesVO);

		mv.setViewName("common/result");
		mv.addObject("result", result);
		return mv;
	}

	@PostMapping("delete")
	public ModelAndView setDelete(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setDelete(noticeVO);
		
		mv.setViewName("redirect:./list");
		return mv;
		
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(@Valid NoticeVO noticeVO, ModelAndView mv, MultipartFile [] files)throws Exception{
		
		int result = noticeService.setUpdate(noticeVO, files);
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(@ModelAttribute NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		noticeVO = noticeService.getDetail(noticeVO);
		mv.setViewName("notice/update");
		mv.addObject("noticeVO", noticeVO);
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(noticeVO.getNum());
		mv.setViewName("notice/detail");
		noticeVO = noticeService.getDetail(noticeVO);
		
		/*
		 * System.out.println(noticeVO.getId());
		 * System.out.println(noticeVO.getTitle());
		 * System.out.println(noticeVO.getContents());
		 */
		mv.addObject("vo", noticeVO);
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(@Valid NoticeVO noticeVO, MultipartFile [] files)throws Exception{
		ModelAndView mv = new ModelAndView();
		for(int i=0;i<files.length;i++) {	
			System.out.println("OriginalFilename : "+files[i].getOriginalFilename());
			System.out.println("size : "+files[i].getSize());
		}
		int result = noticeService.setAdd(noticeVO, files);
		
		mv.setViewName("redirect:./list");
		return mv;		
	}
	
	@GetMapping("add")
	public String setAdd(@ModelAttribute NoticeVO noticeVO)throws Exception{
		
		return "notice/add";
	}
	
	@GetMapping("list")
	public ModelAndView getList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<NoticeVO> ar = noticeService.getList(pager);
		Long count = noticeService.getListCount(pager);
		mv.setViewName("notice/list");
		mv.addObject("count", count);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		return mv;
	}

	
	
}
