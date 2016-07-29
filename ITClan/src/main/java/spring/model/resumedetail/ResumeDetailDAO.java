package spring.model.resumedetail;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;

@Component
public class ResumeDetailDAO implements DAOMyBatisInter {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.insert("resumedetail.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("resumedetail.list", map);
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
		int resumeNum = (Integer) pk;
		return mybatis.delete("resumedetail.delete", resumeNum);
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteinfo(String memberID) {
		
		return mybatis.delete("resumedetail.deleteinfo", memberID);
	}
	
	public int total(String memberID) {
		
		return mybatis.selectOne("resumedetail.total", memberID);
	}
}
