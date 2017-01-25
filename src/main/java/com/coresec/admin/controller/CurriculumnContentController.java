package com.coresec.admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coresec.admin.persistence.EducationDo;

@Controller
@RequestMapping(value = "/education/*")
public class CurriculumnContentController {
	@Inject
	EducationDo educationDo;
	
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
