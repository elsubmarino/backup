package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.Popup;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.PopupDo;

@Controller
@RequestMapping(value = "/popup/*")
public class PopupController {
	@Inject
	PopupDo popupDo;

	@RequestMapping(value = "/list")
	public String list(Model model, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		int count = popupDo.countsPopup();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Popup> list = popupDo.selectListPopup(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		return "/popup/list";
	}

	@RequestMapping(value = "/register")
	public String register(SearchCriteria cri, Model model) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("pageMaker", pageMaker);
		return "/popup/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(SearchCriteria cri, Popup popup) {
		popupDo.insertPopup(popup);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		return "redirect:/popup/list" + pageMaker.makeSearch(cri.getPage());
	}

	@RequestMapping(value = "/modify")
	public String modify(@RequestParam(value="f_id") int f_id,Model model,SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		Popup item=popupDo.selectOnePopup(f_id);
		model.addAttribute("item",item);
		model.addAttribute("pageMaker",pageMaker);
		return "/popup/modify";
	}
	@RequestMapping(value = "/modify", method=RequestMethod.POST)
	public String modifyPOST(Popup popup,Model model,SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		popupDo.updatePopup(popup);
		return "redirect:/popup/list"+pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
	@RequestMapping(value="/delete")
	public String delete(@RequestParam(value="f_id") int f_id,SearchCriteria cri){
		popupDo.deletePopup(f_id);
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		return "redirect:/popup/list"+pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

}
