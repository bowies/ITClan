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

import spring.model.personalmember.*;
import spring.utility.itclan.*;

@Controller
public class PersonalmemberController {
	@Autowired
	private PersonalMemberDAO dao;
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
	public String create(Model model ,PersonalMemberDTO dto, HttpServletRequest request) throws Exception{
		int cnt = 0;
	
			cnt = dao.create(dto);
		
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
