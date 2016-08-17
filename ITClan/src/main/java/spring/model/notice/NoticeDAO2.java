package spring.model.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NoticeDAO2 {
	@Autowired
	private SqlSessionTemplate mybatis;
	/*
	 * 전체 레코드 갯수 가져옴
	 */
	 	public int total(String col, String word){
	 		Map map = new HashMap();
	 		map.put("col", col);
	 		map.put("word", word);
		return mybatis.selectOne("notice.total", map);
		
	}
	 	
	 	public int delete(int noticenum){
		    
		    return mybatis.delete("notice.delete", noticenum);
		  }
		  
		
		 /**
		   * 메모를 수정합니다.
		   * @param vo 수정할 데이터가 있는 객체
		   * @return 저장된 레코드 갯수
		   */
		  public int update(NoticeDTO dto){
		   
		    return mybatis.update("notice.update", dto);
		  }
		
		public int create(NoticeDTO dto){
			
			return mybatis.insert("notice.create", dto);
		}
		public List<NoticeDTO> list(Map map){
			   		   
		   return mybatis.selectList("notice.list", map);
		}
		
		 /**
		   * 조회
		   * @param bbsno 조회할 글 번호
		   * @return
		   */
		  public NoticeDTO read(int noticenum){
		    
		    return mybatis.selectOne("notice.read", noticenum);
		  }
		  /**
		   * 조회수 증가
		   * @param memono 조회수 증가할 글 번호
		   */
		  public void viewCnt(int noticenum){
			  mybatis.update("notice.viewCnt",noticenum);
		  } 
	  
}