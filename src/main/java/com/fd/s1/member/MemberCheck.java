package com.fd.s1.member;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.ResolverStyle;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
@Service
public class MemberCheck {
	@Autowired
	private MemberMapper memberMapper;
	
	public boolean memberError(MemberVO memberVO, BindingResult bindingResult)throws Exception{
		boolean check = false;
		check = bindingResult.hasErrors();
		List<FieldError> ar = bindingResult.getFieldErrors();
		for(FieldError i:ar ) {
			System.out.println(i.getField());
		}
		//비밀번호 검증
		if(!memberVO.getPw().equals(memberVO.getCheckPw())) {
			check = true;
			bindingResult.rejectValue("checkPw","member.password.notEqual");
		}
		//성별검증
		if(memberVO.getGender()==2) {
			check = true;
			bindingResult.rejectValue("gender","member.gender.blank");
		}
		//생일검증
		Long year = (long)LocalDate.now().getYear();
		boolean birthCheck = true;
		if(memberVO.getYear()==null) {
			birthCheck= false;
		}
		if(memberVO.getYear()!=null) {
			if(memberVO.getYear()>=year||memberVO.getYear()<year-150) {
				check = true;
				bindingResult.rejectValue("year","member.year.check");
				birthCheck= false;
			}
		}

		if(birthCheck&&memberVO.getMonth().equals("0")) {
			check = true;
			bindingResult.rejectValue("year","member.month.blank");
			birthCheck=false;
		}
		
		if(birthCheck&&memberVO.getDay().isEmpty()) {
			check = true;
			bindingResult.rejectValue("year","member.day.blank");
		}else if(birthCheck) {
			String day = memberVO.getDay();
			if(memberVO.getDay().length()==1) {
				day="0"+day;
			}
			String birth = memberVO.getYear()+"-"+memberVO.getMonth()+"-"+day;
			if(checkDate(birth)) {
				check = true;
				bindingResult.rejectValue("year","member.day.check");
			}
		}
		//주소검증
		if(memberVO.getRoadAddress().isEmpty()) {
			check = true;
			bindingResult.rejectValue("roadAddress","member.roadAddress.blank");
		}else {
			if(memberVO.getDetailAddress().isEmpty()) {
				check = true;
				bindingResult.rejectValue("roadAddress","member.detailAddress.blank");
			}
		}
		//아이디검증 memberVO를 다시 생성하기때문에 항상 마지막에 위치해야함
		memberVO = memberMapper.idCheck(memberVO);
		if(memberVO!=null) {
			check = true;
			bindingResult.rejectValue("id", "member.id.check");
		}
		return check;
	};
	
	public boolean updateError(MemberVO memberVO, BindingResult bindingResult)throws Exception{
		boolean check = false;
		List<FieldError> ar = bindingResult.getFieldErrors();
		for(FieldError i:ar ) {
			if(i.getField().equals("email")) {
				check=true;
			}
		}
		System.out.println(check);
		//주소검증
		if(memberVO.getRoadAddress().isEmpty()) {
			check = true;
			bindingResult.rejectValue("roadAddress","member.roadAddress.blank");
		}else {
			if(memberVO.getDetailAddress().isEmpty()) {
				check = true;
				bindingResult.rejectValue("roadAddress","member.detailAddress.blank");
			}
		}
		return check;
	}
	
	public boolean pwChangeError(MemberVO memberVO, BindingResult bindingResult)throws Exception{
		boolean check = false;
		if(memberVO.getPw().length()<5||memberVO.getPw().length()>12) {
			check = true;
			bindingResult.rejectValue("pw","member.password");
		}
		System.out.println("3");
		System.out.println(check);
		if(!memberVO.getPw().equals(memberVO.getCheckPw())) {
			check = true;
			bindingResult.rejectValue("checkPw","member.password.notEqual");
		}
		System.out.println("4");
		System.out.println(check);
		return check;
	}
	
	public boolean checkDate(String checkDate) {
		try {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("uuuu-MM-dd",Locale.KOREA);
			formatter = formatter.withResolverStyle(ResolverStyle.STRICT);
			LocalDate.parse(checkDate,formatter);
			return false;
		} catch(Exception e) {
			return true;
		}
	}

	
	public LocalDate makeBirth(Long year, String month, String day) {
		if(day.length()==1) {
			day="0"+day;
		}
		String birth = year+"-"+month+"-"+day;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("uuuu-MM-dd",Locale.KOREA);
		return LocalDate.parse(birth,formatter);
	}
}
