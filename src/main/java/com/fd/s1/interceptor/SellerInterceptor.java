package com.fd.s1.interceptor;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.fd.s1.admin.AdminService;
import com.fd.s1.member.MemberVO;
import com.fd.s1.shop.ShopVO;


@Component
public class SellerInterceptor implements HandlerInterceptor{
	
	@Autowired
	private AdminService adminService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean check = false;
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<ShopVO> list = adminService.getShopMaster();
		
		
		if(memberVO != null) {
			for(ShopVO shopVO:list) {
				if(shopVO.getId().equals(memberVO.getId())) {
					check = true;
				}
			}
		}
		
		if(!check) {
			request.setAttribute("message", "권한이 없습니다.");
			request.setAttribute("path", "../");
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/joinResult.jsp");
			view.forward(request, response);
		}
		
		return check;
	}
	
	
}
