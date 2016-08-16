package spring.sts.itclan;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.externalactivity.ExternalActivityDAO;
import spring.model.externalactivity.ExternalActivityDTO;


@Controller
public class ExternalActivityController {

	@Autowired
	private ExternalActivityDAO externalactivitydao;
	
	@RequestMapping(value="/externalActivity/create",method=RequestMethod.GET)
	public String create(ExternalActivityDTO externalactivitydto, Model model, String memberID, HttpSession session) throws Exception{
		
		if(memberID==null){
			memberID = (String)session.getAttribute(memberID);
		}
		memberID = "aaa";
				
		model.addAttribute("memberID", memberID);
		
		return "/externalActivity/createForm";
	}
	
	@RequestMapping(value="/externalActivity/create",method=RequestMethod.POST)
	public String create( Model model,String memberID, ExternalActivityDTO externalactivitydto) throws Exception{
		
		if(externalactivitydao.create(externalactivitydto)>0){
			return "/externalActivity/createProc";
		}else {
			return "error/error";
		}
	}
	
	@RequestMapping("externalActivity/delete")
	public String delete(int actNum ,ExternalActivityDTO externalactivitydto) throws Exception{
		

		if(externalactivitydao.delete(actNum)>0){
			return "/externalActivity/deleteForm";			
		}else{
			return "error/error";
		}
	
	
	}
}
