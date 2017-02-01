package com.coresec.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coresec.admin.domain.Online;
import com.coresec.admin.domain.PageMaker;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.persistence.OnlineDo;

@Controller
@RequestMapping(value = "/online")
public class OnlineController {
	@Inject
	OnlineDo onlineDo;

	@RequestMapping(value = "/list")
	public void list(Model model, SearchCriteria cri) {

		PageMaker pageMaker = new PageMaker();
		int count = onlineDo.getCount(cri);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		if (cri.getKeyword() != null && cri.getKeyword().equals("")) {
			cri.setKeyword(null);
		}
		List<Online> list = onlineDo.selectList(cri);
		for (Online temp : list) {
			temp.setF_subject(onlineDo.getSubject(temp.getF_eid()));
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
					result += onlineDo.getCategoryName(Integer.toString(tem));
					result += " > ";
					divisor_real /= 100;

				}
				temp.setF_ca_name(result);
			}
			result += onlineDo.getCategoryName(temp.getF_ca_id());
			temp.setF_ca_name(result);

		}
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("list", list);
	}
}
