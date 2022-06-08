package com.fd.s1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.fd.s1.member.MemberVO;


@Component
public class LocationInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean check = false;
		
		HttpSession session = request.getSession();
		String location = (String)session.getAttribute("location");
		String pick = (String)session.getAttribute("pickup");
		
		if(pick != null) {
			check = true;
		}
		
		if(location != null) {
				check = true;
		}
		
		if(!check) {
			request.setAttribute("message", "먼저 주소를 입력해주세요.");
			request.setAttribute("path", "../");
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/joinResult.jsp");
			view.forward(request, response);
		}
		
		return check;
	}
	
	
}
