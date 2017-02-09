package com.coresec.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.jdbc.JDBCAppender;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BeforeLoginController extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession sess = request.getSession(false);
		if (sess != null && sess.getAttribute("admin") != null) {
			return true;
		}
		response.sendRedirect("/admin/login");
		return false;
	}

}
