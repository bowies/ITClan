package spring.sts.itclan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import spring.model.portfolio.PortFolioDAO;
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
	
	@Autowired
	private PortFolioDAO portfoliodao;
	
	
	@RequestMapping(value="/resumeInfo/create",method=RequestMethod.GET)
	public String create(ResumeInfoDTO resumeinfodto, Model model, HttpSession session) throws Exception {
		
		String memberID = "";
		
		if(memberID==""){
		memberID = (String)session.getAttribute(memberID);
		}
		memberID = "ccc";
		
		PersonalMemberDTO personalmemberdto = (PersonalMemberDTO) personalmemberdao.read(memberID);
		
		Map map = new HashMap();
		map.put("memberID", memberID);
		
		model.addAttribute("memberID", memberID);
		model.addAttribute("personalmemberdto", personalmemberdto);
		
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
	public String create( HttpServletRequest request, Model model, ResumeInfoDTO resumeinfodto, LicenseDTO licensedto, ExternalActivityDTO externalactivitydto) throws Exception {
	
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
		
		model.addAttribute("resumeinfodto", resumeinfodto);
		model.addAttribute("licensedto", licensedto);
		model.addAttribute("externalactivitydto", externalactivitydto);
		return "/resumeInfo/createProc";
/*		if(resumeinfodao.create(resumeinfodto)>0){
			return "../";
		}
		else{
			return "error/error";
		}*/
	}
	
	@RequestMapping("/resumeInfo/read")
	public String read(LicenseDTO licensedto, String memberID, HttpSession session, Model model) throws Exception{
		
		if(memberID==null){
		memberID = (String)session.getAttribute(memberID);
		}
		memberID = "ccc";
		
		Map map = new HashMap();
		map.put("memberID", memberID);
		
		List<LicenseDTO> licenselist = licensedao.list(map);
		int limax = licensedao.total(memberID);
		
		List<ExternalActivityDTO> externalactivitylist = externalactivitydao.list(map);
		
		int exmax = 0;
		int i = 1;
		while(i>0){
			exmax = exmax+ i;
			i++;
		}
		
		ResumeInfoDTO resumeinfodto = (ResumeInfoDTO) resumeinfodao.read(memberID);
		PersonalMemberDTO personalmemberdto = (PersonalMemberDTO) personalmemberdao.read(memberID);
		
		model.addAttribute("resumeinfodto",resumeinfodto);
		model.addAttribute("personalmemberdto",personalmemberdto);
		model.addAttribute("licenselist", licenselist);
		model.addAttribute("externalactivitylist", externalactivitylist);
		model.addAttribute("limax", limax);
		model.addAttribute("exmax", exmax);
		
		return "/resumeInfo/read";
	}

	@RequestMapping(value="/resumeInfo/update",method=RequestMethod.GET)
	public String update(String memberID, Model model, String oldpicture) throws Exception{
		
		ResumeInfoDTO resumeinfodto = (ResumeInfoDTO) resumeinfodao.read(memberID);
		
		model.addAttribute("resumeinfodto",resumeinfodto);
		model.addAttribute("oldpicture", oldpicture);
		
		return "/resumeInfo/update";
	}
	
	@RequestMapping(value="/resumeInfo/update",method=RequestMethod.POST)
	public String update(MultipartFile pictureMF, HttpServletRequest request, String memberID, Model model, String oldpicture) throws Exception{
		
		String picture = "";
		
		String basePath = request.getRealPath("/storage/img_image");
		
		int size = (int) pictureMF.getSize();
		
		if(size>0) {
			if(oldpicture!=null) {
				Utility.deleteFile(basePath, oldpicture);
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
