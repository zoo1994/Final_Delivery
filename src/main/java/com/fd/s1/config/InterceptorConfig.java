package com.fd.s1.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fd.s1.interceptor.AdminInterceptor;
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
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		registry.addInterceptor(adminInterceptor)
				.addPathPatterns("/menu/menuManage");
		
		registry.addInterceptor(memberInterceptor)
				.addPathPatterns("/member/*")
				.excludePathPatterns("/member/join")
				.excludePathPatterns("/member/login")
				.excludePathPatterns("/member/idCheck");
		
		registry.addInterceptor(sellerInterceptor)
				.addPathPatterns("/shop/shopMenu");
	}
}
