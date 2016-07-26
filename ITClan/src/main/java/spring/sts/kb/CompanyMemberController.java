package spring.sts.kb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import spring.model.companymember.CompanyMemberDAO;

@Controller
public class CompanyMemberController {
	
	@Autowired
	private CompanyMemberDAO dao;
	
	
	
}
