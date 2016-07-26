package spring.sts.itclan;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.personalmember.PersonalMemberDAO;
import spring.model.personalmember.PersonalMemberDTO;

@Controller
public class PersonalmemberController {
	@Autowired
	private PersonalMemberDAO dao;
	@RequestMapping("/admin/list")
	public String list(){
		
		
		return "/personal/list";
	}
	
	@RequestMapping("/personal/read")
	public String read(String memberID,HttpSession session,
			PersonalMemberDTO dto,Model model){
		if(memberID == null){
			memberID = (String)session.getAttribute("memberID");
		}
		try {
			dto = (PersonalMemberDTO) dao.read(memberID);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("dto",dto);
		return "/personal/read";
	}
	
	@RequestMapping(value="/personal/create",method=RequestMethod.POST)
	public String create(Model model ,PersonalMemberDTO dto, HttpServletRequest request){
		int cnt = 0;
		try {
			cnt = dao.create(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("cnt",cnt);
		return "/personal/createProc";
	}
	@RequestMapping(value="/personal/create",method=RequestMethod.GET)
	public String create(){

		
		return "/personal/createform";
	}
	@RequestMapping("/personal/agree")
	public String agree(){
		return "/personal/agreement";
	}
}
