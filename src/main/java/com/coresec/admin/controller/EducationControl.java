package com.coresec.admin.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.CategoryNames;
import com.coresec.admin.domain.Education;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.CategoryDo;
import com.coresec.admin.persistence.EducationDo;

@Controller
@RequestMapping(value = "/education/*")
public class EducationControl {
	@Inject
	EducationDo educationDo;
	
	@Inject
	CategoryDo categoryDo;

	@RequestMapping(value = "/list")
	public String list(SearchCriteria cri, Model model) throws UnsupportedEncodingException {
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int count = educationDo.countsEducation(cri);
		pageMaker.setTotalCount(count);
		List<CategoryNames> names=categoryDo.getCategoryNames();
		for(CategoryNames temp:names){
			if(temp.getF_ca_id().length()>2){
				temp.setF_ca_name("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+temp.getF_ca_name());
			}
		}

		List<Education> list = educationDo.selectListEducation(cri);
		for (Education temp : list) {
			temp.setF_subject(educationDo.getSubject(temp.getF_id()));
			String result = "";
			if (temp.getF_ca_id().length() > 2) {
				int f_ca_id = Integer.parseInt(temp.getF_ca_id());
				String divisor = "1";
				for (int i = 0; i < temp.getF_ca_id().length() - 2; i++) {
					divisor += "0";
				}
				int divisor_real = Integer.parseInt(divisor);
				while (divisor_real > 1) {

					int tem = (int) (f_ca_id / divisor_real);
					result += categoryDo.getCategoryName(Integer.toString(tem));
					result += " > ";
					divisor_real /= 100;

				}
				temp.setF_ca_name(result);
			}
			result += categoryDo.getCategoryName(temp.getF_ca_id());
			temp.setF_ca_name(result);

		}
		model.addAttribute("categoryNames",names);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		return "/education/list";
	}

	@RequestMapping(value = "/create")
	public String create() {
		return "/education/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPOST(Education education, SearchCriteria cri,HttpServletRequest request) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		educationDo.insertEducation(education);
		
		HttpSession sess=request.getSession(false);
		Map<String,Integer> list=(Map<String, Integer>) sess.getAttribute("list");
		list.put("category",educationDo.getBadge());
		sess.setAttribute("list", list);
		
		
		return "redirect:/education/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

	@RequestMapping(value = "/modify")
	public String modify(@RequestParam(value = "f_id") int f_id, Model model,SearchCriteria cri) {
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		Education item = educationDo.selectOneEducation(f_id);
		model.addAttribute("item",item);
		model.addAttribute(pageMaker);
		return "/education/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(Education education, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		educationDo.updateEducation(education.getF_id());
		return "redirect:/education/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}

	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "f_id") int f_id, SearchCriteria cri) {
		educationDo.deleteEducation(f_id);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		return "redirect:/education/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}
