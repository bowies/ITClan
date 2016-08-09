package spring.sts.kmg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.notice.NoticeDAO;
import spring.model.notice.NoticeDTO;
import spring.model.notice.NoticeService;
import spring.model.reply.ReplyDAO;
import spring.model.reply.ReplyDTO;
import spring.utility.itclan.Paging;
import spring.utility.itclan.Utility;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	public NoticeDAO dao;
	@Autowired
	private ReplyDAO rdao;

	@RequestMapping("/notice/rdelete")
	public String rdelete(Map map, int replynum, int noticeNum, int nowPage, int nPage, String col, String word,
			Model model) throws Exception {

		int total = rdao.total(map);// 댓글전체레코드값을 가져와서
		int totalPage = (int) (Math.ceil((double) total / 3)); // 전체 페이지
		if (rdao.delete(replynum) > 0) {
			if (nPage != 1 && nPage == totalPage && total % 3 == 1) {// 마지막페이지의
																		// 마지막레코드이면(3은
																		// 한페이지당보여줄
																		// 레코드
																		// 갯수)
				nPage = nPage - 1; // 현재의 페이지값에서 1을 빼자
			}
			model.addAttribute("noticeNum", noticeNum);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);

		} else {
			return "error/error";
		}

		return "redirect:./read";
	}

	@RequestMapping("/notice/rupdate")
	public String rupdate(ReplyDTO dto, int nowPage, int nPage, String col, String word, Model model) throws Exception {
		if (rdao.update(dto) > 0) {
			model.addAttribute("noticeNum", dto.getNoticeNum());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
		} else {
			return "error/error";
		}

		return "redirect:./read";
	}

	@RequestMapping("/notice/rcreate")
	public String rcreate(ReplyDTO dto, int nowPage, String col, String word, Model model) throws Exception {

		if (rdao.create(dto) > 0) {
			model.addAttribute("noticeNum", dto.getNoticeNum());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
		} else {
			return "error/error";
		}

		return "redirect:./read";
	}

	@RequestMapping(value = "notice/create", method = RequestMethod.POST)
	public String create(NoticeDTO dto, HttpServletRequest request) throws Exception {

		dto.setContent(request.getParameter("content"));
		dto.setTitle(request.getParameter("title"));

		if (dao.create(dto) > 0) {

			return "redirect:/notice/list";
		} else {
			return "error/error";
		}
	}

	@RequestMapping(value = "notice/create", method = RequestMethod.GET)
	public String create() {

		return "/notice/createForm";
	}

	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String update(Model model, NoticeDTO dto, HttpServletRequest request) throws Exception {

		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));
		model.addAttribute("nowPage", request.getParameter("nowPage"));

		if (dao.update(dto) > 0) {
			return "redirect:/notice/list";
		} else {
			return "error/error";
		}

	}

	@RequestMapping(value = "/notice/update", method = RequestMethod.GET)
	public String update(Model model, int noticeNum) throws Exception {
		Object dto = dao.read(noticeNum);

		model.addAttribute("dto", dto);

		return "/notice/updateForm";
	}

	@RequestMapping(value = "notice/delete", method = RequestMethod.POST)
	public String delete(int noticeNum, Model model, String col, String word, int nowPage) throws Exception {

		if (dao.delete(noticeNum) > 0) {
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "redirect:/notice/list";
		} else {
			return "error/error";
		}
	}

	@RequestMapping(value = "notice/delete", method = RequestMethod.GET)
	public String delete() {
		return "/notice/deleteForm";
	}

	@RequestMapping("/notice/read")
	public String read(int noticeNum, Model model, int nowPage, String col, String word, HttpServletRequest request)
			throws Exception {
		dao.viewCnt(noticeNum);

		NoticeDTO dto = (NoticeDTO) dao.read(noticeNum);

		String content = dto.getContent();
		content = content.replace("\r\n", "<br>");
		dto.setContent(content);

		model.addAttribute("dto", dto);

		/* 댓글 관련 시작 */
		String url = "read";
		int nPage = 1; // 시작 페이지 번호는 1부터

		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

		int sno = ((nPage - 1) * recordPerPage) + 1; //
		int eno = nPage * recordPerPage;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("noticeNum", noticeNum);

		List<ReplyDTO> list = rdao.list(map);

		int total = rdao.total(map);

		String paging = new Paging().paging2(total, nowPage, recordPerPage, col, word);

		model.addAttribute("rlist", list);
		model.addAttribute("paging", paging);
		model.addAttribute("nPage", nPage);

		/* 댓글 관련 끝 */

		return "/notice/read";
	}

	@RequestMapping(value = "/notice/list")
	public String list(HttpServletRequest request, Model model) throws Exception {

		int nowPage = 1;
		int recordPerPage = 10;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		String col = Utility.nullCheck(request.getParameter("col"));
		String word = Utility.nullCheck(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);

		List<NoticeDTO> list = dao.list(map);
		

		int total = dao.total(map);
		String paging = new Paging().paging2(total, nowPage, recordPerPage, col, word);

		model.addAttribute("col", col);
		model.addAttribute("list", list);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("paging", paging);

		return "/notice/list";
	}

}
