package spring.model.offer;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import spring.model.itclan.DAOMyBatisInter;

public class OfferDAO implements DAOMyBatisInter {
	
	@Autowired
	private SqlSessionTemplate mybatis;	
	
	public SqlSessionTemplate getMybatis() {
		return mybatis;
	}

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public int create(Object dto){
		// TODO Auto-generated method stub
		int cnt = mybatis.insert("offer.create", dto);
	
		return cnt;
	}

	@Override
	public List list(Map map){
		// TODO Auto-generated method stub
		return mybatis.selectList("offer.list", map);
	}

	@Override
	public Object read(Object pk){
		// TODO Auto-generated method stub
		return mybatis.selectOne("offer.read", pk);
	}

	@Override
	public int update(Object dto){
		// TODO Auto-generated method stub
		int cnt = mybatis.update("offer.update",dto);
		
		return cnt;
	}

	@Override
	public int delete(Object pk){
		// TODO Auto-generated method stub
		int cnt = mybatis.delete("offer.delete", pk);
		
		return cnt;
	}

	@Override
	public int total(Map map){
		// TODO Auto-generated method stub
 	
		return mybatis.selectOne("offer.total", map);
	}

}
