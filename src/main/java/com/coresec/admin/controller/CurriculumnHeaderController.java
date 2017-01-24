package com.coresec.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/curriculumnHeader/*")
public class CurriculumnHeaderController {
	@RequestMapping(value = "/list")
	public String list() {
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
