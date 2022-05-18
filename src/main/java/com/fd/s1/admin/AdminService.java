package com.fd.s1.admin;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fd.s1.coupon.CouponVO;
import com.fd.s1.member.MemberVO;
import com.fd.s1.shop.ShopVO;
import com.fd.s1.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;

	
	//관리자 shop관리 - 리스트
	public List<ShopVO> getShop(Pager pager, Long count)throws Exception{
		pager.makeRow();
		pager.makeNum(count);		
		return adminMapper.getShop(pager);
	}
	
	//관리자 shop관리 - add
	public int setShopAdd(ShopVO shopVO) throws Exception{	
		return adminMapper.setShopAdd(shopVO);
	}
	
	//관리자 shop관리 - delete
	public int setShopDelete(ShopVO shopVO) throws Exception{	
		return adminMapper.setShopDelete(shopVO);
	}
	
	//관리자 shop관리 - count
	public Long getShopListCount(Pager pager) throws Exception{	
		return adminMapper.getShopTotalCount(pager);
	}
	
	
	//관리자 멤버관리 - 리스트
	public List<MemberVO> getMember(Pager pager)throws Exception{

		pager.makeRow();
		pager.makeNum(adminMapper.getTotalCount(pager));
		System.out.println(pager.getPerPage());
		
		return adminMapper.getMember(pager);
	}
	
	//관리자 멤버관리 - count
	public Long getListCount(Pager pager) throws Exception{	
		return adminMapper.getTotalCount(pager);
	}
	
	
	public int setMemberGrade(MemberVO memberVO)throws Exception{

		if(memberVO != null) {
			return adminMapper.setMemberGrade(memberVO);
		}
		
		return 0;
	}
	
	
	
	//관리자 쿠폰관리 - 리스트
	public List<CouponVO> getCoupon(Pager pager, Long count)throws Exception{		
		pager.makeRow();
		pager.makeNum(count);
		System.out.println(pager.getPerPage());
		return adminMapper.getCoupon(pager);
	}
	
	//관리자 쿠폰관리 - count
	public Long getCouponListCount(Pager pager) throws Exception{	
		return adminMapper.getCouponTotalCount(pager);
	}
	
	//관리자 쿠폰관리 - add
	public int setCouponAdd(CouponVO couponVO) throws Exception{	
		return adminMapper.setCouponAdd(couponVO);
	}
	
	//관리자 쿠폰관리 - delete
	public int setCouponDelete(CouponVO couponVO) throws Exception{	
		return adminMapper.setCouponDelete(couponVO);
	}
	
	
/*	public int setDelete(AdminVO faqVO, MemberVO memberVO)throws Exception{	
				
		if(memberVO != null) {
			memberVO = memberMapper.idCheck(memberVO);
		}else {
			return 0;
		}
		
		if(memberVO.getUserType() == 2L) {
			return adminMapper.setDelete(faqVO);
		}else {
			return 0;
		}
		
		
	}
	
	public int setUpdate(AdminVO faqVO)throws Exception{			
		return adminMapper.setUpdate(faqVO);
	}
	
	public AdminVO getDetail(AdminVO faqVO)throws Exception{
		return adminMapper.getDetail(faqVO);
	}
	
	public int setAdd(AdminVO faqVO)throws Exception{		
		return adminMapper.setAdd(faqVO);
	}
	
	public List<AdminVO> getList(Pager pager, AdminVO faqVO)throws Exception{
		EtcVO etcVO = new EtcVO();
		etcVO.setCategory(faqVO.getCategory());
		etcVO.setSearch(pager.getSearch());

		
		pager.makeRow();
		pager.makeNum(adminMapper.getTotalCount(etcVO));
		
		etcVO.setPerPage(pager.getPerPage());
		etcVO.setStartRow(pager.getStartRow());
		
		return adminMapper.getList(etcVO);
	}
	
	public Long getListCount(Pager pager, AdminVO faqVO) throws Exception{	
		EtcVO etcVO = new EtcVO();
		etcVO.setCategory(faqVO.getCategory());
		etcVO.setSearch(pager.getSearch());
		return adminMapper.getTotalCount(etcVO);
	}	
*/	
}
