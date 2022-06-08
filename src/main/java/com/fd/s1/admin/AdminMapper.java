package com.fd.s1.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.fd.s1.coupon.CouponVO;
import com.fd.s1.email.EmailVO;
import com.fd.s1.member.MemberVO;
import com.fd.s1.shop.ShopVO;
import com.fd.s1.util.Pager;
@Mapper
public interface AdminMapper {
	public List<MemberVO> getMember(Pager pager)throws Exception;
	public int setMemberGrade(MemberVO memberVO)throws Exception;
	public Long getTotalCount(Pager pager)throws Exception;
	public List<CouponVO> getCoupon(Pager pager)throws Exception;
	public Long getCouponTotalCount(Pager pager)throws Exception;
	public int setCouponAdd(CouponVO couponVO)throws Exception;
	public int setCouponDelete(CouponVO couponVO)throws Exception;
	public List<ShopVO> getShop(Pager pager)throws Exception;
	public int setShopAdd(ShopVO shopVO)throws Exception;
	public int setShopDelete(ShopVO shopVO)throws Exception;
	public int setShopUpdate(ShopVO shopVO)throws Exception;
	public Long getShopTotalCount(Pager pager)throws Exception;
	public List<ShopVO> getShopMaster()throws Exception;
	public ShopVO getShopDetail(ShopVO shopVO) throws Exception;
	public Long getEmailTotalCount(Pager pager)throws Exception;
	public List<EmailVO> getEmail(Pager pager)throws Exception;
	public Long setSend(EmailVO emailVO)throws Exception;
	public Long getUserEmailCount(Pager pager)throws Exception;
	public List<MemberVO> getEmailMList(Pager pager)throws Exception;
	public String [] getAll()throws Exception;
	public String [] getSeller()throws Exception;
	public String [] getUser()throws Exception;
	public List<BannerFileVO> getBannerFileList() throws Exception;
	public int setBannerFileAdd(BannerFileVO bannerFileVO) throws Exception;
	public int setBannerFileDelete(BannerFileVO bannerFileVO) throws Exception;
	public List<ShopVO> getShopList() throws Exception;
//	public int setCouponDelete(CouponVO couponVO)throws Exception;
	
	
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
