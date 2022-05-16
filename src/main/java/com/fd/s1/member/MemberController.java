package com.fd.s1.member;


import java.time.LocalDate;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@Autowired
	private MemberCheck memberCheck;
	
	@GetMapping("update")
	public ModelAndView update(HttpSession session ,@ModelAttribute MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = (MemberVO)session.getAttribute("member");
		memberVO = memberService.idCheck(memberVO);
		mv.addObject("vo",memberVO);
		mv.setViewName("member/update");
		return mv;
	}
	
	@PostMapping("updateCheck")
	public ModelAndView updateCheck(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "./updateCheck";
		String message = "비밀번호가 일치하지 않습니다.";
		System.out.println(memberVO.getId());
		System.out.println(memberVO.getPw());
		memberVO = memberService.login(memberVO);
		if(memberVO!=null) {
			path = "./update";
			message = "비밀번호 인증 완료";
		}
		mv.addObject("path",path);
		mv.addObject("message",message);
		mv.setViewName("common/joinResult");
		return mv;
	}
	
	@GetMapping("updateCheck")
	public ModelAndView updateCheck(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		mv.addObject("vo",memberVO);
		mv.setViewName("member/updateCheck");
		return mv;
	}
	
	@GetMapping("mypage")
	public ModelAndView mypage(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		memberVO = memberService.idCheck(memberVO);
		mv.addObject("vo",memberVO);
		mv.setViewName("member/mypage");
		return mv;
	}
	
	@GetMapping("join")
	public ModelAndView join(@ModelAttribute MemberVO memberVO)throws  Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/join");
		return mv;
	}
	
	@PostMapping("join")
	public ModelAndView join(@Valid MemberVO memberVO,BindingResult bindingResult)throws  Exception{
		ModelAndView mv = new ModelAndView();
		String path = "/";
		String message = "회원가입이 완료되었습니다.";
		if(memberCheck.memberError(memberVO, bindingResult)) {
			mv.setViewName("member/join");
			return mv;
		}
		LocalDate birth = memberCheck.makeBirth(memberVO.getYear(), memberVO.getMonth(), memberVO.getDay());
		memberVO.setBirth(birth);
		int result = memberService.join(memberVO);
		if(result<1) {
			path="member/join";
			message="회원가입 실패";
		}
		mv.addObject("path",path);
		mv.addObject("message",message);
		mv.setViewName("common/joinResult");
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@PostMapping("login")
	public ModelAndView login(HttpSession session, MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();

		memberVO = memberService.login(memberVO);
		String message = "로그인 실패";
		String path = "./login";
		if(memberVO!=null) {
			message="로그인 성공";
			path = "/";
			session.setAttribute("member",memberVO);
		}
		mv.addObject("path",path);
		mv.addObject("message",message);
		mv.setViewName("common/joinResult");
		return mv;
	}
	
	@GetMapping("login")
	public ModelAndView login()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/login");
		return mv;
	}
	
}
