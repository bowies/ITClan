package spring.model.industrycategory;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;

@Component
public  class IndustryCategoryDAO implements DAOMyBatisInter {

@Autowired
private SqlSessionTemplate mybatis;
	
	
	public SqlSessionTemplate getMybatis() {
		return mybatis;
	}

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	
	
	@Override
	public int create(Object dto) throws Exception {
		return  mybatis.insert("industrycategory.create", dto);
		
	
	
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("industrycategory.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
	    return mybatis.selectOne("industrycategory.read", pk);
	}



	@Override
	public int delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		
			return mybatis.delete("industrycategory.delete", pk);
			
		
		  
	}

	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int total(Map map) throws Exception {

		return mybatis.selectOne("industrycategory.total", map);
	}



}
