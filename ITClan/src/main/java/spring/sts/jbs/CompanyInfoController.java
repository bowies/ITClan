package spring.sts.jbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

	@RequestMapping(value = "CompanyInfo/create", method = RequestMethod.POST)
	public String create(CompanyInfoDTO dto, HttpServletRequest request) throws Exception {

		dto.setCompanyID(request.getParameter("companyID"));
		dto.setCompanyName(request.getParameter("companyname"));
		dto.setCompanyNumber(Integer.parseInt(request.getParameter("companynumber")));
		dto.setBossName(request.getParameter("bossname"));
		dto.setCompanyScale(request.getParameter("companyscale"));
		dto.setCi(request.getParameter("ci"));
		dto.setCategoryCode(request.getParameter("categorycode"));

		if (dao.create(dto) > 0) {

			return "redirect:/CompanyInfo/list";
		} else {
			return "error/error";
		}
	}

	@RequestMapping(value = "CompanyInfo/create", method = RequestMethod.GET)
	public String create() {

		return "/CompanyInfo/createForm";
	}

	@RequestMapping(value = "/CompanyInfo/update", method = RequestMethod.POST)
	public String update(Model model, CompanyInfoDTO dto, HttpServletRequest request) throws Exception {

		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));
		model.addAttribute("nowPage", request.getParameter("nowPage"));

		if (dao.update(dto) > 0) {
			return "redirect:/CompanyInfo/list";
		} else {
			return "error/error";
		}

	}

	@RequestMapping(value = "/CompanyInfo/update", method = RequestMethod.GET)
	public String update(Model model, int CompanyInfoNum) throws Exception {
		Object dto = dao.read(CompanyInfoNum);

		model.addAttribute("dto", dto);

		return "/CompanyInfo/updateForm";
	}

	@RequestMapping(value = "CompanyInfo/delete", method = RequestMethod.POST)
	public String delete(int CompanyInfoNum, Model model, String col, String word, int nowPage) throws Exception {

		if (dao.delete(CompanyInfoNum) > 0) {
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "redirect:/CompanyInfo/list";
		} else {
			return "error/error";
		}
	}

	@RequestMapping(value = "CompanyInfo/delete", method = RequestMethod.GET)
	public String delete() {
		return "/CompanyInfo/deleteForm";
	}

	@RequestMapping(value = "CompanyInfo/read")
	public String read(int CompanyID, Model model) throws Exception {

		// dao.upViewcnt(CompanyInfoNum);//조회수 증가
		Object dto = dao.read(CompanyID);// 한건의 레코드 가져오기
		String CompanyName = ((CompanyInfoDTO) dto).getCompanyName();
		((CompanyInfoDTO) dto).setCompanyName(CompanyName);
		String CompanyScale = ((CompanyInfoDTO) dto).getCompanyScale();
		((CompanyInfoDTO) dto).setCompanyScale(CompanyScale);
		String BossName = ((CompanyInfoDTO) dto).getBossName();
		((CompanyInfoDTO) dto).setBossName(BossName);
		long CompanyNumber = ((CompanyInfoDTO) dto).getCompanyNumber();
		((CompanyInfoDTO) dto).setCompanyNumber(CompanyNumber);
		String Ci = ((CompanyInfoDTO) dto).getCi();
		((CompanyInfoDTO) dto).setCi(Ci);
		String CategoryCode = ((CompanyInfoDTO) dto).getCategoryCode();
		((CompanyInfoDTO) dto).setCategoryCode(CategoryCode);

		model.addAttribute("dto", dto);
		return "/CompanyInfo/read";
	}

	@RequestMapping(value = "CompanyInfo/list")
	public String list(HttpServletRequest request, Model model) throws Exception {

		int nowPage = 1;
		int recordPerPage = 5;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int sno = ((nowPage - 1) * recordPerPage) + 1;
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

		List<CompanyInfoDTO> list = dao.list(map);

		int total = dao.total(map);
		String paging = new Paging().paging2(total, nowPage, recordPerPage, col, word);

		model.addAttribute("col", col);
		model.addAttribute("list", list);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("paging", paging);

		return "/CompanyInfo/list";
	}

}