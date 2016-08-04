package spring.model.offer;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;

@Component
public class OfferDAO implements DAOMyBatisInter {
	
	@Autowired
	private SqlSessionTemplate mybatis;	

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.insert("offer.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("offer.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		int offerNum = (Integer)pk;
		return mybatis.selectOne("offer.read", offerNum);
	}

	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.update("offer.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		int offerNum = (Integer)pk;
		return mybatis.delete("offer.delete",offerNum );
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("offer.total", map);
	}

	public int increaseViewCnt(int offerNum) {
		// TODO Auto-generated method stub
		return mybatis.update("offer.increaseViewCnt", offerNum);
		
	}

}
