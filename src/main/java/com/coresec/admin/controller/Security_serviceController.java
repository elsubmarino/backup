package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.Security_service;
import com.coresec.admin.persistence.Security_serviceDo;

@Controller
@RequestMapping(value="/security_service")
public class Security_serviceController {
	@Inject
	Security_serviceDo service_securityDo;
	
	private static String namespace="com.coresec.admin.mapper.security_serviceMapper";
	
	@RequestMapping(value="/list")
	public void list(SearchCriteria cri,Model model){
		int count=service_securityDo.countsSecurity_service(cri);
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		List<Security_service> list=service_securityDo.selectListSecurity_service(cri);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("list",list);
	}
}
