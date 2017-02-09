package com.coresec.admin.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.MyBoard;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.MyBoardDo;

@Controller
@RequestMapping(value="/bbs")
public class MyBoardController {
	@Inject
	MyBoardDo myBoardDo;
	
	@RequestMapping(value = "/{item1}/{item2}/list")
	public String list(Model model, SearchCriteria cri,@PathVariable(value="item1") String item1,@PathVariable(value="item2") String item2) throws UnsupportedEncodingException {
		int f_bid=Integer.parseInt(item2);
		cri.setF_bid(f_bid);
		int count=myBoardDo.getCount(cri);
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		List<MyBoard> list=myBoardDo.selectList(cri);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",pageMaker);
		return "/sub/"+item1+"/"+item2+"/list";
	}

	@RequestMapping(value = "/create")
	public String create() {
		return "/setBoard/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(MyBoard myBoard) {
	
		myBoardDo.insert(myBoard);
		
				
		return "redirect:/setBoard/list";
	}

	@RequestMapping(value = "/modify")
	public String modify(@RequestParam(value = "f_id") int f_id, Model model, SearchCriteria cri) {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		MyBoard item = myBoardDo.selectOne(f_id);
		model.addAttribute("item", item);
		model.addAttribute("pageMaker", pageMaker);
		return "/setBoard/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(MyBoard myBoard,SearchCriteria cri) {
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);;
		myBoardDo.update(myBoard);
		return "redirect:/setBoard/list"+pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
	
	@RequestMapping(value="/delete")
	public String delete(@RequestParam(value="f_id") int f_id,SearchCriteria cri){
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		myBoardDo.delete(f_id);
		return "redirect:/setBoard/list"+pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}
