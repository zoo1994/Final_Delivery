package com.fd.s1.admin;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fd.s1.coupon.CouponVO;
import com.fd.s1.member.MemberVO;
import com.fd.s1.shop.ShopVO;
import com.fd.s1.util.FileManager;
import com.fd.s1.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private FileManager fileManager;
	
	public ShopVO getShopDetail(ShopVO shopVO) throws Exception {
		return adminMapper.getShopDetail(shopVO);
	}
	
	public List<ShopVO> getShopMaster() throws Exception {
		return adminMapper.getShopMaster();
	}
	
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
	
	//관리자 shop관리 - update
	public int setShopUpdate(ShopVO shopVO) throws Exception{	
		return adminMapper.setShopUpdate(shopVO);
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
	
	public List<BannerFileVO> getBannerFileList() throws Exception {
		return adminMapper.getBannerFileList();
	}
	
	public int setBannerFileAdd(MultipartFile [] files) throws Exception {
		int result = 0;
		if(files != null) {
			for(MultipartFile f : files) {
				if(f.isEmpty()) {
					continue;
				}
				String fileName = fileManager.fileSave(f, "resources/upload/banner/");
				BannerFileVO bannerFileVO = new BannerFileVO();
				bannerFileVO.setFileName(fileName);
				bannerFileVO.setOriName(f.getOriginalFilename());
				result = adminMapper.setBannerFileAdd(bannerFileVO);
				if(result < 1) {
					throw new Exception();
				}
			}
		}
		return result;
	}
	
	public int setBannerFileDelete(BannerFileVO bannerFileVO) throws Exception {
		String fileName = bannerFileVO.getFileName();
		String path = "resources/upload/banner/";
		int result = 0;
		boolean check = fileManager.remove(fileName, path);
		if(check) {
			result = adminMapper.setBannerFileDelete(bannerFileVO);
		}
		return result;
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
