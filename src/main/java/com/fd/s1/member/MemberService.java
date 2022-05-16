package com.fd.s1.member;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fd.s1.util.PhoneCheckVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	public MemberVO idCheck(MemberVO memberVO)throws Exception{
		return memberMapper.idCheck(memberVO);
	}
	
	public int delPhoneCheck(LocalDate time)throws Exception{
		return memberMapper.delPhoneCheck(time);
	}
	public int updateCount(PhoneCheckVO phoneCheckVO)throws Exception{
		return memberMapper.updateCount(phoneCheckVO);
	}
	public List<PhoneCheckVO> hourNumber(PhoneCheckVO phoneCheckVO)throws Exception{
		return memberMapper.hourNumber(phoneCheckVO);
	}
	public PhoneCheckVO numCheck(PhoneCheckVO phoneCheckVO)throws Exception{
		return memberMapper.numCheck(phoneCheckVO);
	}
	
	public int setNumCheck(PhoneCheckVO phoneCheckVO)throws Exception{
		return memberMapper.setNumCheck(phoneCheckVO);
	}
	
	public MemberVO phoneCheck(MemberVO memberVO)throws Exception{
		return memberMapper.phoneCheck(memberVO);
	}
	
	public int join(MemberVO memberVO)throws Exception{
		return memberMapper.join(memberVO);
	}
	
	public MemberVO login(MemberVO memberVO)throws Exception{
		return memberMapper.login(memberVO);
	}
	
}
