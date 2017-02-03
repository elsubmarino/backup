package com.coresec.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.Popup;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.PopupDo;

@Controller
@RequestMapping(value = "/popup/*")
public class PopupController {
	@Inject
	PopupDo popupDo;
	

	@RequestMapping(value = "/list")
	public String list(Model model, SearchCriteria cri) throws UnsupportedEncodingException {
		PageMaker pageMaker = new PageMaker();
		int count = popupDo.countsPopup(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Popup> list = popupDo.selectListPopup(cri);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
		return "/popup/list";
	}

	@RequestMapping(value = "/register")
	public String register(SearchCriteria cri, Model model) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("pageMaker", pageMaker);
		return "/popup/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(SearchCriteria cri, Popup popup,HttpServletRequest request) {
		
		popup.setF_comment(popup.getF_comment().replaceAll("\r\n", ""));
		popupDo.insertPopup(popup);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		HttpSession sess=request.getSession(false);
		Map<String,Integer> list=(Map<String, Integer>) sess.getAttribute("list");
		//list.put("popup",popupDo.getBadge());
		sess.setAttribute("list", list);
		
		
		return "redirect:/popup/list" + pageMaker.makeSearch(cri.getPage());
	}

	@RequestMapping(value = "/modify")
	public String modify(@RequestParam(value = "f_id") int f_id, Model model, SearchCriteria cri) {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		Popup item = popupDo.selectOnePopup(f_id);
		model.addAttribute("item", item);
		model.addAttribute("pageMaker", pageMaker);
		return "/popup/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(Popup popup, Model model, SearchCriteria cri) {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		popup.setF_comment(popup.getF_comment().replaceAll("\r\n", ""));
		popupDo.updatePopup(popup);
		return "redirect:/popup/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "f_id") int f_id, SearchCriteria cri) {
		popupDo.deletePopup(f_id);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		return "redirect:/popup/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) {

		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String uploadPath = "C:\\Users\\jiwankim\\git\\coresecadmin\\src\\main\\webapp\\resources\\admin\\popup\\img\\" + fileName;

			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			String callback = request.getParameter("CKEditorFuncNum");

			printWriter = response.getWriter();
			String fileUrl = "/admin//resources/admin/popup/img/" + fileName;// url경로

			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(" + callback
					+ ",'" + fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

}
