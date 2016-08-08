package spring.model.survey;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;
@Component
public class SurveyDAO implements DAOMyBatisInter {
	@Autowired
	private SqlSessionTemplate mybatis;

	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public int up_sub(int preNum){
		return mybatis.update("survey.up_sub", preNum);
	}

	@Override
	public int create(Object dto) throws Exception {
		return mybatis.insert("survey.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("survey.list",map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("survey.read", pk);
	}

	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.delete("survey.delete", pk);
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("survey.total", map);
	}

}
