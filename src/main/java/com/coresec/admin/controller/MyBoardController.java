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
import com.coresec.admin.persistence.SetBoardDo;

@Controller
@RequestMapping(value="/bbs")
public class MyBoardController {
	@Inject
	MyBoardDo myBoardDo;
	
	@Inject
	SetBoardDo setBoardDo;
	
	@RequestMapping(value = "/{item1}/{item2}/list")
	public String list(Model model, SearchCriteria cri,@PathVariable(value="item1") String item1,@PathVariable(value="item2") String item2) throws UnsupportedEncodingException {
		int f_bid=Integer.parseInt(item2);
		String boardName=setBoardDo.getBoardName(f_bid);
		model.addAttribute("boardName",boardName);
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
	@RequestMapping(value="/{item1}/{item2}/list",params="mode=read")
	public String read(Model model,@RequestParam(value="f_id") int f_id,SearchCriteria cri,@PathVariable(value="item1") String item1,@PathVariable(value="item2") String item2){
		int f_bid=Integer.parseInt(item2);
		myBoardDo.updateHit(f_id);;
		String boardName=setBoardDo.getBoardName(f_bid);
		model.addAttribute("boardName",boardName);
		MyBoard item=myBoardDo.selectOne(f_id);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		model.addAttribute("item",item);
		model.addAttribute("item1",item1);
		model.addAttribute("item2",item2);
		model.addAttribute("pageMaker",pageMaker);
		return "/sub/"+item1+"/"+item2+"/read";
	}

	@RequestMapping(value = "/{item1}/{item2}/list",params="mode=create")
	public String create(SearchCriteria cri,Model model,@PathVariable(value="item1") String item1,@PathVariable(value="item2") String item2) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int f_bid=Integer.parseInt(item2);
		String boardName=setBoardDo.getBoardName(f_bid);
		model.addAttribute("boardName",boardName);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("item1",item1);
		model.addAttribute("item2",item2);
		return "/sub/"+item1+"/"+item2+"/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(MyBoard myBoard,@RequestParam(value="item1") String item1,@RequestParam(value="item2") String item2) {
		myBoardDo.insert(myBoard);
		return "redirect:/bbs/"+item1+"/"+item2+"/list";
	}

	@RequestMapping(value = "/{item1}/{item2}/list",params="mode=modify")
	public String modify(@RequestParam(value="f_id") int f_id,SearchCriteria cri,Model model,@PathVariable(value="item1") String item1,@PathVariable(value="item2") String item2) {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		MyBoard item = myBoardDo.selectOne(f_id);
		model.addAttribute("item", item);
		model.addAttribute("pageMaker", pageMaker);
		return "/sub/"+item1+"/"+item2+"/create";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(SearchCriteria cri,MyBoard myBoard,@RequestParam(value="item1") String item1,@RequestParam(value="item2") String item2) {
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);;
		myBoardDo.update(myBoard);
		return "redirect:/bbs/"+item1+"/"+item2+"/list";
	}
	
	@RequestMapping(value="/delete")
	public String delete(@RequestParam(value="f_id") int f_id,SearchCriteria cri,MyBoard myBoard,@RequestParam(value="item1") String item1,@RequestParam(value="item2") String item2) {
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		myBoardDo.delete(f_id);
		return "redirect:/bbs/"+item1+"/"+item2+"/list";
	}
}
