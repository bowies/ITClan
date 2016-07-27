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

import spring.model.onebyone.OneByOneDAO;
import spring.model.onebyone.OneByOneDTO;
import spring.model.reply.ReplyDTO;
import spring.utility.itclan.Paging;
import spring.utility.itclan.Utility;

@Controller
public class OnebyoneController {
	@Autowired
	private OneByOneDAO dao;

//	@Autowired
//	private OneByOneService service; //댓글 삭제할 때 필요한것	

	@RequestMapping(value = "/onebyone/delete", method = RequestMethod.POST)
	public String delete(int oneByOneNum, String id, Model model, HttpServletRequest request, int nowPage, String col, String word) {
		int pcnt = dao.checkId(oneByOneNum, id);
		
		String url = "./error/passwdError";
		
		if (pcnt > 0) {
			 try{ 
	                dao.delete(oneByOneNum);//게시판글 삭제
	                  model.addAttribute("nowPage", nowPage);
	                  model.addAttribute("word", word);
	                  model.addAttribute("col", col);
	                  url = "redirect:./onebyone/list";
	            }catch(Exception e){
	                 e.printStackTrace();
	                url = "/error/passwderror";
	           }
		}
		return url;
			

	}

	@RequestMapping(value = "/onebyone/delete", method = RequestMethod.GET)
	public String delete(Model model, HttpServletRequest request) {
		model.addAttribute("nowPage", request.getParameter("nowPage"));
		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));
		return "/onebyone/delete";
	}

	@RequestMapping(value = "/onebyone/reply", method = RequestMethod.POST)
	public String reply(OneByOneDTO dto, Model model, HttpServletRequest request) {
		model.addAttribute("nowPage", request.getParameter("nowPage"));
		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));
		dao.addAnsnum(dto.getGrpno(), dto.getAnsnum());
		if (dao.reply(dto) > 0) {
			return "redirect:/onebyone/list";
		} else {
			return "/error";
		}
	}

	@RequestMapping(value = "/onebyone/reply", method = RequestMethod.GET)
	public String reply(int oneByOneNum, OneByOneDTO dto, Model model, HttpServletRequest request) {
		model.addAttribute("nowPage", request.getParameter("nowPage"));
		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));
		dto = dao.readReply(oneByOneNum);

		model.addAttribute("dto", dto);

		return "/onebyone/reply";
	}

	
	
	@RequestMapping(value = "/onebyone/update", method = RequestMethod.POST)
	public String update(OneByOneDTO dto, Model model, HttpServletRequest request) throws Exception {
		int pcnt = dao.checkId(dto.getOneByOneNum(), dto.getId());
		model.addAttribute("nowPage", request.getParameter("nowPage"));
		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));
		if (pcnt == 1) {
			if (dao.update(dto) > 0) {
				return "redirect:/onebyone/list";
			} else {
				return "/error";
			}
		} else {
			return "/passwderror";
		}
	}

	@RequestMapping(value = "/onebyone/update", method = RequestMethod.GET)
	public String update(int oneByOneNum, OneByOneDTO dto, Model model, HttpServletRequest request) throws Exception {
		dto = (OneByOneDTO) dao.read(oneByOneNum);
		model.addAttribute("dto", dto);
		model.addAttribute("nowPage", request.getParameter("nowPage"));
		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));

		return "/onebyone/update";
	}

	@RequestMapping("/onebyone/read")
	public String read(int oneByOneNum, OneByOneDTO dto, Model model,String col, String word,
			int nowPage,HttpServletRequest request) throws Exception {
		dao.increaseViewcnt(oneByOneNum);
		dto = (OneByOneDTO) dao.read(oneByOneNum);

		String content = dto.getContent();
		content = content.replaceAll("\r\n", "<br>");
		dto.setContent(content);

		model.addAttribute("dto", dto);
		
		/* 댓글 관련  시작 */
		String url = "read";
		int nPage= 1; //시작 페이지 번호는 1부터 
		 
		if (request.getParameter("nPage") != null) { 
		nPage= Integer.parseInt(request.getParameter("nPage"));  
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		 
		int sno = ((nPage-1) * recordPerPage) + 1; // 
		int eno = nPage * recordPerPage;
		 
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("oneByOneNum", oneByOneNum);
		 
		List<ReplyDTO> list = dao.list(map);
		
		 
		int total = dao.total(map);
		 
		String paging = Utility.paging(total, nPage, recordPerPage, url,oneByOneNum,nowPage, col,word);
		 
		model.addAttribute("rlist",list);
		model.addAttribute("paging",paging);
		model.addAttribute("nPage",nPage);
		 
		/* 댓글 관련 끝 */ 		

		return "/onebyone/read";
	}

	@RequestMapping(value = "/onebyone/create", method = RequestMethod.POST)
	public String create(OneByOneDTO dto) throws Exception {

		int cnt = dao.create(dto);
		if (cnt == 1) {
			return "redirect:/onebyone/list";
		} else {
			return "/error";
		}

	}

	@RequestMapping(value = "/onebyone/create", method = RequestMethod.GET)
	public String create() {
		return "/onebyone/create";
	}

	@RequestMapping("/onebyone/list")
	public String list(HttpServletRequest request, Model model) throws Exception {
		int nowPage = 1; // 현재페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;// 한페이지당 보여줄 레코드갯수

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		// 검색관련 변수 선언
		String col = Utility.nullCheck(request.getParameter("col"));
		String word = Utility.nullCheck(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);
		List<OneByOneDTO> list = dao.list(map);

		int total = dao.total(map);

		String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);

		model.addAttribute("list", list);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("paging", paging);
		model.addAttribute("nowPage", nowPage);
		
		return "/onebyone/list";
	}

}
