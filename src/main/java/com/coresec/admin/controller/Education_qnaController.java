package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.Education_qna;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.Education_qnaDo;

@Controller
@RequestMapping(value="/education_qna")
public class Education_qnaController {
	@Inject
	Education_qnaDo education_qnaDo;
	
	@RequestMapping(value="/list")
	public void list(Model model,SearchCriteria cri){
		PageMaker pageMaker=new PageMaker();
		int count=education_qnaDo.countsEducation_qna(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		List<Education_qna> list=education_qnaDo.selectListEducation_qna(cri);
		
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",pageMaker);
	}
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "f_id") int f_id, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		education_qnaDo.deleteEducation_qna(f_id);
		return "redirect:/education_qna/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}
