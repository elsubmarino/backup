package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.Survey;
import com.coresec.admin.persistence.SurveyDo;

@Controller
@RequestMapping(value="/survey")
public class SurveyController {
	@Inject
	SurveyDo surveyDo;
	
	@RequestMapping(value="/list")
	public String list(SearchCriteria cri,Model model){
		PageMaker pageMaker = new PageMaker();
		int count = surveyDo.getCount(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Survey> list = surveyDo.selectList(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		return "/survey/list";
	}
	
	@RequestMapping(value = "/create")
	public String register(SearchCriteria cri, Model model) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("pageMaker", pageMaker);
		return "/survey/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String registerPOST(SearchCriteria cri,@RequestParam(value="f_items") String[]f_items, Survey survey,HttpServletRequest request) {
		String temp="";
		for(String haha:f_items){
			temp+=haha+"��";
		}
		temp=temp.substring(0, temp.length()-1);
		survey.setF_items(temp);
		surveyDo.insert(survey);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		//HttpSession sess=request.getSession(false);
		//Map<String,Integer> list=(Map<String, Integer>) sess.getAttribute("list");
		//list.put("survey",surveyDo.getBadge());
		//sess.setAttribute("list", list);
		
		
		return "redirect:/survey/list" + pageMaker.makeSearch(cri.getPage());
	}
	
	@RequestMapping(value = "/modify")
	public String modify(@RequestParam(value = "f_id") int f_id, Model model, SearchCriteria cri) {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		Survey item = surveyDo.selectOne(f_id);
		model.addAttribute("item", item);
		model.addAttribute("pageMaker", pageMaker);
		return "/survey/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(Survey survey, Model model, SearchCriteria cri) {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		surveyDo.update(survey);
		return "redirect:/popup/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}