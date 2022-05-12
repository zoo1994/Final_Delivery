package com.fd.s1.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	public MemberVO idCheck(MemberVO memberVO)throws Exception;
	public int join(MemberVO memberVO)throws Exception;
	public  MemberVO login(MemberVO memberVO)throws Exception;
}
