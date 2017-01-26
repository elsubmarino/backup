package com.coresec.admin.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.coresec.admin.domain.Popup;
import com.coresec.admin.persistence.PopupDo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	PopupDo popupDo;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		HttpSession sess = request.getSession(false);
		if (sess != null && sess.getAttribute("admin") != null) {
			List<Popup> list=popupDo.applyForPopups();
			model.addAttribute(list);
			return "home";
		}
		return "redirect:/login";

	}

}
