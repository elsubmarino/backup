package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.Online_total;
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
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		int count=service_securityDo.countsSecurity_service(cri);
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		List<Security_service> list=service_securityDo.selectListSecurity_service(cri);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("list",list);
	}
	
	@RequestMapping(value = "/list",params="mode=read")
	public String modify(Model model, @RequestParam(value="f_id") int f_id, SearchCriteria cri) {
		
		Security_service item=service_securityDo.selectOneSecurity_service(f_id);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("item",item);
		model.addAttribute("pageMaker",pageMaker);
		return "security_service/read";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "f_id") int f_id, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		service_securityDo.deleteSecurity_service(f_id);
		return "redirect:/security_service/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}
