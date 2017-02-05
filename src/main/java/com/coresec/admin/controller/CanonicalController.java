package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.Canonical;
import com.coresec.admin.domain.Canonical_s;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.CanonicalDo;

@Controller
@RequestMapping(value = "/canonical")
public class CanonicalController {
	@Inject
	CanonicalDo canonicalDo;

	@RequestMapping(value = "/list")
	public String list(Model model, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		int count = canonicalDo.getCount(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Canonical> list = canonicalDo.selectList(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		return "/canonical/list";
	}

	@RequestMapping(value = "/create")
	public String create() {
		return "/canonical/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(Canonical item, @RequestParam(value = "f_comment") String[] f_items) {

		canonicalDo.insert(item);
		int num = canonicalDo.getF_id();
		for (String temp : f_items) {
			Canonical_s ite = new Canonical_s();
			ite.setF_uid(num);
			ite.setF_comment(temp);
			canonicalDo.insertItem(ite);
		}

		return "redirect:/canonical/list";
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "f_id") int f_id, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		canonicalDo.delete(f_id);
		return "redirect:/canonical/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

	@RequestMapping(value = "/modify")
	public String modify(@RequestParam(value = "f_id") int f_id, Model model, SearchCriteria cri) {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		Canonical item = canonicalDo.selectOne(f_id);
		List<Canonical_s> item2 = canonicalDo.selectOneHistory_s(f_id);
		model.addAttribute("item", item);
		model.addAttribute("item2", item2);
		model.addAttribute("pageMaker", pageMaker);
		return "/canonical/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Canonical item, SearchCriteria cri, @RequestParam(value = "f_id") String f_id,
			@RequestParam(value = "f_comment") String[] f_comment) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		;
		canonicalDo.update(item);
		canonicalDo.deleteCanonical_s(item.getF_id());
		
		for (String temp : f_comment) {
			Canonical_s ite = new Canonical_s();
			ite.setF_uid(item.getF_id());
			ite.setF_comment(temp);
			canonicalDo.insertItem(ite);
		}
		return "redirect:/canonical/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}