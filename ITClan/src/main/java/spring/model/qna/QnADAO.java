package spring.model.qna;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;

@Component
public class QnADAO implements DAOMyBatisInter {			
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public int create(Object dto) throws Exception {

		return mybatis.insert("qna.create",dto);		
		
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("qna.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		
		int qnANum = (Integer)pk;
		
		 return mybatis.selectOne("qna.read", qnANum);
	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("qna.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		int qnANum = (Integer)pk;
		 return mybatis.delete("qna.delete",qnANum);
	}

	@Override
	public int total(Map map) throws Exception {

		return mybatis.selectOne("qna.total", map);
//		return 0;
		
	}
	
//	@Override
//	public int total(String col,String word){
//		Map map = new HashMap();
//		map.put("col", col);
//		map.put("word", word);
//		return mybatis.selectOne("qna.total", map);
//	}
	

}