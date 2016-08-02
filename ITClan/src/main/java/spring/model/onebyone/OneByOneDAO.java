package spring.model.onebyone;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;
@Component
public class OneByOneDAO implements DAOMyBatisInter {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	

	public void increaseViewcnt(int oneByOneNum){
	   mybatis.update("onebyone.increaseViewcnt", oneByOneNum);
	    
	}  
	
	 public OneByOneDTO readReply(int oneByOneNum){
		   
		   return mybatis.selectOne("onebyone.readReply", oneByOneNum);
	 }	
	 
	 public int reply(OneByOneDTO dto) { 			 

		  return mybatis.update("onebyone.reply", dto); 
	} 	 
	 
	public void addAnsnum(int grpnum, int ansnum){ 
	    Map map = new HashMap();
	    map.put("grpnum", grpnum);
	    map.put("ansnum",ansnum);
		  mybatis.update("onebyone.addAnsnum",map);
	}   
	
	@Override
	public int create(Object dto) throws Exception {
		return mybatis.insert("onebyone.create",dto);
//		return 0;
	}

	@Override
	public List list(Map map) throws Exception {

		return mybatis.selectList("onebyone.list", map);
//		return null;
	}

	@Override
	public Object read(Object pk) throws Exception {

		int oneByOneNum = (Integer)pk;
	    return mybatis.selectOne("onebyone.read", pk);
//		return null;
	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("onebyone.update", dto);
//		return 0;
	}

	@Override
	public int delete(Object pk) throws Exception {
		int oneByOneNum = (Integer)pk;
		 return mybatis.delete("onebyone.delete",oneByOneNum);
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("onebyone.total", map);
	}


	public int checkId(int oneByOneNum, String id) {
		   Map map = new HashMap();
		   map.put("oneByOneNum", oneByOneNum);
		   map.put("id", id);
		return mybatis.selectOne("onebyone.checkId", map);
		
	}

}
