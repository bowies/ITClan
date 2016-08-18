package spring.model.externalactivity;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;

@Component
public class ExternalActivityDAO implements DAOMyBatisInter {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.insert("externalactivity.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("externalactivity.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		int actNum = (Integer) pk;
		return mybatis.selectOne("externalactivity.read", actNum);
	}

	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.update("externalactivity.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		int actNum = (Integer) pk;
		return mybatis.delete("externalactivity.delete", actNum);
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int deleteinfo(String memberID){
		
		return mybatis.delete("externalactivity.deleteinfo", memberID);
	}
	
	public int total(String memberID){
		
		return mybatis.selectOne("externalactivity.total", memberID);
	}

}