package com.fd.s1.member;


import java.time.LocalDate;
import java.util.List;

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

import com.fd.s1.coupon.UserCouponVO;
import com.fd.s1.delivery.CartVO;
import com.fd.s1.delivery.DeliveryService;


@Controller
@RequestMapping("member/*")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberCheck memberCheck;
	@Autowired
	private DeliveryService deliveryService;
	
	@PostMapping("findPw")
	public ModelAndView findPw(MemberVO memberVO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		String path ="/"; 
		String message = "입력정보와 일치하는 가입정보가 없습니다.";
		memberVO =  memberService.findPw(memberVO);
		if(memberVO!=null) {
			session.setAttribute("checkPw", "ok");
			session.setAttribute("id", memberVO.getId());
			mv.setViewName("redirect:./pwChange");
			return mv;
		}
		mv.addObject("path",path);
		mv.addObject("message",message);
		mv.setViewName("common/joinResult");
		return mv;
	}
	
	@GetMapping("findPw")
	public ModelAndView findPw()throws Exception{
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("member/findPw");
		return mv;
	}
	
	@PostMapping("findId")
	public ModelAndView findId(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		String path ="/"; 
		String message = "입력정보와 일치하는 가입정보가 없습니다.";
		memberVO = memberService.findId(memberVO);
		if(memberVO!=null) {
			message="ID : "+memberVO.getId();
		}
		mv.addObject("path",path);
		mv.addObject("message",message);
		mv.setViewName("common/joinResult");
		return mv;
	}
	
	@GetMapping("findId")
	public ModelAndView findId()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/findId");
		return mv;
	}
	
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
//	mypage - coupon 등록
	@GetMapping("cpRegister")
	public ModelAndView cpRegister(@ModelAttribute UserCouponVO userCouponVO, HttpSession session)throws Exception{				
		ModelAndView mv = new ModelAndView();

		mv.setViewName("member/cpRegister");
		return mv;
	}

	@GetMapping("cpRegister2")
	public ModelAndView cpRegister2(@ModelAttribute UserCouponVO userCouponVO, HttpSession session)throws Exception{				
		ModelAndView mv = new ModelAndView();

		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		if(memberVO == null) {
			mv.setViewName("member/cpRegister");
			return mv;
		}


		userCouponVO.setId(memberVO.getId());
		List<UserCouponVO> userCouponVOs =  memberService.getUserCoupon(userCouponVO);

		mv.addObject("list",userCouponVOs);
		mv.setViewName("member/userCouponList");
		return mv;
	}
	
	@PostMapping("cpRegister")
	public ModelAndView cpRegister(@Valid UserCouponVO userCouponVO, BindingResult bindingResult, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();

		
		MemberVO memberVO = (MemberVO)(session.getAttribute("member"));
		userCouponVO.setId(memberVO.getId());
		int result = memberService.setCpRegister(userCouponVO);


		mv.addObject("result",result);
		mv.setViewName("common/result");
		return mv;
	}
//	mypage - coupon 등록	end
	
	
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
		if(session.getAttribute("checkPw")!=null&&session.getAttribute("checkPw").equals("ok")) {
			memberVO.setId((String) session.getAttribute("id"));
			memberService.setPwChange(memberVO);
			mv.addObject("path",path);
			mv.addObject("message",message);
			mv.setViewName("common/joinResult");
			session.removeAttribute("checkPw");
			session.removeAttribute("id");
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
			memberService.setUserLog(memberVO);			
			message="로그인 성공";
			path = "/";
			session.setAttribute("member",memberVO);
			CartVO cartVO = new CartVO();
			cartVO.setId(memberVO.getId());
			List<CartVO> ar = deliveryService.getCart(cartVO);
			for(CartVO c:ar) {
				deliveryService.delete(c);
			}
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
