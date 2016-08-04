package spring.sts.itclan;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.license.LicenseDAO;
import spring.model.license.LicenseDTO;


@Controller
public class LicenseController {
	
	@Autowired
	private LicenseDAO licensedao;
	
	@RequestMapping(value="/license/create",method=RequestMethod.GET)
	public String create(LicenseDTO licensedto, Model model, String memberID, HttpSession session) throws Exception{
		
		if(memberID==null){
			memberID = (String)session.getAttribute(memberID);
		}
		memberID = "aaa";
				
		model.addAttribute("memberID", memberID);
		
		return "/license/createForm";
	}
	
	@RequestMapping(value="/license/create",method=RequestMethod.POST)
	public String create( Model model,String memberID, LicenseDTO licensedto) throws Exception{
		
		if(licensedao.create(licensedto)>0){
			return "/license/createProc";
		}else {
			return "error/error";
		}
	}
}
