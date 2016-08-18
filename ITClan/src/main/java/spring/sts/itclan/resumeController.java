package spring.sts.itclan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.resume.ResumeDAO;
import spring.model.resume.ResumeDTO;
import spring.utility.itclan.Utility;

public class resumeController {
	
	@Autowired
	private ResumeDAO resumedao;
	
	@RequestMapping(value="/resume/create",method=RequestMethod.GET)
	public String create(Model model, String memberID, HttpSession session) throws Exception{
		
	/*	if(memberID==null){
			memberID = (String)session.getAttribute("memberID");
		}*/
		memberID = "ccc";
		
		Map map = new HashMap();
		map.put("memberID", memberID);
		
		List<ResumeDTO>resumelist =  resumedao.list(map);

		model.addAttribute("resumelist", resumelist);
		
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
	
	@RequestMapping(value="/resume/delete")
	public String delete(int actNum, Model model) throws Exception{
		
		resumedao.delete(actNum);
	
		return "redirect:/resumeInfo/nextcreate";
		
	}
}

