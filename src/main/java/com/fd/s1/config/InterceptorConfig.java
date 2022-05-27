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
		registry.addInterceptor(adminInterceptor)
				.addPathPatterns("/menu/menuManage");
		
		registry.addInterceptor(memberInterceptor)
				.addPathPatterns("/member/*")
				.addPathPatterns("/delivery/*")
				.addPathPatterns("/qna/*")
				.excludePathPatterns("/member/join")
				.excludePathPatterns("/member/login")
				.excludePathPatterns("/member/idCheck")
				.excludePathPatterns("/member/findId")
				.excludePathPatterns("/member/findPw")
				.excludePathPatterns("/member/pwChange");
		
		registry.addInterceptor(sellerInterceptor)
				.addPathPatterns("/shop/shopMenu");
		
		registry.addInterceptor(locationInterceptor)
				.addPathPatterns("/delivery/*")
				.excludePathPatterns("/delivery/addAddress")
				.excludePathPatterns("/delivery/goDeli")
				.excludePathPatterns("/delivery/orderList*")
				.excludePathPatterns("/delivery/orderDetail");
	}
}
