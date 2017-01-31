package com.coresec.admin.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coresec.admin.domain.Meta;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.MetaDo;

@Controller
@RequestMapping(value="/meta")
public class MetaController {
	
	@Inject
	MetaDo metaDo;
	
	@RequestMapping(value="/list")
	public void list(Model model){
		Meta item=metaDo.selectOneSetBoard();
		model.addAttribute(item);
	}
}
