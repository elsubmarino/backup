package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.Category;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.CategoryDo;

@Controller
@RequestMapping(value = "/category/*")
public class CurriculumnHeaderController {
	@Inject
	CategoryDo categoryDo;

	@RequestMapping(value = "/list")
	public String list(Model model, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		int count = categoryDo.countsCategory();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Category> list = categoryDo.selectListCategory(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		return "/curriculumnHeader/list";
	}

	@RequestMapping(value = "/create")
	public String create() {
		return "/curriculumnHeader/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPOST(SearchCriteria cri, Category category) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		category.setF_upfile_name("");
		categoryDo.insertCategory(category);
		return "redirect:/category/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

	@RequestMapping(value = "/subCreate")
	public String subCreate() {
		return "/curriculumnHeader/subCreate";
	}

	@RequestMapping(value = "/modify")
	public String modify(@RequestParam(value = "f_id") int f_id, Model model, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		;
		Category item = categoryDo.selectOneCategory(f_id);
		model.addAttribute("item", item);
		model.addAttribute("pageMaker", pageMaker);

		return "/curriculumnHeader/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(SearchCriteria cri, Category category) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		categoryDo.updateCaetgory(category);
		return "redirect:/category/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

	@RequestMapping(value = "/delete")
	public String delete(SearchCriteria cri,@RequestParam(value="f_id") int f_id) {
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		categoryDo.deleteCategory(f_id);
		return "redirect:/category/list"+pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}
