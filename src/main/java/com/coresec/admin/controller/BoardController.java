package com.coresec.admin.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String list(Model model, SearchCriteria cri) throws UnsupportedEncodingException {
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		int count = setBoardDo.countsSetBoard(cri);
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

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(SetBoard setBoard) {
		setBoard.setF_read(setBoard.getF_read().replaceAll(",", ""));
		setBoard.setF_write(setBoard.getF_write().replaceAll(",", ""));
		setBoard.setF_edit(setBoard.getF_edit().replaceAll(",", ""));
		setBoard.setF_delete(setBoard.getF_delete().replaceAll(",", ""));
		setBoard.setF_reply(setBoard.getF_reply().replaceAll(",", ""));
		setBoard.setF_comment(setBoard.getF_comment().replaceAll(",", ""));
		setBoard.setF_comment_del(setBoard.getF_comment_del().replaceAll(",", ""));
		setBoardDo.insertSetBoard(setBoard);
		
		
		return "redirect:/setBoard/list";
	}

	@RequestMapping(value = "/modify")
	public String modify(@RequestParam(value = "f_id") int f_id, Model model, SearchCriteria cri) {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		SetBoard item = setBoardDo.selectOneSetBoard(f_id);
		model.addAttribute("item", item);
		model.addAttribute("pageMaker", pageMaker);
		return "/setBoard/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(SetBoard setBoard,SearchCriteria cri) {
		setBoard.setF_read(setBoard.getF_read().replaceAll(",", ""));
		setBoard.setF_write(setBoard.getF_write().replaceAll(",", ""));
		setBoard.setF_edit(setBoard.getF_edit().replaceAll(",", ""));
		setBoard.setF_delete(setBoard.getF_delete().replaceAll(",", ""));
		setBoard.setF_reply(setBoard.getF_reply().replaceAll(",", ""));
		setBoard.setF_comment(setBoard.getF_comment().replaceAll(",", ""));
		setBoard.setF_comment_del(setBoard.getF_comment_del().replaceAll(",", ""));
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);;
		setBoardDo.updateSetBoard(setBoard);
		return "redirect:/setBoard/list"+pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
	
	@RequestMapping(value="/delete")
	public String delete(@RequestParam(value="f_id") int f_id,SearchCriteria cri){
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		setBoardDo.deleteSetBoard(f_id);
		return "redirect:/setBoard/list"+pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

}
