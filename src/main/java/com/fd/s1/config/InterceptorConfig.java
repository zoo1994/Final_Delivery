package com.fd.s1.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fd.s1.interceptor.AdminInterceptor;
import com.fd.s1.interceptor.LocationInterceptor;
import com.fd.s1.interceptor.MemberInterceptor;
import com.fd.s1.interceptor.SellerInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{

	@Autowired
	private AdminInterceptor adminInterceptor;
	
	@Autowired
	private MemberInterceptor memberInterceptor;
	@Autowired
	private SellerInterceptor sellerInterceptor;
	@Autowired
	private LocationInterceptor locationInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		registry.addInterceptor(memberInterceptor)
				.addPathPatterns("/member/*")
				.addPathPatterns("/delivery/*")
				.addPathPatterns("/qna/*")
				.addPathPatterns("/admin/menuManage")
				.addPathPatterns("/menu/manageDetail")
				.addPathPatterns("/menu/update")
				.addPathPatterns("admin/bannerManage")
				.excludePathPatterns("/member/join")
				.excludePathPatterns("/member/login")
				.excludePathPatterns("/member/idCheck")
				.excludePathPatterns("/member/findId")
				.excludePathPatterns("/member/findPw")
				.excludePathPatterns("/member/pwChange");
		
		registry.addInterceptor(adminInterceptor)
				.addPathPatterns("/admin/menuManage")
				.addPathPatterns("/menu/update")
				.addPathPatterns("/menu/delete")
				.addPathPatterns("/admin/bannerManage")				
				.addPathPatterns("/admin/shop")
				.addPathPatterns("/admin/shop1")
				.addPathPatterns("/admin/shopAdd")				
				.addPathPatterns("/admin/shopDelete")
				.addPathPatterns("/admin/shopUpdate")
				.addPathPatterns("/admin/member")
				.addPathPatterns("/admin/member1")				
				.addPathPatterns("/admin/mgUpdate")
				.addPathPatterns("/admin/coupon")
				.addPathPatterns("/admin/coupon1")				
				.addPathPatterns("/admin/cpAdd")
				.addPathPatterns("/admin/cpDelete")
				.addPathPatterns("/admin/cpLog")
				.addPathPatterns("/admin/couponId")
				.addPathPatterns("/admin/usIssuance")
				.addPathPatterns("/admin/usDelete")
				.addPathPatterns("/admin/notification")				
				.addPathPatterns("/admin/email")
				.addPathPatterns("/admin/emailMCheck")
				.addPathPatterns("/admin/emailM")				
				.addPathPatterns("/admin/send")
				.addPathPatterns("/admin/analytics")				
				.addPathPatterns("/admin/salesTrend")
				.addPathPatterns("/admin/HAU")				
				.addPathPatterns("/admin/shopSalesTrend")
				.addPathPatterns("/admin/gender")
				.addPathPatterns("/admin/age")				
				
				//공지사항, 이벤트, FAQ
				.addPathPatterns("/event/add")
				.addPathPatterns("/event/update")
				.addPathPatterns("/event/delete")
				.addPathPatterns("/notice/add")
				.addPathPatterns("/notice/update")
				.addPathPatterns("/notice/delete")
				.addPathPatterns("/faq/add")
				.addPathPatterns("/faq/update")
				.addPathPatterns("/faq/delete")
				;
		
		registry.addInterceptor(sellerInterceptor)
				.addPathPatterns("/shop/shopMenu")
				.addPathPatterns("/shop/shopSystem");
		
		registry.addInterceptor(locationInterceptor)
				.addPathPatterns("/delivery/*")
				.excludePathPatterns("/delivery/addAddress")
				.excludePathPatterns("/delivery/goDeli")
				.excludePathPatterns("/delivery/orderList*")
				.excludePathPatterns("/delivery/orderDetail")
				.excludePathPatterns("/delivery/packagingAddress");
		
	}
}
