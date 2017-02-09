package com.coresec.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.coresec.admin.persistence.LogsDo;

public class WebLogInterceptor extends HandlerInterceptorAdapter {
	@Inject
	LogsDo logsDo;

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logsDo.insert(request.getHeader("referer"));
	}
	
}
