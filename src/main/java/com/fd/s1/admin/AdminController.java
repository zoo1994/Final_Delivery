package com.fd.s1.admin;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fd.s1.coupon.CouponVO;
import com.fd.s1.member.MemberVO;
import com.fd.s1.menu.MenuService;
import com.fd.s1.menu.MenuVO;
import com.fd.s1.shop.ShopMenuVO;
import com.fd.s1.shop.ShopService;
import com.fd.s1.shop.ShopVO;
import com.fd.s1.util.Pager;


@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private ShopService shopService;
	@Autowired
	private MenuService menuService;

	//관리자 마이페이지
	@GetMapping("manager")
	public ModelAndView getList()throws Exception{
		ModelAndView mv = new ModelAndView();
		

		mv.setViewName("admin/manager");
		return mv;
		
	}
	
	
	//관리자 회원관리
	@GetMapping("member")
	public ModelAndView getMember(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		/*
		 * List<MemberVO> memberVOs = adminService.getMember(pager);
		 * mv.addObject("list", memberVOs);
		 */
		mv.setViewName("admin/member");
		return mv;
		
	}
	
	//관리자 회원관리 ajax
	@GetMapping("member1")
	public ModelAndView getMember1(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(pager.getPn());
		System.out.println(pager.getSearch());
		List<MemberVO> memberVOs = adminService.getMember(pager);
		Long count = adminService.getListCount(pager);
		mv.addObject("count", count);
		mv.addObject("list", memberVOs);
		mv.addObject("pager", pager);
		mv.setViewName("admin/memberList");
		return mv;
	}
	
	
	//관리자 회원관리 - 회원등급 조정
	@PostMapping("mgUpdate")
	public ModelAndView setMemberGrade(MemberVO memverVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(memverVO.getId());
		System.out.println(memverVO.getUserType());
		int result = adminService.setMemberGrade(memverVO);
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
		
	}
	
	
	//관리자 쿠폰관리
	@GetMapping("coupon")
	public ModelAndView getCoupon(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		/*
		 * List<MemberVO> memberVOs = adminService.getMember(pager);
		 * mv.addObject("list", memberVOs);
		 */
		mv.setViewName("admin/coupon");
		return mv;
		
	}
	//관리자 쿠폰관리 ajax
	@GetMapping("coupon1")
	public ModelAndView getCoupon1(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		Long count = adminService.getCouponListCount(pager);
		if(count !=0) {
			List<CouponVO> couponVOs = adminService.getCoupon(pager, count);
			mv.addObject("list", couponVOs);
		}	
		mv.addObject("count", count);
		mv.addObject("pager", pager);
		mv.setViewName("admin/couponList");
		return mv;
	}
	
	//관리자 쿠폰관리 - 생성
	@PostMapping("cpAdd")
	public ModelAndView setCouponAdd(CouponVO couponVO)throws Exception{
		ModelAndView mv = new ModelAndView();

		int result = adminService.setCouponAdd(couponVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("cpDelete")
	public ModelAndView setCouponDelete(CouponVO couponVO)throws Exception{
		ModelAndView mv = new ModelAndView();

		int result = adminService.setCouponDelete(couponVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
	}

	//관리자 회원관리
	@GetMapping("shop")
	public ModelAndView getShop(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
/*		
		List<CeoVO> shopVOs = adminService.getShop(pager);
//		Long count = adminService.getListCount(pager);
//		mv.addObject("count", count);
		mv.addObject("list", shopVOs);
		mv.addObject("pager", pager);
*/		
		
		mv.setViewName("admin/shop");
		return mv;
		
	}
	
	//관리자 회원관리
	@GetMapping("shop1")
	public ModelAndView getShop1(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		Long count = adminService.getShopListCount(pager);	
		List<ShopVO> shopVOs = adminService.getShop(pager, count);

		mv.addObject("count", count);
		mv.addObject("list", shopVOs);
		mv.addObject("pager", pager);
		
		
		mv.setViewName("admin/shopList");
		return mv;
		
	}
	//관리자 쿠폰관리 - 생성
	@PostMapping("shopAdd")
	public ModelAndView setShopAdd(ShopVO shopVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = adminService.setShopAdd(shopVO);
		ShopMenuVO shopMenuVO = new ShopMenuVO();
		shopMenuVO.setShopNum(shopVO.getShopNum());
		//매장 추가시 매장메뉴 같이 추가
		int result2 = shopService.setMenu(shopMenuVO);
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("shopDelete")
	public ModelAndView setShopDelete(ShopVO shopVO)throws Exception{
		ModelAndView mv = new ModelAndView();

		int result = adminService.setShopDelete(shopVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("shopUpdate")
	public ModelAndView setShopUpdate(ShopVO shopVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(shopVO.getX_axis());
		System.out.println(shopVO.getY_axis());
		int result = adminService.setShopUpdate(shopVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
	}
	
	//관리자 메뉴 list
	@GetMapping("menuManage")
	public ModelAndView getMenuManage(MenuVO menuVO,Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		pager.setUserType(memberVO.getUserType());			
		pager.setCategory(menuVO.getCategory());
		List<MenuVO> ar = menuService.getList(pager);
		mv.addObject("list",ar);
		mv.setViewName("admin/menuManage");
		return mv;
	}
	
	//메뉴 상태 변경용 ajax
	@PostMapping("menuManage")
	public ModelAndView getMenuManage(MenuVO menuVO, Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = menuService.setUpdateSale(menuVO);
		Long count = adminService.getShopListCount(pager);
		System.out.println("menuVO : "+menuVO.getMenuNum());
		System.out.println("count : "+count);
		System.out.println("menuSale : "+menuVO.getMenuSale());
		List<ShopVO> ar = adminService.getShop(pager, count);
		if(menuVO.getMenuSale() != 1) {
				ShopMenuVO shopMenuVO = new ShopMenuVO();
				shopMenuVO.setMenuNum(menuVO.getMenuNum());
				result = menuService.setDeleteMenu(shopMenuVO);
				System.out.println("result : "+result);				
		}else {
			for(int i = 0; i<ar.size();i++) {
				ShopMenuVO shopMenuVO = new ShopMenuVO();
				shopMenuVO.setMenuNum(menuVO.getMenuNum());
				shopMenuVO.setShopNum(ar.get(i).getShopNum());
				result = menuService.setShopMenuAdd(shopMenuVO);
				System.out.println("result : "+result);
			}
		}
		mv.setViewName("common/result");
		mv.addObject("result",result);
		
		return mv;
	}
	
	@GetMapping("bannerManage")
	public ModelAndView getBannerManage() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BannerFileVO> list = adminService.getBannerFileList();
		mv.addObject("list", list);
		mv.setViewName("admin/bannerManage");
		return mv;
	}
	
	@GetMapping("bannerAdd")
	public ModelAndView getBannerAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BannerFileVO> list = adminService.getBannerFileList();
		mv.addObject("list", list);
		mv.addObject("admin/bannerAdd");
		
		return mv;
	}
	
	@PostMapping("bannerAdd")
	public ModelAndView getBannerAdd(MultipartFile [] files) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = adminService.setBannerFileAdd(files);
		mv.setViewName("redirect:./bannerManage");
		return mv;
	}
	
	@GetMapping("bannerUpdate")
	public ModelAndView getBannerUpdate() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BannerFileVO> list = adminService.getBannerFileList();
		mv.addObject("list", list);
		mv.addObject("admin/bannerUpdate");
		
		return mv;
	}
	
	@PostMapping("fileDelete")
	public ModelAndView setBannerFileDelete(BannerFileVO bannerFileVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = adminService.setBannerFileDelete(bannerFileVO);
		mv.setViewName("common/result");
		mv.addObject("result", result);
		return mv;
	}
	
/*
	@PostMapping("delete")
	public ModelAndView setDelete(FaqVO faqVO, MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = faqService.setDelete(faqVO, memberVO);
		mv.addObject("result", result);
		mv.setViewName("common/result");
		return mv;
		
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(@Valid FaqVO faqVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = faqService.setUpdate(faqVO);
		mv.setViewName("redirect:./list");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(@ModelAttribute FaqVO faqVO, ModelAndView mv)throws Exception{
		faqVO = faqService.getDetail(faqVO);
		mv.setViewName("faq/update");
		mv.addObject("faqVO", faqVO);
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(FaqVO faqVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(faqVO.getNum());
		mv.setViewName("faq/detail");
		faqVO = faqService.getDetail(faqVO);
		
		mv.addObject("vo", faqVO);
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(@Valid FaqVO faqVO, ModelAndView mv)throws Exception{

		int result = faqService.setAdd(faqVO);
		
		mv.setViewName("redirect:./list");
		return mv;		
	}
	
	@GetMapping("add")
	public String setAdd(@ModelAttribute FaqVO faqVO)throws Exception{
		
		return "faq/add";
	}
	
	@GetMapping("list")
	public ModelAndView getList(Pager pager, FaqVO faqVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FaqVO> ar = faqService.getList(pager, faqVO);
		mv.setViewName("faq/list");
		Long count = faqService.getListCount(pager, faqVO);
		mv.addObject("count", count);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);		
		return mv;
	}
	
	@GetMapping("list1")
	public ModelAndView getList1(Pager pager, FaqVO faqVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<FaqVO> ar = faqService.getList(pager, faqVO);
		mv.setViewName("faq/faqResult");
		Long count = faqService.getListCount(pager, faqVO);
		pager.setKind(""+faqVO.getCategory());
		mv.addObject("count", count);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);		
		return mv;
	}	
*/	
}