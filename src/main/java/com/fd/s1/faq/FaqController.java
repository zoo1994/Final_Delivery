package com.fd.s1.faq;

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

import com.fd.s1.util.Pager;

@Controller
@RequestMapping("/faq/*")
public class FaqController {

	@Autowired
	private FaqService faqService;


	@PostMapping("delete")
	public ModelAndView setDelete(FaqVO faqVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = faqService.setDelete(faqVO);
		
		mv.setViewName("redirect:./list");
		return mv;
		
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(@Valid FaqVO faqVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = faqService.setUpdate(faqVO);
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(@ModelAttribute FaqVO faqVO, ModelAndView mv)throws Exception{
		faqVO = faqService.getDetail(faqVO);
		mv.setViewName("faq/update");
		mv.addObject("faqVO", faqVO);
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(FaqVO faqVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(faqVO.getNum());
		mv.setViewName("faq/detail");
		faqVO = faqService.getDetail(faqVO);
		
		mv.addObject("vo", faqVO);
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(@Valid FaqVO faqVO, ModelAndView mv)throws Exception{

		int result = faqService.setAdd(faqVO);
		
		mv.setViewName("redirect:./list");
		return mv;		
	}
	
	@GetMapping("add")
	public String setAdd(@ModelAttribute FaqVO faqVO)throws Exception{
		
		return "faq/add";
	}
	
	@GetMapping("list")
	public ModelAndView getList(Pager pager, FaqVO faqVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FaqVO> ar = faqService.getList(pager, faqVO);
		mv.setViewName("faq/list");
		Long count = faqService.getListCount(pager, faqVO);
		mv.addObject("count", count);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);		
		return mv;
	}
	
	@GetMapping("list1")
	public ModelAndView getList1(Pager pager, FaqVO faqVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FaqVO> ar = faqService.getList(pager, faqVO);
		mv.setViewName("faq/faqResult");
		Long count = faqService.getListCount(pager, faqVO);
		pager.setKind(""+faqVO.getCategory());
		mv.addObject("count", count);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);		
		return mv;
	}	
	
}
