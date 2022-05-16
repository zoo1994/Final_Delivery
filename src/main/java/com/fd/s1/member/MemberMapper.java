package com.fd.s1.member;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fd.s1.util.PhoneCheckVO;

@Mapper
public interface MemberMapper {
	
	public int delPhoneCheck(LocalDate time)throws Exception;
	public int updateCount(PhoneCheckVO phoneCheckVO)throws Exception;
	public List<PhoneCheckVO> hourNumber(PhoneCheckVO phoneCheckVO)throws Exception;
	public PhoneCheckVO numCheck(PhoneCheckVO phoneCheckVO)throws Exception;
	public int setNumCheck(PhoneCheckVO phoneCheckVO)throws Exception;
	public MemberVO phoneCheck(MemberVO memberVO)throws Exception;
	public MemberVO idCheck(MemberVO memberVO)throws Exception;
	public int join(MemberVO memberVO)throws Exception;
	public  MemberVO login(MemberVO memberVO)throws Exception;
}
