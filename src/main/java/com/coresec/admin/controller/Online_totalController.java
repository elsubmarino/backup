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
import com.coresec.admin.persistence.Online_totalDo;

@Controller
@RequestMapping(value = "/online_total")
public class Online_totalController {
	@Inject
	Online_totalDo online_totalDo;

	@RequestMapping(value = "/list")
	public String list(Model model, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		int count = online_totalDo.getCount(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Online_total> list = online_totalDo.selectList(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		return "/online_total/list";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "f_id") int f_id, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		online_totalDo.delete(f_id);
		return "redirect:/online_total/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}