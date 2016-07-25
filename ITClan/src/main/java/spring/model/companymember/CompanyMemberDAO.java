package spring.model.companymember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import spring.model.itclan.DAOMyBatisInter;

public class CompanyMemberDAO implements DAOMyBatisInter {
	@Autowired
	private SqlSessionTemplate mybatis;

	public SqlSessionTemplate getMybatis() {
		return mybatis;
	}

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

//	InterFace에서 implements 한 메소드 구현
	@Override
	public int create(Object dto) throws Exception {
		return mybatis.insert("companymember.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("companymember.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		String CompanyID = (String)pk;
		return mybatis.selectOne("companymember.read", CompanyID);	
	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("companymember.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		String CompanyID = (String)pk;
		return mybatis.delete("companymember.delete", CompanyID);
	}

	@Override
	public int total(Map map) throws Exception {
	
		return mybatis.selectOne("companymember.total", map);
	}

}
