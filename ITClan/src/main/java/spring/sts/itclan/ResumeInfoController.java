package spring.sts.itclan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.personalmember.PersonalMemberDAO;
import spring.model.personalmember.PersonalMemberDTO;
import spring.model.resumeinfo.ResumeInfoDAO;
import spring.model.resumeinfo.ResumeInfoDTO;

@Controller
public class ResumeInfoController {

	@Autowired
	private ResumeInfoDAO resumedao;
	
	@Autowired
	private PersonalMemberDAO personalmemberdao;
	
	@RequestMapping(value="/resumeInfo/create",method=RequestMethod.GET)
	public String create(String pk, Model model) throws Exception {
		
		PersonalMemberDTO personalmemberdto = (PersonalMemberDTO) personalmemberdao.read(pk);
		
		model.addAttribute("personalmemberdto", personalmemberdto);
		
		return "/resumeInfo/create";
	}
	
	@RequestMapping(value="/resumeInfo/create",method=RequestMethod.POST)
	public String create(ResumeInfoDTO dto) throws Exception {
		
		if(resumedao.create(dto)>0){
			return "redirect:../";
		}
		else{
			return "error/error";
		}
	}
	
	@RequestMapping("/resumeInfo/read")
	public String read(String pk, Model model) throws Exception{
		
		ResumeInfoDTO resumedto = (ResumeInfoDTO) resumedao.read(pk);
		
		model.addAttribute("resumedto",resumedto);
		
		return "/resumeInfo/read";
	}

	@RequestMapping(value="/resumeInfo/update",method=RequestMethod.GET)
	public String update(String pk, Model model) throws Exception{
		
		ResumeInfoDTO dto = (ResumeInfoDTO) resumedao.read(pk);
		
		model.addAttribute("dto",dto);
		
		return "/resumeInfo/update";
	}
}
