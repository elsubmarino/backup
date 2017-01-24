package com.coresec.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/curriculumnContent/*")
public class CurriculumnContentController {
	@RequestMapping(value = "/list")
	public String list() {
		return "/curriculumnContent/list";
	}

	@RequestMapping(value = "/create")
	public String create() {
		return "/curriculumnContent/create";
	}

	@RequestMapping(value = "/modify")
	public String modify() {
		return "/curricululmnContent/modify";
	}
}
