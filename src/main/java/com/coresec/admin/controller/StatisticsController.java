package com.coresec.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/statistics/*")
public class StatisticsController {
	@RequestMapping(value = "/list")
	public String list() {
		return "/statistics/list";
	}
}
