package com.fd.s1.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fd.s1.coupon.CouponVO;
import com.fd.s1.member.MemberVO;
import com.fd.s1.util.Pager;
@Mapper
public interface AdminMapper {
	public List<MemberVO> getMember(Pager pager)throws Exception;
	public int setMemberGrade(MemberVO memberVO)throws Exception;
	public Long getTotalCount(Pager pager)throws Exception;
	public List<CouponVO> getCoupon(Pager pager)throws Exception;
	public Long getCouponTotalCount(Pager pager)throws Exception;
	public int setCouponAdd(CouponVO couponVO)throws Exception;
	/*
	public Long getTotal()throws Exception;
	
	public List<AdminVO> getList(EtcVO etcVO)throws Exception;
	
	public AdminVO getDetail(AdminVO faqVO)throws Exception;
	
	public int setAdd(AdminVO faqVO)throws Exception;
	
	public int setUpdate(AdminVO faqVO)throws Exception;
	
	public int setDelete(AdminVO faqVO)throws Exception;
	
	public Long getTotalCount(EtcVO etcVO)throws Exception;
	*/
}
