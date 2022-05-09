package com.fd.s1.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@GetMapping("list")
	public ModelAndView getQnaList()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<QnaVO> ar = qnaService.getQnaList();
		mv.addObject("list", ar);
		mv.setViewName("qna/list"); 
		return mv;
	}
	@GetMapping("add")
	public ModelAndView setQnaAdd()throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setQnaAdd(QnaVO qnaVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setQnaAdd(qnaVO);
		mv.setViewName("qna/add");
		if(result>0) {
			mv.setViewName("qna/list");
		}
		return mv;
	}
	
	@GetMapping("addSuccess")
	public ModelAndView qnaAddSuccess()throws Exception{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	@GetMapping("detail")
	public ModelAndView getQnaDetail(QnaVO qnaVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		qnaVO = qnaService.getQnaDetail(qnaVO);
		mv.addObject("vo", qnaVO);
		mv.setViewName("qna/detail");
		return mv;
	}
	
}
