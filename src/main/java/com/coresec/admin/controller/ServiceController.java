package com.coresec.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/service")
public class ServiceController {
	@RequestMapping(value="/list")
	public void list(){
		
	}
}
