package com.coresec.admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coresec.admin.persistence.SetBoardDo;

@Controller
@RequestMapping(value="/setBoard/*")
public class BoardController {
	@Inject
	SetBoardDo setBoardDo;
	@RequestMapping(value="/list")
	public String list(Model model){
		model.addAttribute("count",setBoardDo.countsSetBoard());
		return "/setBoard/list";
	}
	
	@RequestMapping(value="/create")
	public String create(){
		return "/setBoard/create";
	}
	
	@RequestMapping(value="/modify")
	public String modify(){
		return "/setBoard/modify";
	}
	
}
