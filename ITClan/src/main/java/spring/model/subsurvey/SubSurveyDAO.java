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

	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int createS(int preNum){
		return mybatis.insert("subsurvey.create", preNum);
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("subsurvey.read", pk);
	}

	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
//-------------------------------------------------------------
	
	public int update1(int preNum){
		return mybatis.update("subsurvey.updatecnt1", preNum);
	}
	public int update2(int preNum){
		return mybatis.update("subsurvey.updatecnt2", preNum);
	}
	public int update3(int preNum){
		return mybatis.update("subsurvey.updatecnt3", preNum);
	}
	public int update4(int preNum){
		return mybatis.update("subsurvey.updatecnt4", preNum);
	}
	
	@Override
	public int delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.delete("subsurvey.delete_sub", pk);
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
