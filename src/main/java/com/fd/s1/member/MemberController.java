package com.fd.s1.member;


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
@RequestMapping("member/*")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("join")
	public ModelAndView join(@ModelAttribute MemberVO memberVO)throws  Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/join");
		return mv;
	}
	
	@PostMapping("join")
	public ModelAndView join(@Valid MemberVO memberVO,BindingResult bindingResult)throws  Exception{
		ModelAndView mv = new ModelAndView();
		if(memberService.memberError(memberVO, bindingResult)) {
			mv.setViewName("member/join");
			return mv;
		}
		mv.setViewName("redirect:./");
		return mv;
	}
}
