package com.fd.s1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.fd.s1.member.MemberVO;

@Component
public class MemberInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean check = true;

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		if (memberVO == null) {

			request.setAttribute("message", "로그인이 필요합니다.");
			request.setAttribute("path", "/member/login");

			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/joinResult.jsp");
			view.forward(request, response);
			check = false;

		}

		return check;
	}

}
