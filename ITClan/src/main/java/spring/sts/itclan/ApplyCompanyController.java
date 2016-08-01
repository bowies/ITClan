package spring.sts.itclan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.applycompany.*;
import spring.utility.itclan.Utility;

@Controller
public class ApplyCompanyController {
	@Autowired
	private ApplyCompanyDAO dao;

	
	
	@RequestMapping(value="/applycompany/create",method=RequestMethod.POST)
	public String create(ApplyCompanyDTO dto, Model model,String memberID,int offerNum) throws Exception{
		int cnt = dao.create(dto);
		model.addAttribute("cnt", cnt);
		model.addAttribute("memberID", memberID);
		model.addAttribute("offerNum", offerNum);
		
		return "/applycompany/create";
	}
	
	@RequestMapping(value="/applycompany/create",method=RequestMethod.GET)
	public String create(HttpSession session, int offerNum,Model model){
		String memberID = (String)session.getAttribute("memberID");
		model.addAttribute("offerNum", offerNum);
		model.addAttribute("memberID", memberID);
		
		return "/applycompany/create";
	}
	
	
	@RequestMapping("/applycomapny/list_personal")
	public String list_personal(HttpServletRequest request,HttpSession session,
			Model model) throws Exception{
		int nowPage = 1;
		if(request.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;
		int sno = ((nowPage-1)* recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		String memberID = (String)session.getAttribute("memberID");
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("memberID", memberID);

		
		List<ApplyCompanyDTO> list = dao.list(map);
		
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);		
		
		
		
		return "/applycompany/list_personal";
	}
	
	

}
