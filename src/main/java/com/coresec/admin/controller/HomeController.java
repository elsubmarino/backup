package com.coresec.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coresec.admin.domain.Popup;
import com.coresec.admin.domain.Survey;
import com.coresec.admin.domain.Survey_items;
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

//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpServletRequest request) throws IOException {
		List<Popup> list = popupDo.applyForPopups();
		request.setAttribute("list", list);
		List<Survey> listForSurvey=surveyDo.applyForSurvey();
		List<List<Survey_items>> surveyList = new ArrayList<>();
		List<String> surveyListTitle=new ArrayList<>();
		for(Survey temp:listForSurvey){
			List<Survey_items> listForSurveyItems=surveyDo.applyForSurveyItems(temp.getF_id());
			surveyList.add(listForSurveyItems);
			surveyListTitle.add(temp.getF_subject());

		}
		
		request.setAttribute("surveyList",surveyList);
		request.setAttribute("surveyListTitle",surveyListTitle);
		return "home";

	}
	
	@RequestMapping(value="/test",method=RequestMethod.GET)
	public String test(){
		return "/template/faqTemplate";
	}

}
