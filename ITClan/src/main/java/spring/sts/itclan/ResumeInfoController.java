package spring.sts.itclan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.resumeinfo.ResumeInfoDAO;
import spring.model.resumeinfo.ResumeInfoDTO;

@Controller
public class ResumeInfoController {

	@Autowired
	private ResumeInfoDAO resumedao;
	
	@RequestMapping(value="/resumeInfo/create",method=RequestMethod.GET)
	public String create() {
		PersonalMemberDTO dto = dao.
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
		
		ResumeInfoDTO dto = (ResumeInfoDTO) resumedao.read(pk);
		
		model.addAttribute("dto",dto);
		
		return "/resumeInfo/read";
	}

	@RequestMapping(value="/resumeInfo/update",method=RequestMethod.GET)
	public String update(String pk, Model model) throws Exception{
		
		ResumeInfoDTO dto = (ResumeInfoDTO) resumedao.read(pk);
		
		model.addAttribute("dto",dto);
		
		return "/resumeInfo/update";
	}
}
