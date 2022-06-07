package com.fd.s1.admin;



import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.fd.s1.coupon.CouponVO;
import com.fd.s1.coupon.UserCouponVO;
import com.fd.s1.email.EmailVO;
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
	
	//관리자 쿠폰"생성"
	@GetMapping("couponCreate")
	public ModelAndView getCouponCreate(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();		
		/*
		 * List<MemberVO> memberVOs = adminService.getMember(pager);
		 * mv.addObject("list", memberVOs);
		 */
		mv.setViewName("admin/couponCreate");
		return mv;
	}
	
	
	
	//관리자 쿠폰 - 쿠폰번호생성(user null)
	@PostMapping("cpCreate")
	public ModelAndView setCouponCreate(HttpSession session, UserCouponVO userCouponVO, int number)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		if(memberVO == null) {
			System.out.println("로그인 필요");
			mv.setViewName("admin/couponCreate");
			return mv;
		}
		if(memberVO.getUserType()==0) {
			
			
		}
		Long result = adminService.setCouponCreate(userCouponVO, number);
		System.out.println(result);
		mv.addObject("result", result);
		mv.setViewName("common/result");

		/*
		 * List<MemberVO> memberVOs = adminService.getMember(pager);
		 * mv.addObject("list", memberVOs);
		 */
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

	//관리자 알림
	@GetMapping("notification")
	public ModelAndView getNotification()throws Exception{
		ModelAndView mv = new ModelAndView();
		

		mv.setViewName("admin/notification");
		return mv;		
	}
	
	@PostMapping("email")
	public ModelAndView getEmail(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Long count = adminService.getEmailListCount(pager);	
		List<EmailVO> emailVOs = adminService.getEmail(pager, count);
		
		for(int i = 0; i<emailVOs.size();i++ ) {
			System.out.println(emailVOs.get(i).getSendDate());
		}
		
		mv.addObject("count", count);
		mv.addObject("list", emailVOs);
		mv.addObject("pager", pager);
		
		mv.setViewName("admin/emailList");
		return mv;		
	}
	
	@PostMapping("emailMCheck")
	public ModelAndView getEmailObj(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(pager.getSearch());
		Long count = adminService.getUserEmailCount(pager);
		System.out.println(count);
		mv.addObject("result", count);
		mv.setViewName("common/result");
		return mv;		
	}
	
	@PostMapping("emailM")
	@ResponseBody
	public List<MemberVO> getEmailMList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<MemberVO> memberVOs = adminService.getEmailMList(pager);				
			/*[설 명]
			 * 1. json-simple는 google에서 제공해주는 json사용 라이브러리 입니다
			 * 2. jsonObject.put(key, value); 형태로 데이터를 삽입합니다
			 * 3. jsonObjectParse.get(key); 형태로 데이터를 추출합니다
			 * 4. jsonArray.add(value); 형태로 데이터를 삽입합니다
			 * 5. jsonArray.get(배열 번지); 형태로 데이터를 추출합니다
			 * 6. JSONParser 는 json 데이터 파싱을 도와주는 객체입니다
			 * */		
		return memberVOs;
	}
	
	@PostMapping("test")
	public ModelAndView test(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();		
		List<MemberVO> memverVOs = adminService.getEmailMList(pager);		
		mv.addObject("list", memverVOs);		
		mv.setViewName("admin/test");
		return mv;		
	}
	
	@GetMapping("test2")
	public ModelAndView test2(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();

		mv.setViewName("admin/test2");
		return mv;		
	}
	
	@PostMapping("send")
	public ModelAndView setSend(EmailVO emailVO, String receivers, HttpSession session, String receiver_type)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(receiver_type+"번 입니다.==============================");
		
		
		Long result =0L;
		System.out.println("aaa");
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		System.out.println("bbb");
		if(memberVO != null) {
			if(memberVO.getUserType()==0) {
				String [] str=null;
				if(receiver_type.equals("all")) {
					System.out.println("all");
					str = adminService.getAll();
				}else if(receiver_type.equals("seller")) {
					System.out.println("seller");
					str = adminService.getSeller();
				}else if(receiver_type.equals("user")) {
					System.out.println("user");
					str = adminService.getUser();
				}else {
					str = receivers.split(",");
				}				
				System.out.println("ccc");
				System.out.println(111);
				for(int i =0;i<str.length;i++) {
					emailVO.setReceiver(str[i]);
					result = adminService.setSend(emailVO, memberVO);
				}			
			}
		}
		
//		private Long emailNum;
//		private String receiver;
//		private String title;
//		private String contents;
//		private Date sendDate;

		mv.addObject("result", result);
		
		mv.setViewName("common/result");
		return mv;		
	}
	
	
	//관리자 - 통계분석
	@GetMapping("analytics")
	public ModelAndView cpRegister()throws Exception{				
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("admin/analytics");
		return mv;
	}
	
	@GetMapping("salesTrend")
	@ResponseBody
	public List<AnalysisVO> getSalesTrend()throws Exception{				
		List<AnalysisVO> analysisVOs = adminService.getSalesTrend();		
		return analysisVOs;
	}
	
	@GetMapping("HAU")
	@ResponseBody
	public List<AnalysisVO> getHAU()throws Exception{				
		List<AnalysisVO> analysisVOs = adminService.getHAU();
		return analysisVOs;
	}
	
	
	@GetMapping("shopSalesTrend")
	@ResponseBody
	public List<AnalysisVO> getShopSalesTrend()throws Exception{				
		List<AnalysisVO> analysisVOs = adminService.getShopSalesTrend();		
		return analysisVOs;
	}
	
	@GetMapping("gender")
	@ResponseBody
	public List<AnalysisVO> getGender()throws Exception{				
		List<AnalysisVO> analysisVOs = adminService.getGender();
		return analysisVOs;
	}
	
	@GetMapping("age")
	@ResponseBody
	public List<AnalysisVO> getAge()throws Exception{				
		List<AnalysisVO> analysisVOs = adminService.getAge();
		return analysisVOs;
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
	
	
	
	
	
}
	

