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
import org.springframework.web.multipart.MultipartFile;

import spring.model.externalactivity.ExternalActivityDAO;
import spring.model.externalactivity.ExternalActivityDTO;
import spring.model.license.LicenseDAO;
import spring.model.license.LicenseDTO;
import spring.model.personalmember.PersonalMemberDAO;
import spring.model.personalmember.PersonalMemberDTO;
import spring.model.resume.ResumeDAO;
import spring.model.resumeinfo.ResumeInfoDAO;
import spring.model.resumeinfo.ResumeInfoDTO;
import spring.utility.itclan.Utility;

@Controller
public class ResumeInfoController {

	@Autowired
	private ResumeInfoDAO resumeinfodao;
	
	@Autowired
	private PersonalMemberDAO personalmemberdao;
	
	
	@Autowired
	private LicenseDAO licensedao;
	
	@Autowired
	private ExternalActivityDAO externalactivitydao;
	
	@Autowired
	private ResumeDAO resumedao;
	
	
	@RequestMapping(value="/resumeInfo/create",method=RequestMethod.GET)
	public String create(Model model, HttpSession session, String memberID) throws Exception {
		
		if(memberID==null){
		memberID = (String)session.getAttribute(memberID);
		}
		memberID = "aaa";
		
		PersonalMemberDTO personalmemberdto = (PersonalMemberDTO) personalmemberdao.read(memberID);
		
		int cnt = personalmemberdto.getBirth();
		
		String birth = Integer.toString(cnt);
		
		model.addAttribute("personalmemberdto", personalmemberdto);
		model.addAttribute("birth", birth);
		
		
		Map map = new HashMap();
		map.put("memberID", memberID);
		
		//자격증
		List<LicenseDTO>licenselist = licensedao.list(map);
		
		int limax = licensedao.total(memberID);
		
		model.addAttribute("licenselist", licenselist);
		model.addAttribute("limax", limax);
		
		//대외활동
		List<ExternalActivityDTO>externalactivitylist = externalactivitydao.list(map);
		
		int exmax = externalactivitydao.total(memberID);
		
		model.addAttribute("externalactivitylist", externalactivitylist);
		model.addAttribute("exmax", exmax);
		
		/*//자기소개서
		List<ResumeDetailDTO>resumedetaillist = resumedetaildao.list(map);

		ResumeDetailDTO resumedetaildto = new ResumeDetailDTO();
		
		String biograph = "";
		String portfolio = "";
		
		if(resumedetaildto.getBiograph()==null){
			 biograph = "자기소개서";
		}else if(resumedetaildto.getPortfolio() == null){
			biograph = "포트폴리오";
		}
		
		model.addAttribute("resumedetaillist", resumedetaillist);
		model.addAttribute("biograph", biograph);
		model.addAttribute("portfolio", portfolio);*/
		
		return "/resumeInfo/create";
	}
	
	@RequestMapping(value="/resumeInfo/create",method=RequestMethod.POST)
	public String create(HttpServletRequest request, Model model, ResumeInfoDTO resumeinfodto, PersonalMemberDTO personalmemberdto) throws Exception {
	
		
		String basePath = request.getRealPath("/storage/resumeInfo_img");
		String picture = "";
		
		if(picture==""){
			picture = "member.jpg";
		}
		
		int size = (int)resumeinfodto.getPictureMF().getSize();
		
		if(size>0){
			picture = Utility.saveFile(resumeinfodto.getPictureMF(), basePath);
		}
		
		resumeinfodto.setPicture(picture);
		
		
		if(resumeinfodao.create(resumeinfodto)>0){
			model.addAttribute("personalmemberdto", personalmemberdto);
			return "redirect:/";
		}
		else{
			return "error/error";
		}
	}
	
	@RequestMapping("/resumeInfo/read")
	public String read(String memberID, HttpSession session, Model model, PersonalMemberDTO personalmemberdto) throws Exception{
		
		if(memberID==null){
		memberID = (String)session.getAttribute(memberID);
		}
		memberID = "ccc";
		
		ResumeInfoDTO resumeinfodto = (ResumeInfoDTO) resumeinfodao.read(memberID);
		personalmemberdto = (PersonalMemberDTO) personalmemberdao.read(memberID);
		
		int cnt = personalmemberdto.getBirth();
		
		String birth = Integer.toString(cnt);
		
		model.addAttribute("resumeinfodto",resumeinfodto);
		model.addAttribute("personalmemberdto",personalmemberdto);
		model.addAttribute("birth", birth);
		return "/resumeInfo/read";
	}

	@RequestMapping(value="/resumeInfo/update",method=RequestMethod.GET)
	public String update(String memberID, Model model, String oldfile) throws Exception{
		
		ResumeInfoDTO resumeinfodto = (ResumeInfoDTO) resumeinfodao.read(memberID);
		
		model.addAttribute("resumeinfodto",resumeinfodto);
		model.addAttribute("oldfile", oldfile);
		
		return "/resumeInfo/update";
	}
	
	@RequestMapping(value="/resumeInfo/update",method=RequestMethod.POST)
	public String update(MultipartFile pictureMF, HttpServletRequest request, String memberID, Model model, String oldfile) throws Exception{
		
		String picture = "";
		
		String basePath = request.getRealPath("/storage/img_image");
		
		int size = (int) pictureMF.getSize();
		
		if(size>0) {
			if(oldfile!=null) {
				Utility.deleteFile(basePath, oldfile);
			}
			picture = Utility.saveFile(pictureMF, basePath);
		}
		
		ResumeInfoDTO resumeinfodto = (ResumeInfoDTO) resumeinfodao.read(memberID);
		
		resumeinfodto.setPicture(picture);
		
		if(resumeinfodao.update(resumeinfodto)>0) {
			return "redirect:/";
		}else{
			return "error/error";
		}
	}
}
