package spring.sts.kb;

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

import spring.model.companyinfo.CompanyInfoDAO;
import spring.model.companyinfo.CompanyInfoDTO;
import spring.utility.itclan.Paging;
import spring.utility.itclan.Utility;

@Controller
public class CompanyInfoController {

	@Autowired
	public CompanyInfoDAO dao;
	

	@RequestMapping(value = "/companyinfo/list")
	public String list(HttpServletRequest request, Model model) throws Exception {

		// 검색관련
		String col = Utility.nullCheck(request.getParameter("col"));
		String word = Utility.nullCheck(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		// paging 관련
		int nowPage = 1; // 현재페이지
		int recordPerPage = 5; // 한페이지당 보여줄 레코드 갯수
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		int total = dao.total(map);

		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
		List<CompanyInfoDTO> list = dao.list(map);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("list", list);
	
		return "/companyinfo/list";
	}


	@RequestMapping(value = "/companyinfo/createProc", method = RequestMethod.POST)
	public String create(CompanyInfoDTO dto, HttpServletRequest request,  Model model) throws Exception {
		int cnt = dao.create(dto);
		
		model.addAttribute("cnt", cnt);
		return "/companyinfo/createProc";
	}

	@RequestMapping(value = "/companyinfo/create", method = RequestMethod.GET)
	public String create() {

		return "/companyinfo/create";
	}

	@RequestMapping(value = "/companyinfo/update", method = RequestMethod.POST)
	public String update(Model model, CompanyInfoDTO dto, HttpServletRequest request) throws Exception {

		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));
		model.addAttribute("nowPage", request.getParameter("nowPage"));

		if (dao.update(dto) > 0) {
			return "redirect:/companyinfo/list";
		} else {
			return "error/error";
		}

	}

	@RequestMapping(value = "/companyinfo/update", method = RequestMethod.GET)
	public String update(Model model, String companyID) throws Exception {
		Object dto = dao.read(companyID);

		model.addAttribute("dto", dto);

		return "/companyinfo/updateForm";
	}

	@RequestMapping(value = "/companyinfo/delete", method = RequestMethod.POST)
	public String delete(String companyID) throws Exception {

		if (dao.delete(companyID) > 0) {
			return "redirect:/companyinfo/list";
		} else {
			return "error/error";
		}
	}

	@RequestMapping(value = "/companyinfo/delete", method = RequestMethod.GET)
	public String delete() {
		return "/companyinfo/deleteForm";
	}

	@RequestMapping(value = "/companyinfo/read")
	public String read(String companyID, HttpSession session, Model model) throws Exception {

		if(companyID == null){
			companyID = (String) session.getAttribute(companyID);
		}
		
		CompanyInfoDTO dto = (CompanyInfoDTO) dao.read(companyID);
				
		model.addAttribute("dto", dto);
		return "/companyinfo/read";
	}


	
}