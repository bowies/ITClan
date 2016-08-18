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

import spring.model.portfolio.PortFolioDAO;
import spring.model.portfolio.PortFolioDTO;
import spring.model.resume.ResumeDAO;
import spring.model.resume.ResumeDTO;
import spring.utility.itclan.Utility;



@Controller
public class PortFolioController {

	@Autowired
	private PortFolioDAO portfoliodao;
	
	@Autowired
	private ResumeDAO resumedao;
	
	@RequestMapping(value="/portfolio/create",method=RequestMethod.GET)
	public String create(Model model, String memberID, HttpSession session) throws Exception{
		
	/*	if(memberID==null){
			memberID = (String)session.getAttribute(memberID);
		}*/
		memberID = "ccc";
		
		Map map = new HashMap();
		map.put("memberID", memberID);
		
		List<PortFolioDTO>portfoliolist =  portfoliodao.list(map);
		
		model.addAttribute("portfoliolist", portfoliolist);
		
		List<ResumeDTO>resumelist =  resumedao.list(map);

		model.addAttribute("resumelist", resumelist);
		
		model.addAttribute("memberID", memberID);
		return "/portfolio/createForm";
	}
	
	@RequestMapping(value="/portfolio/create",method=RequestMethod.POST)
	public String create(HttpServletRequest request, String memberID, Model model, PortFolioDTO portfoliodto, ResumeDTO resumedto) throws Exception{
		
		//portfolio 파일 업로드
		String PortfoliobasePath = request.getRealPath("/storage/portfolio");
		String portfolioName = "";
		
		
		int portfoliosize = (int)portfoliodto.getPortfolioMF().getSize();
		
		if(portfoliosize>0){
			portfolioName = Utility.saveFile(portfoliodto.getPortfolioMF(), PortfoliobasePath);
		}
		
		portfoliodto.setPortfolioName(portfolioName);
		
		// resume 파일업로드
		String resumebasePath = request.getRealPath("/storage/resume");
		String resumeName = "";
		
		int resumesize = (int)resumedto.getResumeMF().getSize();
		
		if(resumesize>0) {
			resumeName = Utility.saveFile(resumedto.getResumeMF(), resumebasePath);
		}
		resumedto.setResumeName(resumeName);

		model.addAttribute("memberID", memberID);
			
		if(portfoliodao.create(portfoliodto)>0 && resumedao.create(resumedto)>0){
			
			return "/portfolio/createProc";
		}else {
			return "error/error";
		}
	}
	
	@RequestMapping(value="/portfolio/delete")
	public String delete(int actNum, Model model) throws Exception{
		
		portfoliodao.delete(actNum);
	
		return "redirect:/resumeInfo/nextcreate";
		
	}
}
