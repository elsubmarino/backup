package com.coresec.admin.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import com.coresec.admin.domain.Category;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.CategoryDo;

@Controller
@RequestMapping(value = "/category/*")
public class CategoryControl {
	@Inject
	CategoryDo categoryDo;


	@RequestMapping(value = "/list")
	public String list(Model model, SearchCriteria cri) throws UnsupportedEncodingException {
		PageMaker pageMaker = new PageMaker();
		int count = categoryDo.countsCategory(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Category> list = categoryDo.selectListCategory(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		return "/category/list";
	}

	@RequestMapping(value = "/list",params="mode=create")
	public String create(Model model, HttpServletRequest request) {
		String f_ca_id = request.getParameter("f_ca_id");
		if (f_ca_id != null) {
			Map<String, Object> map = new HashMap();
			map.put("f_ca_id", f_ca_id);
			map.put("length_start", f_ca_id.length() - 1);
			String result=categoryDo.getCountAboveThree(map);
			if(result==null){
				result=f_ca_id+"10";
			}
			model.addAttribute("f_ca_id", result);
		} else {
			model.addAttribute("f_ca_id", categoryDo.getCountBelowTwo());
		}
		return "/category/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPOST(SearchCriteria cri, Category category,WebRequest req) {
		String[]test=req.getParameterValues("f_ca_id");
		if(test.length>1){
			category.setF_ca_id(test[test.length-1]);
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		category.setF_upfile_name("");
		categoryDo.insertCategory(category);
		
		
		return "redirect:/category/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

	@RequestMapping(value = "/subCreate")
	public String subCreate() {
		return "/category/subCreate";
	}

	@RequestMapping(value = "/list",params="mode=modify")
	public String modify(@RequestParam(value = "f_id") int f_id, Model model, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		Category item = categoryDo.selectOneCategory(f_id);
		model.addAttribute("item", item);
		model.addAttribute("pageMaker", pageMaker);

		return "/category/create";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(SearchCriteria cri, Category category) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		categoryDo.update(category);
		return "redirect:/category/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

	@RequestMapping(value = "/delete")
	public String delete(SearchCriteria cri, @RequestParam(value = "f_id") int f_id) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		categoryDo.deleteCategory(f_id);
		return "redirect:/category/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}
