package com.coresec.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/poll/*")
public class PollController {
	@RequestMapping(value="/list")
	public String list(){
		return "/poll/list";
	}
	@RequestMapping(value="/register")
	public String register(){
		
		return "/poll/register";
	}
	@RequestMapping(value="/modify")
	public String modify(){
		return "/poll/modify";
	}

}