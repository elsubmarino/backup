package com.coresec.admin.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coresec.admin.domain.Member;
import com.coresec.admin.persistence.MemberDo;

@Controller
public class LoginController {
	@Inject
	MemberDo memberDo;
	
	@RequestMapping(value="/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public void loginPOST(Member member,HttpServletResponse response) throws IOException{
		Member me=memberDo.auth(member);
		if(me!=null){
			response.getWriter().print("success");
			return;
		}
		response.getWriter().print("fail");;
	}
}
