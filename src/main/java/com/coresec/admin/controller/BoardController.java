package com.coresec.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	@RequestMapping(value="/list")
	public String list(){
		return "/board/list";
	}
	
	@RequestMapping(value="/create")
	public String create(){
		return "/board/create";
	}
	
	@RequestMapping(value="/modify")
	public String modify(){
		return "/board/modify";
	}
	
}
