package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.SetBoard;
import com.coresec.admin.persistence.SetBoardDo;

@Controller
@RequestMapping(value = "/setBoard/*")
public class BoardController {
	@Inject
	SetBoardDo setBoardDo;

	@RequestMapping(value = "/list")
	public String list(Model model, SearchCriteria cri) {
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		int count = setBoardDo.countsSetBoard();
		List<SetBoard> list = setBoardDo.selectListSetBoard(cri);
		PageMaker pageMaker = new PageMaker();
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		model.addAttribute("list", list);

		model.addAttribute("pageMaker", pageMaker);
		return "/setBoard/list";
	}

	@RequestMapping(value = "/create")
	public String create() {
		return "/setBoard/create";
	}

	@RequestMapping(value = "/modify")
	public String modify() {
		return "/setBoard/modify";
	}

}
