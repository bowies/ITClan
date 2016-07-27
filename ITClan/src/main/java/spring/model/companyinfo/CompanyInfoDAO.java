package spring.model.companyinfo;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;
@Component
public class CompanyInfoDAO implements DAOMyBatisInter {

	
	private SqlSessionTemplate mybatis;
	
	
	public SqlSessionTemplate getMybatis() {
		return mybatis;
	}

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.insert("companyinfo.create", dto);

	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		 return mybatis.selectList("companyinfo.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		 return mybatis.selectOne("companyinfo.read", pk);
	}

	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.update("companyinfo.update",dto);
		
		 
		
	}

	@Override
	public int delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.delete("companyinfo.delete", pk);
		
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("companyinfo.total", map);
	}

}
