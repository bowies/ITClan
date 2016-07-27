package spring.sts.itclan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import spring.model.personalmember.*;
import spring.utility.itclan.*;

@Controller
public class PersonalmemberController {
	@Autowired
	private PersonalMemberDAO dao;
	
	@RequestMapping("/personal/deletePwC")
	public String deletePwC(String memberID , String passwd){
		if(dao.passwdCheck(memberID, passwd)>0){
			return "/personalmember/delete";
		}else{
			return "/error/passwderror";
		}
		
	}
	
	@RequestMapping("/personal/delete")
	public String delete(String memberID) throws Exception{
		if(dao.delete(memberID)>0){
			return "redirect:/";
		}else{
			return "error/error";
		}
		
	}
	
	@RequestMapping(value="/personal/pwFind",method=RequestMethod.POST)
	public String pwFind(Model model,String memberID , String email){
		String passwd = dao.pwFind(memberID, email);
		model.addAttribute("memberID",memberID);
		return "/personalmember/pwFindProc"; 
	}
	
	@RequestMapping(value="/personal/pwFind",method=RequestMethod.GET)
	public String pwFind(){
		return "/personalmember/pwFind";
	}
	@RequestMapping(value="/personal/idFind",method=RequestMethod.POST)
	public String idFind(Model model,String name , String email){
		String memberID = dao.idFind(name, email);
		model.addAttribute("memberID",memberID);
		return "/personalmember/idFindProc"; 
	}
	
	@RequestMapping(value="/personal/idFind",method=RequestMethod.GET)
	public String idFind(){
		return "/personalmember/idFind";
	}
	@RequestMapping(value="/personal/updatePw",method=RequestMethod.POST)
	public String updatePw(Model model,String passwd ,String memberID){
		
		
		if(dao.updatePw(passwd, memberID)>0){
			return "redirect:/personalmember/read";
		}else{
			return "/error/error";
		}
	}
	@RequestMapping(value="/personal/updatePw",method=RequestMethod.GET)
	public String updatePw(String memberID,HttpSession session){
		if(memberID == null){
			memberID = (String)session.getAttribute("memberID");
		}
		return "/personalmember/updatePw";
	}
	
	@RequestMapping(value="/personal/login",method=RequestMethod.POST)
	public String login(String memberID, String passwd,String c_id,
		HttpSession session,HttpServletResponse response,Model model){
		int cnt = 0;
		String grade = "";
		
		cnt = dao.loginCheck(memberID, passwd);
		if(cnt ==1){
			grade = dao.getGrade(memberID);
			session.setAttribute("memberID", memberID);
			session.setAttribute("grade", grade);
			
			Cookie cookie = null;
			if(c_id != null){
				cookie = new Cookie("c_id","Y");
				cookie.setMaxAge(300); // 5분유지
				response.addCookie(cookie);
				
				cookie = new Cookie("c_id_val",memberID);
				cookie.setMaxAge(300); // 5분유지
				response.addCookie(cookie);
			}else{
				cookie = new Cookie("c_id","");
				cookie.setMaxAge(0); // 5분유지
				response.addCookie(cookie);
				
				cookie = new Cookie("c_id_val","");
				cookie.setMaxAge(0); // 5분유지
				response.addCookie(cookie);
			}
			return "redirect:/";
		}else{
			return "/error/passwderror";
		}
		
	}
	
	@RequestMapping(value="/personal/login",method=RequestMethod.GET)
	public String login(HttpServletRequest request){
		String c_id = "";
		String c_id_val = "";
		
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		
		if(cookie != null){
			for(int i = 0; i < cookies.length ; i++){
				cookie = cookies[i];
				if(cookie.getName().equals("c_id")){
					c_id = cookie.getValue();
				}else if(cookie.getName().equals("c_id_val")){
						c_id_val = cookie.getValue();
				}
			}
		}
			
			request.setAttribute("c_id", c_id);
			request.setAttribute("c_id_val", c_id_val);
		
		return "/personalmember/login"; 
	}
	
	@RequestMapping("/personal/EmailCheckForm")
	public String emailCheckF(){
		return "/personalmember/emailCheckForm";
	}
	
	@RequestMapping("/personal/EmailCheckProc")
	public String emailCheckP(String email,Model model){
		int cnt = dao.EmailCheck(email);
		model.addAttribute("cnt", cnt);
		return "/personalmember/emailCheckProc";
	}
	@RequestMapping("/personal/idCheckForm")
	public String idCheckF(){
		return "/personalmember/idCheckForm";
	}
	
	@RequestMapping("/personal/idCheckProc")
	public String idCheckP(String memberID,Model model){
		int cnt = dao.idCheck(memberID);
		model.addAttribute("cnt", cnt);
		return "/personalmember/idCheckProc";
	}
	
	@RequestMapping(value="/personal/update",method=RequestMethod.POST)
	public String update(PersonalMemberDTO dto) throws Exception{
		if(dao.update(dto)>0){
			return "redirect:/personalmember/read";
		}else{
			return "/error/error";
		}
		
		
	}
	@RequestMapping(value="/personal/update",method=RequestMethod.GET)
	public String update(PersonalMemberDTO dto,String memberID
			,Model model) throws Exception{
		dto = (PersonalMemberDTO) dao.read(memberID);
		model.addAttribute("dto", dto);

		
		return "/personalmember/update";
	}
	@RequestMapping("/personal/updatePassC")
	public String UpdatePassC(String memberID,String passwd){
		if(dao.passwdCheck(memberID, passwd)>0){
			return "redirect:/personalmember/update";
		}else{
			return "/error/passwderror";
		}
		
	}
	
	@RequestMapping("/admin/list")
	public String list(HttpServletRequest request,Model model) throws Exception{
		String col = Utility.nullCheck(request.getParameter("col"));
		String word = Utility.nullCheck(request.getParameter("word"));
		if(col.equals("total")){
			word = "";
		}
		
		int nowPage = 1;
		int recordPerPage  = 5;
		if(request.getParameter("nowPage")!= null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int sno = ((nowPage -1)*recordPerPage)+1;
		int eno = nowPage * recordPerPage;
		
		Map map1 = new HashMap();
		map1.put("col", col);
		map1.put("word", word);
		map1.put("sno", sno);
		map1.put("eno", eno);
		
		Map map = new HashMap();
		map.put("col",col);
		map.put("word", word);
		int total = dao.total(map);
		
		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
		
		List<PersonalMemberDTO> list = dao.list(map1);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		
		
	return "/personalmember/list";
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
		return "/personalmember/read";
	}
	
	@RequestMapping(value="/personal/create",method=RequestMethod.POST)
	public String create(Model model ,PersonalMemberDTO dto, HttpServletRequest request) throws Exception{
		int cnt = 0;
	
			cnt = dao.create(dto);
		
		model.addAttribute("cnt",cnt);
		return "/personalmember/createProc";
	}
	@RequestMapping(value="/personal/create",method=RequestMethod.GET)
	public String create(){

		
		return "/personalmember/create";
	}
	@RequestMapping("/personal/agree")
	public String agree(){
		return "/personalmember/agree";
	}
}
