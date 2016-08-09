package spring.sts.itclan;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import spring.model.subsurvey.SubSurveyDAO;
import spring.model.subsurvey.SubSurveyDTO;
import spring.model.survey.SurveyDAO;
import spring.model.survey.SurveyDTO;
import spring.model.survey.SurveyMgr;
import spring.utility.itclan.Paging;
import spring.utility.itclan.Utility;

@Controller
public class SurveyController {
	@Autowired
	private SurveyDAO dao;
	@Autowired
	private SubSurveyDAO sdao;
	@Autowired
	private SurveyMgr mgr;
	
	@RequestMapping("/survey/delete")
	public String delete(int preNum) throws Exception{
		mgr.Delete(preNum);		
		return "redirect:/survey/list";
	}
	@RequestMapping("/survey/chart")
	public String chart(SurveyDTO dto , SubSurveyDTO sdto,Model model,int preNum) throws Exception{
		dto = (SurveyDTO) dao.read(preNum);
		sdto = (SubSurveyDTO) sdao.read(preNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("sdto", sdto);
				
		return "/survey/chart";
	}
	
	
	@RequestMapping(value="/survey/read",method=RequestMethod.POST)
	public String readIn(String str,int preNum,HttpSession session,
			HttpServletResponse response,Model model,String col,String word,int nowPage){
		if(str.equals("ans1")){
			sdao.update1(preNum);
		}
		if(str.equals("ans2")){
			sdao.update2(preNum);
		}
		if(str.equals("ans3")){
			sdao.update3(preNum);
		}
		if(str.equals("ans4")){
			sdao.update4(preNum);
		}
		String surID= (String) session.getAttribute("memberID");
		Cookie surCook = new Cookie("surID",surID);
		surCook.setMaxAge(60*62*24*7);
		response.addCookie(surCook);
		
		
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		return "redirect:/survey/list";
	}
	
	@RequestMapping(value="/survey/read",method=RequestMethod.GET)
	public String readIn(int preNum ,SurveyDTO dto,Model model,SubSurveyDTO sdto,
			HttpServletRequest request,String col,String word,int nowPage,int sub,
			HttpSession session) throws Exception{
		if(sub == 0){
			sdao.createS(preNum);
			dao.up_sub(preNum);
		}
		
		dto = (SurveyDTO) dao.read(preNum);
		sdto =	(SubSurveyDTO) sdao.read(preNum);
		
		String surID = "";
		Cookie[] cookies = request.getCookies();
	
		for (int i = 0; i < cookies.length; i++) {
			Cookie surCook = cookies[i];
			if(surCook.getName().equals("surID")){
				surID = surCook.getValue();
			}
		}

		dao.up_viewcnt(preNum);
		model.addAttribute("dto", dto);
		model.addAttribute("sdto", sdto);
		model.addAttribute("surID", surID);		

	
		return "/survey/read";
	}
	
	@RequestMapping(value="/survey/create",method=RequestMethod.POST)
	public String create(HttpServletRequest request,Model model,SurveyDTO dto) throws Exception{
		int cnt = dao.create(dto);
		if(cnt > 0){
			return "redirect:/survey/list";
			
		}else{
			return "/error/error";
		}
		
	}
	@RequestMapping(value="/survey/create",method=RequestMethod.GET)
	public String create(){	
		return "/survey/create";
	}
	
	@RequestMapping("/survey/list")
	public String List(HttpServletRequest request,Model model) throws Exception{
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
		
	
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List list = dao.list(map);
		 
		Map map1 = new HashMap();
		map1.put("col", col);
		map1.put("word",word);
		int total = dao.total(map);
		
		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("paging", paging);

		
		
		return "/survey/list";
	}
}
