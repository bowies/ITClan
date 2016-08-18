package spring.model.portfolio;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;

@Component
public class PortFolioDAO implements DAOMyBatisInter {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	public int pfCheck(String memberID){
		return mybatis.selectOne("portfolio.pfCheck",memberID);
	}

	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.insert("portfolio.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("portfolio.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		int portfolioNum = (Integer) pk;
		return mybatis.delete("portfolio.delete", portfolioNum);
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteinfo(String memberID) {
		
		return mybatis.delete("portfolio.deleteinfo", memberID);
	}
	
	public int total(String memberID) {
		
		return mybatis.selectOne("portfolio.total", memberID);
	}

}