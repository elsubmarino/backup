package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.Service;
import com.coresec.admin.domain.MyBoard;
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
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "f_id") int f_id, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		serviceDo.delete(f_id);
		return "redirect:/service/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
	

	@RequestMapping(value = "/create")
	public String create() {
		return "/service/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(Service item) {
	
		serviceDo.insert(item);
		
		
		return "redirect:/service/list";
	}

}
