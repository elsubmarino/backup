package com.coresec.admin.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.Member;
import com.coresec.admin.persistence.MemberDo;

@Controller
public class LoginController {
	@Inject
	MemberDo memberDo;

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, Model model, HttpServletResponse response) {
		Cookie[] id = request.getCookies();
		for (Cookie temp : id) {
			if (temp.getName().equals("id")) {
				model.addAttribute("id", temp.getValue());
			}
		}
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void loginPOST(Member member, HttpServletResponse response,
			@RequestParam(value = "checkForId") String checkForId) throws IOException {
		Member me = memberDo.auth(member);
		if (checkForId.equals("true")) {
			System.out.println("asfsdf");
			Cookie id = new Cookie("id", member.getId());
			id.setMaxAge(999999999);
			response.addCookie(id);
		}else if(checkForId.equals("false")){
			Cookie id = new Cookie("id", member.getId());
			id.setMaxAge(0);
			response.addCookie(id);
		}

		if (me != null) {

			response.getWriter().print("success");
			return;
		}
		response.getWriter().print("fail");
		;
	}
}
