package com.fd.s1.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fd.s1.coupon.CouponMapper;
import com.fd.s1.coupon.CouponVO;
import com.fd.s1.coupon.UserCouponVO;
import com.fd.s1.email.EmailVO;
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
	private CouponMapper couponMapper;		
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
	
	//관리자 이메일 - count
	public Long getEmailListCount(Pager pager) throws Exception{	
		return adminMapper.getEmailTotalCount(pager);
	}
	
	//관리자 이메일 - 리스트
	public List<EmailVO> getEmail(Pager pager, Long count)throws Exception{		
		pager.makeRow();
		pager.makeNum(count);
		System.out.println(pager.getPerPage());
		return adminMapper.getEmail(pager);
	}
	
	//관리자 이메일멤버 - userEmail
	public Long getUserEmailCount(Pager pager) throws Exception{	
		return adminMapper.getUserEmailCount(pager);
	}
	//관리자 이메일멤버 - userEmail
	public List<MemberVO> getEmailMList(Pager pager) throws Exception{	
		return adminMapper.getEmailMList(pager);
	}
	
	
	
	public String [] getAll()throws Exception{
		return adminMapper.getAll();
	}
	public String [] getSeller()throws Exception{
		return adminMapper.getSeller();
	}
	public String [] getUser()throws Exception{
		return adminMapper.getUser();
	}
	
	
	
	//관리자 이메일 - send
	public Long setSend(EmailVO emailVO, MemberVO memberVO)throws Exception{		
		System.out.println(222);
       	String user = memberVO.getEmail(); // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String password = "jgfsxeczynjbxfdc"; // 패스워드
        
        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });


        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));            //수신자메일주소
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailVO.getReceiver())); 

        // Subject
        message.setSubject(emailVO.getTitle()); //메일 제목을 입력

        // Text
//        message.setText(emailVO.getContents());    //메일 내용을 입력
        message.setContent(emailVO.getContents(),"text/html; charset=euc-kr");
        // send the message
        System.out.println(4);
        
        Transport.send(message); ////전송
        System.out.println("message sent successfully...");
		
		
		
		System.out.println("받는이 : "+emailVO.getReceiver());
		return adminMapper.setSend(emailVO);
	}

	
	public Long setCouponCreate(UserCouponVO userCouponVO, int number) throws Exception {
		
		String [] randCharacter = {	"0","1","2","3","4",
									"5","6","7","8","9",
									"A","B","C","D","E",
									"F","G","H","I","J",
									"K","L","M","N","O",
									"P","Q","R","S","T",
									"U","V","W","X","Y","Z"};

		Random rd = new Random();

		int cpLength = 8;//쿠폰 글자수
		int cur =number;//생성 쿠폰 갯수
		Long result=-1L;

		while(0<cur) {
			StringBuffer sb = new StringBuffer();
			for(int i=0;i<cpLength;i++) {
				sb.append(randCharacter[rd.nextInt(36)]);//randCharacter[rd.nextInt(36)]
			}

//			System.out.println("couponNUM : "+sb.toString());
			userCouponVO.setCouponNum(sb.toString());
			result = couponMapper.getOverlap(userCouponVO);// --여기 바꿔야함
			if(result==0) {
				userCouponVO.setCouponNum(sb.toString());				
				userCouponVO.setActiveDate(30L);//수신한 쿠폰번호는 30일동안 등록가능
				result = couponMapper.setUserCoupon(userCouponVO);
//				System.out.println("에러나오는것");				
				cur--;
			}
//			else if(result==-5L){return result;}
			else {
				System.out.println("실패");
			}
		}

		return result;
	}
	
	public List<ShopVO> getShopList() throws Exception {
		return adminMapper.getShopList();
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
