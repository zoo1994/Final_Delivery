package com.fd.s1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fd.s1.util.PhoneCheckVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
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
