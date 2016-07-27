package spring.sts.kmk;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.offer.OfferDAO;
import spring.model.offer.OfferDTO;
import spring.utility.itclan.Utility;
import spring.utility.itclan.*;

@Controller
public class OfferController {
	
	@Autowired
	public OfferDAO dao;
	
	@RequestMapping(value="offer/create", method=RequestMethod.POST)
	public String create(OfferDTO dto, HttpServletRequest request){
		
		dto.setTitle(request.getParameter("title"));
		dto.setQualification(request.getParameter("qualification"));
		dto.setOfferDate(request.getParameter("offerdate"));
		dto.setCompanyName(request.getParameter("companyname"));
		dto.setCompanyID(request.getParameter("companyid"));
		dto.setDetail(request.getParameter("detail"));
		dto.setEmploymentSector(request.getParameter("employmentsector"));
		dto.setTask(request.getParameter("task"));
		dto.setWorkingArea(request.getParameter("workingarea")); 
		dto.setRecruitment(request.getParameter("recruitment"));
		dto.setSalary(request.getParameter("salary"));
		
		if(dao.create(dto)>0){
			
			return "redirect:/offer/list";
		}else{
			return "error/error";
		}
	}
	@RequestMapping(value="offer/create", method=RequestMethod.GET)
	public String create(){
		
		return "/offer/createForm";
	}
	
	@RequestMapping(value="/offer/update", method=RequestMethod.POST)
	public String update(Model model, OfferDTO dto,HttpServletRequest request){
		
		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));
		model.addAttribute("nowPage", request.getParameter("nowPage"));
		
		if(dao.update(dto)>0){
			return "redirect:/offer/list";
		}else{
			return "error/error";
		}
		
	}
	@RequestMapping(value="/offer/update", method=RequestMethod.GET)
	public String update(Model model, int offerNum){
		Object dto = dao.read(offerNum);
		
		model.addAttribute("dto", dto);

		return "/offer/updateForm";
	}
	
	@RequestMapping(value="offer/delete", method=RequestMethod.POST)
	public String delete(int offerNum, Model model, String col, String word, int nowPage){
		
		if(dao.delete(offerNum)>0){	
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "redirect:/offer/list";
		}else{
			return "error/error";
		}
	}

	@RequestMapping(value="offer/delete", method=RequestMethod.GET)
	public String delete(){
		return "/offer/deleteForm";
	}

	@RequestMapping(value="offer/read")
	public String read(int offerNum, Model model){
		
		//dao.upViewcnt(offerNum);//조회수 증가
		Object dto=dao.read(offerNum);//한건의 레코드 가져오기
		String title= ((OfferDTO) dto).getTitle().replaceAll("\r\n","<br>");
		((OfferDTO) dto).setTitle(title);		
		String offerdate=((OfferDTO) dto).getOfferDate().substring(0,10);
		((OfferDTO) dto).setOfferDate(offerdate);
		String recruitment= ((OfferDTO) dto).getRecruitment().replaceAll("\r\n","<br>");
		((OfferDTO) dto).setRecruitment(recruitment);
		String Salary= ((OfferDTO) dto).getSalary().replaceAll("\r\n","<br>");
		((OfferDTO) dto).setSalary(Salary);
		
		model.addAttribute("dto", dto);
		return "/offer/read";
	}
	
	
	@RequestMapping(value="offer/list")
	public String list(HttpServletRequest request, Model model){
		
		int nowPage=1;
		int recordPerPage=5;
		if(request.getParameter("nowPage")!=null){
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
		int sno=((nowPage-1)*recordPerPage)+1;
		int eno=nowPage*recordPerPage;
		String col=Utility.nullCheck(request.getParameter("col"));
		String word=Utility.nullCheck(request.getParameter("word"));

		if(col.equals("total")) word="";

		Map map =new HashMap();
		map.put("sno",sno);
		map.put("eno",eno);
		map.put("col",col);
		map.put("word",word);

		List<OfferDTO> list=dao.list(map);

		int total=dao.total(map);
		String paging=new Paging().paging2(total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("col", col);
		model.addAttribute("list", list);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("paging", paging);
		
		return "/offer/list";
	}

}

