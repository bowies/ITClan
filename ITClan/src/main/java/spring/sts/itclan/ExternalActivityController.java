package spring.sts.itclan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		memberID = "ccc";
				
		model.addAttribute("memberID", memberID);
		model.addAttribute("externalactivitydto", externalactivitydto);
		return "/externalActivity/createForm";
	}
	
	@RequestMapping(value="/externalActivity/create",method=RequestMethod.POST)
	public String create(HttpSession session, String memberID, Model model, ExternalActivityDTO externalactivitydto) throws Exception{
		
			Map map = new HashMap();
			map.put("memberID", memberID);
		
		if(externalactivitydao.create(externalactivitydto)>0){
			List<ExternalActivityDTO>externalactivitylist =  externalactivitydao.list(map);
			model.addAttribute("externalactivitylist", externalactivitylist);
			return "/externalActivity/createProc";
		}else {
			return "error/error";
		}
	}
	
	@RequestMapping(value="/externalActivity/delete",method=RequestMethod.GET)
	public String delete(int actNum, Model model) throws Exception{
		
		model.addAttribute("actNum", actNum);
	
		return "/externalActivity/deleteForm";
		
	}
	
	@RequestMapping(value="/externalActivity/delete",method=RequestMethod.POST)
	public String delete(int actNum) throws Exception{
		
		if(externalactivitydao.delete(actNum)>0){
			return "/externalActivity/deleteProc";
		
		}else {
			return "error/error";
		}
	}
}
