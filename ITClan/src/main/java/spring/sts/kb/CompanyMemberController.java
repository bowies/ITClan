package spring.sts.kb;

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
import org.springframework.web.bind.annotation.RequestParam;

import spring.model.companymember.CompanyMemberDAO;
import spring.model.companymember.CompanyMemberDTO;
import spring.utility.itclan.Paging;
import spring.utility.itclan.Utility;

@Controller
public class CompanyMemberController {

	@Autowired
	private CompanyMemberDAO dao;

	@RequestMapping(value = "/companymember/pwFind", method = RequestMethod.POST)
	public String pwFind(String name, String companyID, Model model) {
 
		String passwd = dao.pwFind(companyID, name);
		model.addAttribute("passwd", passwd);
		return "/companymember/pwFindProc";
	}

	@RequestMapping(value = "/companymember/pwFind", method = RequestMethod.GET)
	public String pwFind() {

		return "/companymember/pwFind";
	}

	@RequestMapping(value = "/companymember/idFind", method = RequestMethod.POST)
	public String companyIDFind(String name, String email, Model model) {

		String companyID = dao.idFind(name, email);
		model.addAttribute("companyID", companyID);
		return "/companymember/idFindProc";
	}

	@RequestMapping(value = "/companymember/idFind", method = RequestMethod.GET)
	public String companyIDFind() {

		return "/companymember/idFind";
	}

	@RequestMapping(value = "/companymember/delete", method = RequestMethod.POST)
	public String delete(String companyID, HttpServletRequest request, HttpSession session) throws Exception{

		if (dao.delete(companyID) > 0) {
			
			return "redirect:/";
		} else {
			return "error/error";
		}

	}

	@RequestMapping(value = "/companymember/delete", method = RequestMethod.GET)
	public String delete(String companyID,Model model, HttpSession session) {
		
		
		if (companyID == null) {
			companyID = (String) session.getAttribute("companyID");

		}
	
		model.addAttribute("companyID", companyID);

		return "/companymember/delete";
	}

	@RequestMapping(value = "/companymember/updatePw", method = RequestMethod.POST)
	public String updatePw(String companyID, String passwd) {

		if (dao.updatePw(passwd, companyID) > 0) {
			return "redirect:/";
		} else {
			return "error/error";
		}

	}

	@RequestMapping(value = "/companymember/updatePw", method = RequestMethod.GET)
	public String updatePw() {

		return "/companymember/updatePw";
	}

	

	@RequestMapping(value = "/companymember/update", method = RequestMethod.POST)
	public String update(CompanyMemberDTO dto) throws Exception {

		if (dao.update(dto) > 0) {
			return "redirect:/";
		}

		return "/companymember/update";
	}

	@RequestMapping(value = "/companymember/update", method = RequestMethod.GET)
	public String update(String companyID, HttpSession session, Model model) throws Exception {
		if (companyID == null) {
			companyID = (String) session.getAttribute("companyID");

		}
		CompanyMemberDTO dto = (CompanyMemberDTO) dao.read(companyID);
 
		model.addAttribute("dto", dto);

		return "/companymember/update";
	}

	@RequestMapping(value = "/companymember/read")
	public String read(String companyID, HttpSession session, Model model) throws Exception {
		if (companyID == null) {
			companyID = (String) session.getAttribute("companyID");

		}
		CompanyMemberDTO dto = (CompanyMemberDTO) dao.read(companyID);

		model.addAttribute("dto", dto);
		model.addAttribute("companyID", companyID);

		return "/companymember/read";
	}

	@RequestMapping("/companymember/logout")
	public String logout(HttpSession session) {

		session.invalidate();// 모든 세션변수 제거

		return "redirect:/";
	}

	@RequestMapping(value = "/companymember/login", method = RequestMethod.POST)
	public String login(String companyID, String passwd, String c_id, HttpServletResponse response, HttpSession session, Model model) {

		int cnt = dao.loginCheck(companyID, passwd);
		String grade = null;
		if (cnt == 1) {
			grade = dao.getGrade(companyID);
			// 쿠키에 id저장
			if (c_id != null) {
				Cookie cookie = new Cookie("c_id", "Y");
				cookie.setMaxAge(120);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", companyID);
				cookie.setMaxAge(120);
				response.addCookie(cookie);

			} else {
				Cookie cookie = new Cookie("c_id", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);

			}

			session.setAttribute("companyID", companyID);
			session.setAttribute("grade", grade);

		}

		String url = "./error/passwdError";
		if (cnt == 1) {
			url = "redirect:../offer";
		}

		return url;
	}

	@RequestMapping(value = "/companymember/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request,
			@RequestParam(value = "nowPage", defaultValue = "0") int nowPage,
			@RequestParam(value = "nPage", defaultValue = "0") int nPage) {

		String c_id = "";// id저장여부
		String c_id_val = "";// id저장변수

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if (cookie.getName().equals("c_id")) {
					c_id = cookie.getValue();
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue();
				}
			}
		}

		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);

		request.setAttribute("nowPage", nowPage);
		request.setAttribute("nPage", nPage);
		return "/companymember/login";
	}

	@RequestMapping(value = "/companymember/email_form")
	public String email_form() {

		return "popup/email_form";
	}

	@RequestMapping(value = "/companymember/email_proc")
	public String email_proc(String email, Model model) {

		int cnt = dao.duplicateEmail(email);
		model.addAttribute("cnt", cnt);

		return "popup/email_proc";
	}

	@RequestMapping(value = "/companymember/id_form")
	public String companyID_form() {

		return "popup/id_form";
	}

	@RequestMapping(value = "/companymember/id_proc")
	public String companyID_proc(String companyID, Model model) {

		int cnt = dao.duplicateID(companyID);
		model.addAttribute("cnt", cnt);

		return "popup/id_proc";
	}

	@RequestMapping(value = "/companymember/createProc")
	public String create(CompanyMemberDTO dto, HttpServletRequest request, Model model) throws Exception {
		boolean flag = false;
		if (dao.duplicateID(dto.getCompanyID()) > 0 || dao.duplicateEmail(dto.getEmail()) > 0) {
			flag = true;
		}

		int cnt = 0;
		if (!flag) {
			cnt = dao.create(dto);
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("flag", flag);

		return "/companymember/createProc";

	}

	@RequestMapping(value = "/companymember/create")
	public String create() {

		return "/companymember/create";
	}

	@RequestMapping(value = "/companymember/agree")
	public String agree() {
		return "/companymember/agree";
	}

	@RequestMapping(value = "/companymember/list")
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
		List<CompanyMemberDTO> list = dao.list(map);
		model.addAttribute("paging", paging);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("list", list);
		return "/companymember/list";
	}

}
