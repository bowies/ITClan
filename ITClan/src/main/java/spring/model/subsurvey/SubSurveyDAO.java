package spring.model.subsurvey;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;
@Component
public class SubSurveyDAO implements DAOMyBatisInter {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	public List<SubSurveyDTO> read_sub(int preNum){
		return mybatis.selectList("subsurvey.read",preNum );
	}
	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.insert("subsurvey.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.update("subsurvey.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.delete("subsurvey.delete", pk);
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
