package spring.sts.itclan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.qna.QnADAO;
import spring.model.qna.QnADTO;
import spring.utility.itclan.Paging;
import spring.utility.itclan.Utility;
@Controller
public class QnaController {
	@Autowired
	private QnADAO dao;
	
	@RequestMapping(value="/qna/delete",method=RequestMethod.POST)
	public String delete(Model model,HttpServletRequest request,int qnANum) throws Exception{
		model.addAttribute("nowPage",request.getParameter("nowPage"));
		model.addAttribute("col",request.getParameter("col"));
		model.addAttribute("word",request.getParameter("word"));
		
		if(dao.delete(qnANum)>0){
			return "redirect:/qna/list";
		}else{
			return "/error";
		}
		
	}
	@RequestMapping(value="/qna/delete",method=RequestMethod.GET)
	public String delete(Model model,HttpServletRequest request){
		model.addAttribute("nowPage",request.getParameter("nowPage"));
		model.addAttribute("col",request.getParameter("col"));
		model.addAttribute("word",request.getParameter("word"));
		return "/qna/delete";
	}
	@RequestMapping(value="/qna/update",method=RequestMethod.POST)
	public String update(QnADTO dto,Model model,HttpServletRequest request) throws Exception{
		model.addAttribute("nowPage",request.getParameter("nowPage"));
		model.addAttribute("col",request.getParameter("col"));
		model.addAttribute("word",request.getParameter("word"));
		if(dao.update(dto)>0){
			return "redirect:/qna/list";
		}else{
			return "/error";
		}
	
	}
	@RequestMapping(value="/qna/update",method=RequestMethod.GET)
	public String update(int qnANum,QnADTO dto, Model model,HttpServletRequest request) throws Exception{
		
		dto =(QnADTO) dao.read(qnANum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("nowPage",request.getParameter("nowPage"));
		model.addAttribute("col",request.getParameter("col"));
		model.addAttribute("word",request.getParameter("word"));
		return"/qna/update";
	}
	
	@RequestMapping("/qna/read")
	public String read(int qnANum,QnADTO dto,Model model) throws Exception{
		
		dto = (QnADTO) dao.read(qnANum);
    	String content = dto.getContent().replaceAll("\r\n", "<br>");
    	String wdate = dto.getRegdate().substring(0,10);
    
    	model.addAttribute("dto", dto);
    	model.addAttribute("content", content);
    	model.addAttribute("wdate", wdate);
		return "/qna/read";
	}
	@RequestMapping(value="/qna/create",method=RequestMethod.POST)
	public String create(QnADTO dto) throws Exception{
		if(dao.create(dto)>0){
			return "redirect:/qna/list";
		}else{
			return "/error";
		}
	}
	@RequestMapping(value="/qna/create",method=RequestMethod.GET)
	public String create(){
		return "/qna/create";
	}
	
	@RequestMapping("/qna/list")
	public String list(HttpServletRequest request,Model model ) throws Exception{
		int nowPage = 1;
		int recordPerPage = 4;
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage-1)*recordPerPage)+1;
		int eno = nowPage * recordPerPage;
		
		
		String col = Utility.nullCheck(request.getParameter("col"));
		String word = Utility.nullCheck(request.getParameter("word"));
		if (col.equals("total"))
			word = "";
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);
		
		List<QnADTO> list = dao.list(map);
		
		int total = dao.total(map);
		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
		
		model.addAttribute("list", list);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("paging", paging);
	
		return "/qna/list";
	}

}
