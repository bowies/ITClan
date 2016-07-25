package spring.model.license;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;

@Component
public class LicenseDAO implements DAOMyBatisInter {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.insert("license.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("license.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		int licenseNum = (Integer) pk;
		return mybatis.selectOne("license.read", licenseNum);
	}

	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.update("license.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		int licenseNum = (Integer) pk;
		return mybatis.delete("license.delete", licenseNum);
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int deleteinfo(String memberID) {
		
		return mybatis.delete("license.deleteinfo", memberID);
	}

}
