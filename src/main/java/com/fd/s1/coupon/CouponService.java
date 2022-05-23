package com.fd.s1.coupon;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fd.s1.member.MemberVO;
import com.fd.s1.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class CouponService {

	@Autowired
	private CouponMapper couponMapper;

	public Long createCoupon(UserCouponVO userCouponVO) throws Exception {
			
		String [] randCharacter = {	"0","1","2","3","4",
									"5","6","7","8","9",
									"A","B","C","D","E",
									"F","G","H","I","J",
									"K","L","M","N","O",
									"P","Q","R","S","T",
									"U","V","W","X","Y","Z"};

		Random rd = new Random();

		int cpLength = 8;//쿠폰 글자수
		int cur =1;//생성 쿠폰 갯수
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
	
	
	//쿠폰 쿠폰관리 - 리스트
	public List<CouponVO> getCoupon(Pager pager, Long count)throws Exception{		
		pager.makeRow();
		pager.makeNum(count);
		System.out.println(pager.getPerPage());
		return couponMapper.getCoupon(pager);
	}
	
	//쿠폰 쿠폰관리 - count
	public Long getCouponListCount(Pager pager) throws Exception{	
		return couponMapper.getCouponTotalCount(pager);
	}
	
	
	
	public List<CouponVO> getList(Pager pager, Long count) throws Exception {
		pager.makeRow();
		pager.makeNum(count);

		return couponMapper.getList(pager);
	}

	public CouponVO getDetail(CouponVO couponVO) throws Exception {
		return couponMapper.getDetail(couponVO);
	}

	public int setAdd(CouponVO couponVO, MultipartFile[] files) throws Exception {
		int result = couponMapper.setAdd(couponVO);
		return result;
	}

	public int setUpdate(CouponVO couponVO) throws Exception {
		return couponMapper.setUpdate(couponVO);
	}

	public int setDelete(CouponVO couponVO) throws Exception {
		int result = couponMapper.setDelete(couponVO);
		return result;
	}
	
	
	public Long getTotal(Pager pager) throws Exception {
		return couponMapper.getTotal(pager);
	}
	
	
	/* String [] coupon= {};

	String [] randCharacter = {	"0","1","2","3","4",
								"5","6","7","8","9",
								"A","B","C","D","E",
								"F","G","H","I","J",
								"K","L","M","N","O",
								"P","Q","R","S","T",
								"U","V","W","X","Y","Z"};
	
	Random rd = new Random();
	int cpLength = 8;//쿠폰 글자수
	int cur =5;//생성 쿠폰 갯수
	int count =0;
	System.out.println("hi1");
	StringBuffer sb=null;
	while(count<cur) {
		sb = new StringBuffer();
		for(int i=0;i<cpLength;i++) {
			sb.append(randCharacter[rd.nextInt(36)]);
		}
		System.out.println("couponNUM : "+sb.toString());
		coupon[count] = sb.toString();
		count++;
	}	*/	
/*		
	String [] randCharacter = {	"0","1","2","3","4",
								"5","6","7","8","9",
								"A","B","C","D","E",
								"F","G","H","I","J",
								"K","L","M","N","O",
								"P","Q","R","S","T",
								"U","V","W","X","Y","Z"};
	
	Random rd = new Random();
	int cpLength = 8;//쿠폰 글자수
	int cur =1;//생성 쿠폰 갯수
	String [] coupon= new String[cur];//쿠폰 담을 배열
	int count =0;//쿠폰 갯수
	
	StringBuffer sb=null;
	
	while(count<cur) {
		sb = new StringBuffer();
		for(int i=0;i<cpLength;i++) {
			sb.append(randCharacter[rd.nextInt(36)]);
		}
		coupon[count] = sb.toString();
		count++;
	}
	System.out.println("dd");
	for(int i =0;i<count;i++) {
		System.out.println("couponNUM : "+coupon[i]);
	}
*/	
}
