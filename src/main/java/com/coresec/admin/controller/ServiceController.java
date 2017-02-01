package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coresec.admin.domain.Service;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.Service;
import com.coresec.admin.persistence.ServiceDo;

@Controller
@RequestMapping(value = "/service")
public class ServiceController {
	@Inject
	ServiceDo serviceDo;
	
	@RequestMapping(value = "/list")
	public void list(Model model, SearchCriteria cri) {

		PageMaker pageMaker = new PageMaker();
		int count = serviceDo.getCount(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Service> list = serviceDo.selectList(cri);
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
	}
}
