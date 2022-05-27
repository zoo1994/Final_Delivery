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
	
	@PostMapping("delMem")
	public ModelAndView delMember(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		String path ="/"; 
		String message = "회원탈퇴 되었습니다";
		int result = memberService.delMem(memberVO);
		if(result<1) {
			message="회원탈퇴가 실패하였습니다";
		}
		mv.addObject("path",path);
		mv.addObject("message",message);
		mv.setViewName("common/joinResult");
		return mv;
	}
	
	@GetMapping("pwChange")
	public ModelAndView pwChange(@ModelAttribute MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/pwChange");
		return mv;
	}
	
	@PostMapping("pwChange")
	public ModelAndView pwChange(MemberVO memberVO,BindingResult bindingResult,String password,HttpSession session )throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "/";
		String message = "비밀번호 변경이 완료되었습니다.";
		if(memberCheck.pwChangeError(memberVO, bindingResult)) {
			mv.setViewName("member/pwChange");
			return mv;
		}
		String pw = memberVO.getPw();
		MemberVO memberVO2 = (MemberVO)session.getAttribute("member");
		memberVO.setPw(password);
		memberVO.setId(memberVO2.getId());
		memberVO = memberService.login(memberVO);
		int result = 0;
		if(memberVO!=null) {
			memberVO.setPw(pw);
			result = memberService.setPwChange(memberVO);
		}else {
			path="./pwChange";
			message="기존 비밀번호가 틀립니다.";
			mv.addObject("path",path);
			mv.addObject("message",message);
			mv.setViewName("common/joinResult");
			return mv;
		}
		if(result<1) {
			path="member/pwChange";
			message="비밀번호 변경 실패";
		}
		mv.addObject("path",path);
		mv.addObject("message",message);
		mv.setViewName("common/joinResult");
		return mv;
	}
	
	@PostMapping("idCheck")
	public ModelAndView idCheck(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		String message="중복된 아이디입니다.";
		memberVO = memberService.idCheck(memberVO);
		if(memberVO==null) {
			message="사용 가능한 아이디입니다.";
		}
		mv.addObject("result",message);
		mv.setViewName("common/result");
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView update(HttpSession session ,@ModelAttribute MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		String a = (String)session.getAttribute("check");
		String path = "/";
		String message = "정상적인 접근이 아닙니다.";
		if(a==null) {
			mv.addObject("path",path);
			mv.addObject("message",message);
			mv.setViewName("common/joinResult");
			return mv;
		}else if(!a.equals("ok")) {
			mv.addObject("path",path);
			mv.addObject("message",message);
			mv.setViewName("common/joinResult");
			return mv;
		}
		session.removeAttribute("check");
		memberVO = (MemberVO)session.getAttribute("member");
		memberVO = memberService.idCheck(memberVO);
		mv.addObject("vo",memberVO);
		mv.setViewName("member/update");
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView update(@Valid MemberVO memberVO,BindingResult bindingResult)throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "/";
		String message = "개인정보 변경이 완료되었습니다.";
		if(memberCheck.updateError(memberVO, bindingResult)) {
			mv.setViewName("member/update");
			return mv;
		}
		int result = memberService.setUpdate(memberVO);
		if(result<1) {
			path="member/update";
			message="정보수정 실패";
		}
		mv.addObject("path",path);
		mv.addObject("message",message);
		mv.setViewName("common/joinResult");
		return mv;
	}
	
	@PostMapping("updateCheck")
	public ModelAndView updateCheck(MemberVO memberVO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		String path = "./updateCheck";
		String message = "비밀번호가 일치하지 않습니다.";
		memberVO = memberService.login(memberVO);
		if(memberVO!=null) {
			path = "./update";
			message = "비밀번호 인증 완료";
			session.setAttribute("check","ok");
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
	public ModelAndView mypage(HttpSession session,@ModelAttribute MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = (MemberVO)session.getAttribute("member");
		memberVO = memberService.idCheck(memberVO);
		mv.addObject("vo",memberVO);
		mv.setViewName("member/mypage");
		return mv;
	}
	
	@GetMapping("join")
	public ModelAndView join(@ModelAttribute MemberVO memberVO,HttpSession session)throws  Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = (MemberVO)session.getAttribute("member");
		if(memberVO!=null) {
			String path = "/";
			String message = "정상적인 접근이 아닙니다.";
			mv.addObject("path",path);
			mv.addObject("message",message);
			mv.setViewName("common/joinResult");
			return mv;
		}
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
	public ModelAndView login(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("member/login");
		return mv;
	}
	
}
