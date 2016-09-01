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

import spring.model.resume.ResumeDAO;
import spring.model.resume.ResumeDTO;
import spring.utility.itclan.Utility;

@Controller
public class resumeController {
	
	@Autowired
	private ResumeDAO resumedao;
	
	@RequestMapping(value="/resume/create",method=RequestMethod.GET)
	public String create(Model model, HttpSession session) throws Exception{
		
		String memberID = (String)session.getAttribute("memberID");
		
		Map map = new HashMap();
		map.put("memberID", memberID);
		
		List<ResumeDTO>resumelist =  resumedao.list(map);

		int remax = resumedao.total(memberID);
		
		model.addAttribute("resumelist", resumelist);
		model.addAttribute("remax", remax);
		model.addAttribute("memberID", memberID);
		
		return "/resume/createForm";
	}
	
	@RequestMapping(value="/resume/create",method=RequestMethod.POST)
	public String create(HttpServletRequest request, String memberID, Model model, ResumeDTO resumedto) throws Exception{
		
		// resume 파일업로드
		String resumebasePath = request.getRealPath("/storage/resume");
		String resumeName = "";
		
		int resumesize = (int)resumedto.getResumeMF().getSize();
		
		if(resumesize>0) {
			resumeName = Utility.saveFile(resumedto.getResumeMF(), resumebasePath);
		}
		resumedto.setResumeName(resumeName);
			
		if(resumedao.create(resumedto)>0){
			
			return "/resume/createProc";
		}else {
			return "error/error";
		}
	}
	
	@RequestMapping(value="/resume/delete",method=RequestMethod.GET)
	public String delete(int resumeNum, Model model) throws Exception{
		
		model.addAttribute("resumeNum", resumeNum);
	
		return "/resume/deleteForm";
		
	}
	
	@RequestMapping(value="/resume/delete",method=RequestMethod.POST)
	public String delete(int resumeNum) throws Exception{
		
		if(resumedao.delete(resumeNum)>0){
		
			return "/resume/deleteProc";
		
		}else{
			return "error/error";
		}
	}
}

