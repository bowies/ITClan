package spring.sts.itclan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.applycompany.ApplyCompanyDAO;

@Controller
public class ApplyCompanyController {
	@Autowired
	private ApplyCompanyDAO dao;
	
	@RequestMapping("")
	public String list_personal(){
		return "/applycompany/list_personal";
	}
	
	

}
