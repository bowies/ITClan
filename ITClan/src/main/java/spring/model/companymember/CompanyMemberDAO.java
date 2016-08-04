package spring.model.companymember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;
@Component
public class CompanyMemberDAO implements DAOMyBatisInter {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	


	public String getGrade(String companyID) {
		
		return mybatis.selectOne("companymember.getGrade", companyID);
	}

	public int loginCheck(String companyID, String passwd) {
		Map map = new HashMap();
		map.put("companyID", companyID);
		map.put("passwd", passwd);

		return mybatis.selectOne("companymember.loginCheck", map);
	}


	public int duplicateEmail(String email) {
		return mybatis.selectOne("companymember.duplicateEmail", email);
	}

	public int duplicateID(String companyID) {

		return mybatis.selectOne("companymember.duplicateID", companyID);
	}

	
	public String pwFind(String companyID , String email){
		Map map = new HashMap();
		map.put("companyID", companyID);
		map.put("email", email);
		return mybatis.selectOne("companymember.pwFind", map);
		
	}
	
	public String idFind(String name , String email){
		Map map = new HashMap();
		map.put("name", name);
		map.put("email", email);
		return mybatis.selectOne("companymember.idFind", map);
		
	}
	
	public int EmailCheck(String email){
		return mybatis.selectOne("companymember.emailCheck", email);
	}
	
	public int idCheck(String companyID){
		return mybatis.selectOne("companymember.idCheck", companyID);
	}
	
	public int passwdCheck(String companyID , String passwd){
		Map map = new HashMap();
		map.put("companyID", companyID);
		map.put("passwd", passwd);
		return mybatis.selectOne("companymember.passwdCheck", map);
	}
	

	public int updatePw(String passwd,String companyID){
		Map map = new HashMap();
		map.put("passwd", passwd);
		map.put("companyID", companyID);
		return mybatis.update("companymember.updatePw", map);
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
