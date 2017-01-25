package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coresec.admin.domain.Category;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.CategoryDo;

@Controller
@RequestMapping(value = "/category/*")
public class CurriculumnHeaderController {
	@Inject
	CategoryDo categoryDo;

	@RequestMapping(value = "/list")
	public String list(Model model, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		int count = categoryDo.countsCategory();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Category> list = categoryDo.selectListCategory(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		return "/curriculumnHeader/list";
	}

	@RequestMapping(value = "/create")
	public String create() {
		return "/curriculumnHeader/create";
	}

	@RequestMapping(value = "/subCreate")
	public String subCreate() {
		return "/curriculumnHeader/subCreate";
	}

	@RequestMapping(value = "/modify")
	public String modify() {
		return "/curriculmnHeader/modify";
	}
}
