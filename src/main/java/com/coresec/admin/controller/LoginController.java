package com.coresec.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.Admin;
import com.coresec.admin.persistence.AdminDo;
import com.coresec.admin.persistence.CategoryDo;
import com.coresec.admin.persistence.EducationDo;
import com.coresec.admin.persistence.PopupDo;
import com.coresec.admin.persistence.SetBoardDo;

@Controller
public class LoginController {
	@Inject
	AdminDo memberDo;
	
	@Inject
	CategoryDo categoryDo;
	
	@Inject
	EducationDo educationDo;
	
	@Inject
	PopupDo popupDo;
	
	@Inject
	SetBoardDo setBoardDo;

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, Model model, HttpServletResponse response) {
		Cookie[] id = request.getCookies();
		if (id != null) {
			for (Cookie temp : id) {
				if (temp.getName().equals("id")) {
					model.addAttribute("id", temp.getValue());
				}
			}
		}
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void loginPOST(Admin member, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "checkForId") String checkForId) throws IOException {
		Admin me = memberDo.auth(member);

		if (checkForId.equals("true")) {
			Cookie id = new Cookie("id", member.getF_idno());
			id.setMaxAge(999999999);
			response.addCookie(id);
		} else if (checkForId.equals("false")) {
			Cookie id = new Cookie("id", member.getF_idno());
			id.setMaxAge(0);
			response.addCookie(id);
		}

		if (me != null) {
			Map<String,Integer> list=new HashMap<>();
			list.put("popup",popupDo.getBadge());
			list.put("education",educationDo.getBadge());
			response.getWriter().print("success");
			HttpSession sess = request.getSession();
			sess.setAttribute("admin", me);
			sess.setAttribute("list", list);
			sess.setMaxInactiveInterval(3600);
			return;
		}
		response.getWriter().print("fail");
		;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession sess=request.getSession(false);
		sess.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/passwordch",method=RequestMethod.POST)
	public void passwordch(HttpServletResponse response,@RequestParam(value="password1") String password1,@RequestParam(value="f_idno") String f_idno){
		Map<String,Object> temp=new HashMap<>();
		temp.put("f_passwd",password1);
		temp.put("f_idno", f_idno);
		memberDo.changePassword(temp);
	}
}
