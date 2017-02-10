package com.coresec.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.SetBoard;
import com.coresec.admin.persistence.MyBoardDo;
import com.coresec.admin.persistence.SetBoardDo;

@Controller
@RequestMapping(value = "/setBoard/*")
public class BoardController {
	@Inject
	SetBoardDo setBoardDo;

	@Inject
	MyBoardDo myBoardDo;

	@RequestMapping(value = "/list")
	public String list(Model model, SearchCriteria cri) throws UnsupportedEncodingException {
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		int count = setBoardDo.countsSetBoard(cri);
		List<SetBoard> list = setBoardDo.selectListSetBoard(cri);
		for (SetBoard temp : list) {
			int haha = temp.getF_link().lastIndexOf("/");
			String hohoho = temp.getF_link().substring(0,haha);
			int hoho=hohoho.lastIndexOf("/");
			String hahaha=hohoho.substring(hoho+1);
			if (NumberUtils.isNumber(hahaha)) {
				temp.setNumOfPosts(myBoardDo.getNumOfPosts(Integer.parseInt(hahaha)));
			}
		}
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
	public String create(SetBoard setBoard,HttpServletRequest request) throws FileNotFoundException, IOException {
		setBoardDo.updateAdministration();
		String link = setBoard.getF_link();
		int max = setBoardDo.getMaximum();

		// 추후 디렉토리명 변경
		String rootPath=request.getSession().getServletContext().getRealPath("/");
		String path = rootPath+"\\WEB-INF\\views\\sub\\" + link + "\\"
				+ max;
		
		createFile(path,rootPath);
		setBoard.setF_bid(max);
		setBoard.setF_comment_img_width("0");
		setBoard.setF_ip_view("0");
		setBoard.setF_comment_use("0");
		setBoard.setF_reply_use("0");
		setBoard.setF_file_use("0");
		setBoard.setF_reply("0");
		setBoard.setF_comment("0");
		setBoard.setF_comment_del("0");
		setBoard.setF_link("/admin/bbs/" + link + "/" + max + "/list");
		setBoard.setF_read(setBoard.getF_read().replaceAll(",", ""));
		setBoard.setF_write(setBoard.getF_write().replaceAll(",", ""));
		setBoard.setF_edit(setBoard.getF_edit().replaceAll(",", ""));
		setBoard.setF_delete(setBoard.getF_delete().replaceAll(",", ""));
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
	public String modify(SetBoard setBoard, SearchCriteria cri) {
		setBoard.setF_read(setBoard.getF_read().replaceAll(",", ""));
		setBoard.setF_write(setBoard.getF_write().replaceAll(",", ""));
		setBoard.setF_edit(setBoard.getF_edit().replaceAll(",", ""));
		setBoard.setF_delete(setBoard.getF_delete().replaceAll(",", ""));
		setBoard.setF_reply(setBoard.getF_reply().replaceAll(",", ""));
		setBoard.setF_comment(setBoard.getF_comment().replaceAll(",", ""));
		setBoard.setF_comment_del(setBoard.getF_comment_del().replaceAll(",", ""));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		;
		setBoardDo.updateSetBoard(setBoard);
		return "redirect:/setBoard/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "f_id") int f_id, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		setBoardDo.deleteSetBoard(f_id);
		return "redirect:/setBoard/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

	private boolean createFile(String path,String rootPath) throws FileNotFoundException, IOException {
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
			FileCopyUtils.copy(
					new FileInputStream(
							rootPath+"\\resources\\template\\board\\list.jsp"),
					new FileOutputStream(path + "\\list.jsp"));
			FileCopyUtils.copy(
					new FileInputStream(
							rootPath+"\\resources\\template\\board\\create.jsp"),
					new FileOutputStream(path + "\\create.jsp"));
			FileCopyUtils.copy(
					new FileInputStream(
							rootPath+"\\resources\\template\\board\\read.jsp"),
					new FileOutputStream(path + "\\read.jsp"));
			return true;
		}
		return false;
	}

}