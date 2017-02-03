package com.coresec.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coresec.admin.domain.Popup;
import com.coresec.admin.domain.Survey;
import com.coresec.admin.persistence.PopupDo;
import com.coresec.admin.persistence.SurveyDo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	PopupDo popupDo;
	
	@Inject
	SurveyDo surveyDo;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpServletRequest request) throws IOException {
		List<Popup> list = popupDo.applyForPopups();
		request.setAttribute("list", list);
		List<Survey> listForSurvey=surveyDo.applyForSurvey();
		
		request.setAttribute("listForSurvey",listForSurvey);
		return "home";

	}
	
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public String test(){
		return "/template/faqTemplate";
	}

}
