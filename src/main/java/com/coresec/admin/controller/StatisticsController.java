package com.coresec.admin.controller;

import java.io.FileNotFoundException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coresec.admin.domain.Referer;
import com.coresec.admin.persistence.LogsDo;

@Controller
@RequestMapping(value = "/statistics/*")
public class StatisticsController {
	@Inject
	LogsDo logsDo;
	
	@RequestMapping(value = "list")
	public String list(HttpServletRequest request) throws ParseException, FileNotFoundException {
		return "/statistics/list";
	}
	
	@RequestMapping(value="search")
	public @ResponseBody List<Referer>search(@RequestParam(value="startDate") String startDate,@RequestParam(value="endDate") String endDate){
		Map<String,String> map=new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		List<Referer> list=logsDo.selectList(map);
		return list;
	}
}
