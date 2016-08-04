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
import spring.model.offer.OfferDTO;
import spring.model.personalmember.PersonalMemberDTO;
import spring.model.portfolio.PortFolioDTO;
import spring.model.resume.ResumeDTO;
import spring.utility.itclan.Paging;
import spring.utility.itclan.Utility;

@Controller
public class ApplyCompanyController {
	@Autowired
	private ApplyCompanyDAO dao;

	@RequestMapping("/a_company/read")
	public String read_company(int offerNum,String memberID,int resumeNum,int portfolioNum,
			Model model){
		dao.viewup(offerNum, memberID);
		Map map = new HashMap();
		map.put("memberID", memberID);
		map.put("offerNum", offerNum);
		map.put("resumeNum", resumeNum);
		map.put("portfolioNum", portfolioNum);
		PersonalMemberDTO dto= dao.read_c(map);
		model.addAttribute("dto", dto);

		return "/applycompamy/read_company";
	}
	@RequestMapping("/a_company/list")
	public String list_company(HttpServletRequest request,int offerNum,
			Model model){
		int nowPage = 1;
		if(request.getParameter("nowPage") != null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		}
		int recordPerPage = 5;
		int sno = ((nowPage -1)*recordPerPage)+1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("offerNum", offerNum);
		List<ApplyCompanyDTO> list = dao.list_company(map);
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("offerNum", offerNum);
		return "/applycompany/list_company";
	}
	@RequestMapping("/applycompany/delete")
	public String delete_personal(String memberID, int offerNum){
		if(dao.deletePersonal(memberID, offerNum)>0){
			return "redirect:/personal/read";
		}else{
			return "/error/passwderror";
		}

	}
	
	@RequestMapping(value="/applycompany/create",method=RequestMethod.POST)
	public String create(ApplyCompanyDTO dto, Model model,String memberID,int offerNum) throws Exception{
		int cnt = dao.create(dto);
		model.addAttribute("cnt", cnt);
		model.addAttribute("memberID", memberID);
		model.addAttribute("offerNum", offerNum);
		
		return "/applycompany/createProc";
	}
	
	@RequestMapping(value="/applycompany/create",method=RequestMethod.GET)
	public String create(HttpSession session, int offerNum,Model model,String memberID){
		
		
		int cnt = dao.memberIDCheck(memberID, offerNum);
		List<ResumeDTO> reList = dao.list_resume(memberID);
		List<PortFolioDTO> pfList = dao.List_portfolio(memberID);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("reList", reList);
		model.addAttribute("pfList", pfList);
		model.addAttribute("offerNum", offerNum);
		model.addAttribute("memberID", memberID);
		
		return "/applycompany/create";
	}
	
	@RequestMapping("/applycompany/read_p")
	public String read_p(String memberID,int offerNum,int resumeNum , int portfolioNum, int nowPage,
			Model model,ApplyCompanyDTO dto,PortFolioDTO pfdto,PersonalMemberDTO pmdto,ResumeDTO redto){
		Map map = new HashMap();
		map.put("memberID", memberID);
		map.put("offerNum", offerNum);
		map.put("resumeNum", resumeNum);
		map.put("portfolioNum", portfolioNum);
		dto = dao.read_personal(map);
		List<OfferDTO> olist = dto.getOfferList();
		OfferDTO odto= new OfferDTO();
		for(int i = 0;i<olist.size(); i++){
			odto = (OfferDTO)olist.get(i);
		}
		
		pfdto = dto.getPfdto();
		pmdto= dto.getPmdto();
		redto = dto.getRedto();
		model.addAttribute("dto", dto);
		model.addAttribute("odto", odto);
		model.addAttribute("pfdto", pfdto);
		model.addAttribute("redto", redto);
		model.addAttribute("pmdto", pmdto);
		return "/applycompany/read_p";
	}
	
	@RequestMapping("/applycompany/list_personal")
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
		int total = dao.total_personal(memberID);
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("memberID", memberID);

		
		List<ApplyCompanyDTO> list = dao.list(map);
		String paging = new Paging().pagingApplyCompnay(total, nowPage, recordPerPage);
		
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);		
		model.addAttribute("paging", paging);		
		
		
		
		return "/applycompany/list_personal";
	}
	
	

}
