package spring.sts.itclan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.*;

import org.junit.internal.matchers.SubstringMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import spring.model.personalmember.*;
import spring.model.resumeinfo.ResumeInfoDAO;
import spring.utility.itclan.*;

@Controller
public class PersonalmemberController {
	@Autowired
	private PersonalMemberDAO dao;
	@Autowired
	private ResumeInfoDAO ridao;
	
	@Autowired
	private PersonalMemberMgr mgr;
	
	@RequestMapping(value="/personal/updatepic",method=RequestMethod.POST)
	public String updatepic(){
		
		return "/personalmember/updatepic";
	}
	@RequestMapping(value="/personal/updatepic",method=RequestMethod.GET)
	public String updatepic(String memberID, String picture,Model model){
		model.addAttribute("picture", picture);
		model.addAttribute("memberID", memberID);
		return "/personalmember/updatepic";
	}
	
	@RequestMapping("/personal/main_p")
	public String main_p(String memberID,HttpSession session,Model model){
		if(memberID == null){
		memberID = (String) session.getAttribute("memberID");
		}
		int cnt = dao.resumeCheck(memberID);
		String picture = dao.resumepic(memberID);
		model.addAttribute("cnt", cnt);
		model.addAttribute("picture", picture);
		model.addAttribute("memberID", memberID);
		return "/personalmember/main_p";
	}
	
	@RequestMapping("/personal/deletePwC")
	public String deletePwC(String memberID , String passwd,Model model){
		if(dao.passwdCheck(memberID, passwd)>0){
			model.addAttribute("memberID", memberID);
			return "redirect:/personal/delete";
		}else{
			return "/error/passwderror";
		}
		
	}
	
	@RequestMapping("/personal/delete")
	public String delete(String memberID,HttpSession session){
		
		try {
			mgr.delete(memberID);
			session.invalidate();
			return "redirect:/";
		} catch (Exception e) {
			// TODO: handle exception
			return "/error/error";
		}
		
		
		
	}
	
	@RequestMapping(value="/personal/pwFind",method=RequestMethod.POST)
	public String pwFind(Model model,String memberID , String email){
		String passwd = dao.pwFind(memberID, email);
		model.addAttribute("passwd",passwd);
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
	@RequestMapping(value="/personal/updatepw",method=RequestMethod.POST)
	public String updatePw(Model model,String passwd ,String memberID,HttpSession session){
		
		
		if(dao.updatePw(passwd, memberID)>0){
			session.invalidate();
			return "redirect:/";
		}else{
			return "/error/error";
		}
	}
	@RequestMapping(value="/personal/updatepw",method=RequestMethod.GET)
	public String updatePw(String memberID,HttpSession session,Model model){
		if(memberID == null){
			memberID = (String)session.getAttribute("memberID");
		}
		model.addAttribute("memberID", memberID);
		return "/personalmember/updatepw";
	}
	@RequestMapping("/personal/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}
	@RequestMapping(value="/personal/login",method=RequestMethod.POST)
	public String login(String memberID, String passwd,String c_id,
		HttpSession session,HttpServletResponse response,Model model){
		int cnt = 0;
		
		cnt = dao.loginCheck(memberID, passwd);
		if(cnt ==1){
			PersonalMemberDTO member = dao.getGrade(memberID);
			session.setAttribute("memberID", memberID);
			session.setAttribute("grade", member.getGrade());
			session.setAttribute("name", member.getName());
			
			
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
	
	@RequestMapping("/personal/email_form")
	public String emailCheckF(){
		return "/personalmember/email_form";
	}
	
	@RequestMapping("/personal/email_proc")
	public String emailCheckP(String email,Model model){
		int cnt = dao.EmailCheck(email);
		model.addAttribute("cnt", cnt);
		model.addAttribute("email", email);
		return "/personalmember/email_proc";
	}
	@RequestMapping("/personal/id_form")
	public String idCheckF(){
		return "/personalmember/id_form";
	}
	
	@RequestMapping("/personal/id_proc")
	public String idCheckP(String memberID,Model model){
		int cnt = dao.idCheck(memberID);
		model.addAttribute("cnt", cnt);
		model.addAttribute("memberID", memberID);
		return "/personalmember/id_proc";
	}
	
	@RequestMapping(value="/personal/update",method=RequestMethod.POST)
	public String update(PersonalMemberDTO dto) throws Exception{
		
		if(dao.update(dto)>0){
			
			return "redirect:/personal/read";
		}else{
			return "/error/error";
		}
		
		
	}
	@RequestMapping(value="/personal/update",method=RequestMethod.GET)
	public String update(PersonalMemberDTO dto,String memberID
			,Model model,HttpSession session) throws Exception{
		if(memberID ==null){
			memberID = (String)session.getAttribute("memberID");
		}
		dto = (PersonalMemberDTO) dao.read(memberID);
		model.addAttribute("dto", dto);


		
		return "/personalmember/update";
	}
	@RequestMapping("/personal/updatePassC")
	public String UpdatePassC(String memberID,String passwd){
		if(dao.passwdCheck(memberID, passwd)>0){
			return "redirect:/personal/update";
		}else{
			return "/error/passwderror";
		}
		
	}
	@RequestMapping("/personal/updatepwC")
	public String UpdatepwC(String memberID,String passwd){
		if(dao.passwdCheck(memberID, passwd)>0){
			return "redirect:/personal/updatepw";
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
		
		
	return "/admin/list";
	}
	
	@RequestMapping("/personal/read")
	public String read(String memberID,HttpSession session,
			PersonalMemberDTO dto,Model model) throws Exception{
		if(memberID == null){
			memberID = (String)session.getAttribute("memberID");
		}
		
			dto = (PersonalMemberDTO) dao.read(memberID);
		
		String birth1 = dto.getBirth();
		
		
		StringBuffer birth = new StringBuffer();
		birth.append(birth1.substring(0,2));
		birth.append("년 ");
		birth.append(birth1.substring(2,4));
		birth.append("월 ");
		birth.append(birth1.substring(4,6));
		birth.append("일");
		model.addAttribute("birth", birth);
		model.addAttribute("dto",dto);
		return "/personalmember/read";
	}
	@RequestMapping("/personal/main_p")
	public String main_p(String memberID,Model model,HttpSession session){
		if(memberID == null){
			memberID = (String)session.getAttribute("memberID");
		}
		String picture = ridao.viewPic(memberID);
		
		model.addAttribute("picture", picture);
		return "/personalmember/main_p";
	}
	
	@RequestMapping(value="/personal/create",method=RequestMethod.POST)
	public String create(Model model ,PersonalMemberDTO dto, HttpServletRequest request,String memberID,
			String email) throws Exception{
		int cnt = 0;
		
	
	boolean flag = false;
	if(dao.idCheck(memberID)>0 || dao.EmailCheck(email)>0 ){
		flag = true;
	}
	if(!flag){
		
	cnt = dao.create(dto);
	}
		model.addAttribute("cnt",cnt);
		model.addAttribute("flag",flag); 
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
