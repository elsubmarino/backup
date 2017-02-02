package com.coresec.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.coresec.admin.domain.Meta;
import com.coresec.admin.persistence.MetaDo;

public class HeaderController extends HandlerInterceptorAdapter {
	@Inject
	MetaDo metaDo;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Meta meta=metaDo.selectOne();
		request.setAttribute("meta",meta);
        return super.preHandle(request, response, handler);
	}

}
