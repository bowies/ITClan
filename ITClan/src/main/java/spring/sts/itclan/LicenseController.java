package spring.sts.itclan;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.resumeinfo.ResumeInfoDAO;
import spring.model.resumeinfo.ResumeInfoDTO;

@Controller
public class LicenseController {
	
	@Autowired
	private ResumeInfoDAO resumedao;
	
	@RequestMapping(value="/license/create",method=RequestMethod.GET)
	public String create(String memberID, HttpSession session){
		
		if(memberID==null){
			memberID = (String)session.getAttribute(memberID);
		}
		memberID = "aaa";
		
		return "/license/create";
	}
	
	@RequestMapping(value="/license/create",method=RequestMethod.POST)
	public String create(String memberID, ResumeInfoDTO resumedto) throws Exception{
		
		if(resumedao.create(resumedto)>0){
			
			return "../resumeInfo/create";
		}else {
			return "error/error";
		}
	}
}
