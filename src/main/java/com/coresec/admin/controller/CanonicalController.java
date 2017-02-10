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
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		PageMaker pageMaker = new PageMaker();
		int count = canonicalDo.getCount(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);

		List<Canonical> list = canonicalDo.selectList(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		return "/canonical/list";
	}

	@RequestMapping(value = "/list",params="mode=create")
	public String create() {
		return "/canonical/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(Canonical item) {
		List<Canonical> list=item.getList();
		for(Canonical temp:list){
			String year = temp.getF_year();
			temp.setF_year(year.substring(0, 4));
			temp.setF_month(year.substring(5));
			canonicalDo.insert(temp);

			canonicalDo.insertToHistory_s(temp);
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

	@RequestMapping(value = "/list",params="mode=modify")
	public String modify(@RequestParam(value = "f_id_s") int f_id_s, Model model, SearchCriteria cri) {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		Canonical item = canonicalDo.selectOne(f_id_s);
		model.addAttribute("item", item);
		model.addAttribute("pageMaker", pageMaker);
		return "/canonical/create";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Canonical item, SearchCriteria cri) {
		item.setF_month(item.getF_year().substring(5));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		canonicalDo.update(item);

		return "redirect:/canonical/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}