package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coresec.admin.domain.CategoryNames;
import com.coresec.admin.domain.Online;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.CategoryDo;
import com.coresec.admin.persistence.EducationDo;
import com.coresec.admin.persistence.OnlineDo;

@Controller
@RequestMapping(value = "/online")
public class OnlineController {
	@Inject
	OnlineDo onlineDo;

	@Inject
	EducationDo educationDo;

	@Inject
	CategoryDo categoryDo;

	@RequestMapping(value = "/list")
	public void list(Model model, SearchCriteria cri) {
		List<CategoryNames> names = categoryDo.getCategoryNames();
		for (CategoryNames temp : names) {
			if (temp.getF_ca_id().length() > 2) {
				temp.setF_ca_name("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + temp.getF_ca_name());
			}
		}

		PageMaker pageMaker = new PageMaker();
		int count = onlineDo.getCount(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Online> list = onlineDo.selectList(cri);
		for (Online temp : list) {
			temp.setF_subject(educationDo.getSubject(temp.getF_eid()));
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
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("categoryNames", names);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "f_id") int f_id, SearchCriteria cri) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		onlineDo.delete(f_id);
		return "redirect:/online/list" + pageMaker.makeSearch(pageMaker.getCri().getPage());
	}
}
