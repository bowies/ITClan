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

import spring.model.industrycategory.IndustryCategoryDAO;
import spring.model.industrycategory.IndustryCategoryDTO;
import spring.utility.itclan.Paging;
import spring.utility.itclan.Utility;

@Controller
public class IndustryCategoryController {

	@Autowired
	private IndustryCategoryDAO dao;

	@RequestMapping(value = "/industrycategory/create", method=RequestMethod.POST)
	public String create(IndustryCategoryDTO dto, HttpServletRequest request, Model model) throws Exception {

		int cnt = dao.create(dto);
		model.addAttribute("cnt", cnt);
		return "/industrycategory/createProc";
		
	}

	@RequestMapping(value = "/industrycategory/create")
	public String create() {

		return "/industrycategory/create";
	}
	

	@RequestMapping(value = "/industrycategory/read")
	public String read(String categoryCode, HttpSession session, Model model) throws Exception {

		IndustryCategoryDTO dto = (IndustryCategoryDTO) dao.read(categoryCode);

		model.addAttribute("dto", dto);

		return "/industrycategory/read";
	}

	@RequestMapping(value = "/industrycategory/list")
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
		List<IndustryCategoryDTO> list = dao.list(map);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("list", list);
		return "/industrycategory/list";
	}

	@RequestMapping(value = "/industrycategory/delete", method = RequestMethod.POST)
	public String delete(String categoryCode, HttpServletRequest request, HttpSession session) throws Exception{

		if (dao.delete(categoryCode) > 0) {
			
			return "redirect:/industrycategory/list";
		} else {
			return "error/error";
		}

	}

	@RequestMapping(value = "/industrycategory/delete", method = RequestMethod.GET)
	public String delete() {
		
		
		return "/industrycategory/delete";
	}

	
}