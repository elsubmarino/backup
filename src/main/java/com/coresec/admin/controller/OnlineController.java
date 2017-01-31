package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coresec.admin.domain.Online;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.OnlineDo;

@Controller
@RequestMapping(value = "/online")
public class OnlineController {
	@Inject
	OnlineDo onlineDo;

	@RequestMapping(value = "/list")
	public void list(Model model, SearchCriteria cri) {

		PageMaker pageMaker = new PageMaker();
		int count = onlineDo.getCount(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Online> list = onlineDo.selectList(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
	}
}
