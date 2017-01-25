package com.coresec.admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coresec.admin.persistence.PopupDo;

@Controller
@RequestMapping(value="/popup/*")
public class PopupController {
	@Inject 
	PopupDo popupDo;
	
	@RequestMapping(value="/list")
	public String list(Model model){
		model.addAttribute("count",popupDo.countsPopup());
		return "/popup/list";
	}
	@RequestMapping(value="/register")
	public String register(){
		
		return "/popup/register";
	}
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerPOST(){
		
		return "/popup/register";
	}
	
	@RequestMapping(value="/modify")
	public String modify(){
		return "/popup/modify";
	}

}
