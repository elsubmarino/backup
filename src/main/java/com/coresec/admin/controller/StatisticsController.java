package com.coresec.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/statistics/*")
public class StatisticsController {
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request) throws ParseException, FileNotFoundException {
		//D:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\logs		
		String realPath=request.getSession().getServletContext().getRealPath("");
		System.out.println(realPath);
		realPath=realPath.substring(0,realPath.lastIndexOf("\\"));
		realPath=realPath.substring(0,realPath.lastIndexOf("\\"));
		realPath=realPath.substring(0,realPath.lastIndexOf("\\"));
		realPath+="\\logs\\";
		System.out.println(realPath);
		
		
		
		String temp="localhost_access_log.";
		String received="2017-02-07";
		temp+=received+".txt";
		FileInputStream fis=new FileInputStream(new File(realPath+temp));
		
		
		return "/statistics/list";
	}
}
