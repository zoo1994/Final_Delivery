package com.fd.s1.coupon;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fd.s1.member.MemberVO;
import com.fd.s1.util.Pager;


@Mapper
public interface CouponMapper {
	public List<CouponVO> getCoupon(Pager pager)throws Exception;
	public Long getCouponTotalCount(Pager pager)throws Exception;
	
	public Long getCouponActiveDate(UserCouponVO userCouponVO)throws Exception;
	public Long setUserCoupon(UserCouponVO userCouponVO)throws Exception;	
	public Long getOverlap(UserCouponVO userCouponVO)throws Exception;
	public Long getCouponLog(UserCouponVO userCouponVO)throws Exception;
	
	public Long getTotal(Pager pager)throws Exception;
	
	public List<CouponVO> getList(Pager pager)throws Exception;
	
	public CouponVO getDetail(CouponVO couponVO)throws Exception;
	
	public int setAdd(CouponVO couponVO)throws Exception;
	
	public int setUpdate(CouponVO couponVO)throws Exception;
	
	public int setDelete(CouponVO couponVO)throws Exception;

	//update coupon Usagestatus
	public int setExpiration()throws Exception;

	//상품주문
	public List<UserCouponVO> getUserCoupon(UserCouponVO userCouponVO)throws Exception;
	
	public UserCouponVO getSelectUserCoupon(UserCouponVO userCouponVO)throws Exception;
	
	public int setUserCouponDelete(UserCouponVO userCouponVO)throws Exception;
	//상품주문 끝
}
