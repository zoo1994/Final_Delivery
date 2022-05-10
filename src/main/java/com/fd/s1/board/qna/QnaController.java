package com.fd.s1.board.qna;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Autowired
	private QnaService qnaService;

	@GetMapping("list")
	public ModelAndView getQnaList() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<QnaVO> ar = qnaService.getQnaList();
		mv.addObject("list", ar);
		mv.setViewName("qna/list");
		return mv;
	}

	@GetMapping("add")
	public void setQnaAdd(@ModelAttribute QnaVO qnaVO) throws Exception {
	}

	@PostMapping("add")
	public ModelAndView setQnaAdd(@Valid QnaVO qnaVO, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView();

		if (bindingResult.hasErrors()) {
			mv.setViewName("qna/add");
			System.out.println("error :"+bindingResult);
			return mv;
		}

		int result = qnaService.setQnaAdd(qnaVO);
		if (result > 0) {
			mv.addObject("result", result);
			mv.setViewName("common/result");
		}
		return mv;
	}

	@GetMapping("update")
	public ModelAndView setQnaUpdate(@ModelAttribute QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		qnaVO=qnaService.getQnaDetail(qnaVO);
		mv.addObject("qnaVO", qnaVO);
		mv.setViewName("qna/update");
		return mv;
	}

	@PostMapping("update")
	public ModelAndView setQnaUpdate(@Valid QnaVO qnaVO, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView();
		if (bindingResult.hasErrors()) {
			mv.setViewName("qna/add");
			System.out.println("error :"+bindingResult);
			return mv;
		}
		int result = qnaService.setQnaUpdate(qnaVO);

		mv.setViewName("qna/update");
		if (result > 0) {
			mv.addObject("result", result);
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView setQnaDelete(QnaVO qnaVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setQnaDelete(qnaVO);
		mv.setViewName("redirect:./list");		
		return mv;
	}

	@GetMapping("addSuccess")
	public ModelAndView qnaAddSuccess() throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}

	@GetMapping("detail")
	public ModelAndView getQnaDetail(QnaVO qnaVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		qnaVO = qnaService.getQnaDetail(qnaVO);
		mv.addObject("vo", qnaVO);
		mv.setViewName("qna/detail");
		return mv;
	}

}
