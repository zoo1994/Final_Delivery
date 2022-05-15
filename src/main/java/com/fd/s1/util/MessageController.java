package com.fd.s1.util;

import java.time.LocalDateTime;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.member.MemberService;
import com.fd.s1.member.MemberVO;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RestController
public class MessageController {
	@Value("${apikey}")
	private String apikey;
	@Value("${apiSecret}")
	private String apiSecret;
	@Autowired
	private MemberService memberService;
	
//	휴대폰인증 프로세스
//	휴대폰번호 형식이 맞는지 확인
//	db에 휴대폰번호가 있는지 확인한다
//	있으면 있는번호 
//	없으면 메세지전송
//	메시지 전송후 5분이내에 입력
//  입력횟수제한
//	하루 최대 5번 횟수제한
//	하루가 지나면 db클리어
// db에 휴대폰 번호가 있는지 확인
	
	@PostMapping("/send")
	public ModelAndView sendMessage(MemberVO memberVO)throws Exception{
		ModelAndView mv  = new ModelAndView();
		Random random = new Random();
		int a = random.nextInt(10);
		int b = random.nextInt(10);
		int c = random.nextInt(10);
		int d = random.nextInt(10);
		String checkNum = String.valueOf(a)+String.valueOf(b)+String.valueOf(c)+String.valueOf(d);
		String phone= memberVO.getPhone();
		mv.setViewName("common/result");
		//db에서 핸드폰번호중복검사
		memberVO = memberService.phoneCheck(memberVO);
		if(memberVO!=null) {
			mv.addObject("result","이미 등록된 핸드폰번호입니다.");
			return mv;
		}
		//this.sendOne(phone, checkNum);
		PhoneCheckVO phoneCheckVO = new PhoneCheckVO();
		LocalDateTime time = LocalDateTime.now();
		phoneCheckVO.setPhone(phone);
		phoneCheckVO.setCheckNumber(checkNum);
		phoneCheckVO.setRequestTime(time);
		memberService.setNumCheck(phoneCheckVO);
		mv.addObject("result","");
		return mv;
	}
	
	@PostMapping("/checkNum")
	public ModelAndView checkNum(PhoneCheckVO phoneCheckVO,String num)throws Exception{
		ModelAndView mv  = new ModelAndView();
		mv.setViewName("common/result");
		phoneCheckVO = memberService.numCheck(phoneCheckVO);
		System.out.println(phoneCheckVO.getCheckNumber());
		if(phoneCheckVO.getCheckNumber().equals(num)) {
			mv.addObject("result","인증이 성공하였습니다.");
		}else {
			mv.addObject("result","인증번호가 다릅니다.");
		}
		return mv;
	}
	
	public SingleMessageSentResponse sendOne(String phone, String checkNum) {

		DefaultMessageService ms= NurigoApp.INSTANCE.initialize(apikey,apiSecret, "https://api.coolsms.co.kr");
		Message message = new Message();
		message.setFrom("01084162122");
		message.setTo(phone);
		message.setText("인증번호 : "+checkNum);
		SingleMessageSentResponse response =  ms.sendOne(new SingleMessageSendingRequest(message));
		return response;
		
	}
	
}
