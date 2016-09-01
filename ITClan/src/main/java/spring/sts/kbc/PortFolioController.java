package spring.sts.kbc;

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
import spring.utility.itclan.Utility;

@Controller
public class PortFolioController {

	@Autowired
	private PortFolioDAO portfoliodao;
	
	@RequestMapping(value="/portfolio/create",method=RequestMethod.GET)
	public String create(Model model, HttpSession session) throws Exception{
		
		String memberID = (String)session.getAttribute("memberID");
		
		Map map = new HashMap();
		map.put("memberID", memberID);
		
		List<PortFolioDTO>portfoliolist =  portfoliodao.list(map);
		
		int pomax = portfoliodao.total(memberID);
		
		model.addAttribute("portfoliolist", portfoliolist);
		model.addAttribute("pomax", pomax);
		model.addAttribute("memberID", memberID);
		
		return "/portfolio/createForm";
	}
	
	@RequestMapping(value="/portfolio/create",method=RequestMethod.POST)
	public String create(HttpServletRequest request, String memberID, Model model, PortFolioDTO portfoliodto) throws Exception{
		
		//portfolio 파일 업로드
		String PortfoliobasePath = request.getRealPath("/storage/portfolio");
		String portfolioName = "";
		
		
		int portfoliosize = (int)portfoliodto.getPortfolioMF().getSize();
		
		if(portfoliosize>0){
			portfolioName = Utility.saveFile(portfoliodto.getPortfolioMF(), PortfoliobasePath);
		}
		
		portfoliodto.setPortfolioName(portfolioName);
			
		if(portfoliodao.create(portfoliodto)>0){
			
			return "/portfolio/createProc";
		}else {
			return "error/error";
		}
	}
	
	@RequestMapping(value="/portfolio/delete",method=RequestMethod.GET)
	public String delete(int portfolioNum, Model model, PortFolioDTO portfoliodto) throws Exception{
		
		model.addAttribute("portfolioNum", portfolioNum);
		model.addAttribute("portfoliodto", portfoliodto);
		
		return "/portfolio/deleteForm";
		
	}
	
	@RequestMapping(value="/portfolio/delete",method=RequestMethod.POST)
	public String delete(HttpServletRequest request, int portfolioNum, PortFolioDTO portfoliodto) throws Exception{
		
		String upDir = request.getRealPath("/storage/portfolio");
		String portfolioName = portfoliodto.getPortfolioName();
		
		if(portfoliodao.delete(portfolioNum)>0){
			if(portfolioName != null){
				Utility.deleteFile(upDir, portfolioName);
			}
			
			return "/portfolio/deleteProc";
		
		}else{
			
			return "error/error";
		}
	}
}
