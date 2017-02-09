package com.coresec.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
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

	@RequestMapping(value = "/list",params="mode=create")
	public String register(SearchCriteria cri, Model model) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("pageMaker", pageMaker);
		return "/popup/register";
	}

	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String registerPOST(SearchCriteria cri, Popup popup,HttpServletRequest request,WebRequest req,@RequestParam(value="map") String[]map,@RequestParam(value="src") String src) {
		int i=0;
		String coords=request.getParameter("coords");
		StringTokenizer ts=new StringTokenizer(coords,"|");
		String appendMap="<img src='"+src+"' width='"+popup.getF_width()+"' height='"+popup.getF_height()+"' usemap='#"+popup.getF_subject()+"'><map name='"+popup.getF_subject()+"'>";
		while(ts.hasMoreTokens()){
			appendMap+="<area shape='rect' coords='"+ts.nextToken()+"' href='"+map[i++]+"'>";
		}
	
				
		

		appendMap+="</map>";
		popup.setF_comment(appendMap);
		popupDo.insertPopup(popup);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		HttpSession sess=request.getSession(false);
		Map<String,Integer> list=(Map<String, Integer>) sess.getAttribute("list");
		//list.put("popup",popupDo.getBadge());
		sess.setAttribute("list", list);
		
		
		return "redirect:/popup/list" + pageMaker.makeSearch(cri.getPage());
	}

	@RequestMapping(value = "/list",params="mode=modify")
	public String modify(@RequestParam(value = "f_id") int f_id, Model model, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		Popup item = popupDo.selectOnePopup(f_id);
		String temp=item.getF_comment();
		Pattern pattern=Pattern.compile("href=\'([^\']*)");
		Pattern coordsPattern=Pattern.compile("coords=\'([^\']*)");
		Matcher m=pattern.matcher(temp);
		System.out.println(temp);
		List<String> coordsList=new ArrayList<>();
		List<String> hrefList=new ArrayList<>();
		int i=0;
		while(m.find()){
			hrefList.add(m.group(i).substring(6));
		}
		m=coordsPattern.matcher(temp);
		i=0;
		while(m.find()){
			coordsList.add(m.group(i).substring(8));
		}
		
		model.addAttribute("item", item);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("coordsList",coordsList);
		model.addAttribute("hrefList",hrefList);
		return "/popup/register";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(Popup popup, Model model, SearchCriteria cri,HttpServletRequest request,@RequestParam(value="map") String[]map,@RequestParam(value="src") String src) {
		int i=0;
		String coords=request.getParameter("coords");
		StringTokenizer ts=new StringTokenizer(coords,"|");
		String appendMap="<img src='"+src+"' width='"+popup.getF_width()+"' height='"+popup.getF_height()+"' usemap='#"+popup.getF_subject()+"'><map name='"+popup.getF_subject()+"'>";
		while(ts.hasMoreTokens()){
			appendMap+="<area shape='rect' coords='"+ts.nextToken()+"' href='"+map[i++]+"'>";
		}
	
				
		

		appendMap+="</map>";
		popup.setF_comment(appendMap);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
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
			String rootPath=request.getSession().getServletContext().getRealPath("/");
			System.out.println(rootPath);
			String uploadPath = rootPath+"\\resources\\admin\\popup\\img\\" + fileName;

			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			String fileUrl = "/admin/resources/admin/popup/img/" + fileName;// url경로
			String json="{\"filePath\":\""+fileUrl+"\",\"msg\":\"이미지 업로드에 성공하였습니다!\"}";

			printWriter = response.getWriter();
			printWriter.println(json);

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
