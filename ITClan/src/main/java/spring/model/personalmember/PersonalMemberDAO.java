package spring.model.personalmember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.itclan.DAOMyBatisInter;
import spring.model.resumeinfo.ResumeInfoDTO;
@Component
public class PersonalMemberDAO implements DAOMyBatisInter{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public PersonalMemberDTO getGrade(String memberID){
		return mybatis.selectOne("personalmember.getGrade", memberID);
	}
	
	public int loginCheck(String memberID ,String passwd){
		Map map = new HashMap();
		map.put("memberID", memberID);
		map.put("passwd", passwd);
		return mybatis.selectOne("personalmember.login", map);
	}
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public int resumeCheck(String memberID){
		return mybatis.selectOne("personalmember.resumeCheck", memberID);
	}
	
	public String resumepic(String memberID){
		return mybatis.selectOne("personalmember.resumepic", memberID);
	}
	public int updatepic(ResumeInfoDTO dto){
		
		return mybatis.update("personalmember.updatepic", dto);
	}
	
	public String pwFind(String memberID , String email){
		Map map = new HashMap();
		map.put("memberID", memberID);
		map.put("email", email);
		return mybatis.selectOne("personalmember.pwFind", map);
		
	}
	public String idFind(String name , String email){
		Map map = new HashMap();
		map.put("name", name);
		map.put("email", email);
		return mybatis.selectOne("personalmember.idFind", map);
		
	}
	public int EmailCheck(String email){
		return mybatis.selectOne("personalmember.emailCheck", email);
	}
	
	public int idCheck(String memberID){
		return mybatis.selectOne("personalmember.idCheck", memberID);
	}
	
	public int passwdCheck(String memberID , String passwd){
		Map map = new HashMap();
		map.put("memberID", memberID);
		map.put("passwd", passwd);
		return mybatis.selectOne("personalmember.passwdCheck", map);
	}
	

	public int updatePw(String passwd,String memberID){
		Map map = new HashMap();
		map.put("passwd", passwd);
		map.put("memberID", memberID);
		return mybatis.update("personalmember.updatePw", map);
	}	
	
	//list--   -----------------------------------------------
	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("personalmember.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		String memberID = (String)pk;
		return mybatis.selectOne("personalmember.read", memberID);
		
	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("personalmember.update", dto);
		

	}

	@Override
	public int delete(Object pk) throws Exception {
		String memberID = (String)pk;
		return  mybatis.delete("personalmember.delete", memberID);
		
		
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("personalmember.total", map);
	}

	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.insert("personalmember.create", dto);
	}
	
}
