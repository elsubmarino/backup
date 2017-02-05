package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.Canonical;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.CanonicalDo;

@Controller
@RequestMapping(value = "/canonical")
public class CanonicalController {
	@Inject
	CanonicalDo canonicalDo;

	@RequestMapping(value = "/list")
	public String list(Model model, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		int count = canonicalDo.getCount(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Canonical> list = canonicalDo.selectList(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		return "/online_total/list";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "f_id") int f_id, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		canonicalDo.delete(f_id);
		return "redirect:/canonical/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}