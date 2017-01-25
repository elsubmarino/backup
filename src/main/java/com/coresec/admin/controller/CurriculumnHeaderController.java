package com.coresec.admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coresec.admin.persistence.CategoryDo;

@Controller
@RequestMapping(value = "/category/*")
public class CurriculumnHeaderController {
	@Inject 
	CategoryDo categoryDo;
	
	@RequestMapping(value = "/list")
	public String list(Model model) {
		model.addAttribute("count",categoryDo.countsCategory());
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
