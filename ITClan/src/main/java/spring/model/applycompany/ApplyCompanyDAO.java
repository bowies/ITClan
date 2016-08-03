package spring.model.applycompany;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.externalactivity.ExternalActivityDTO;
import spring.model.itclan.DAOMyBatisInter;
import spring.model.license.LicenseDTO;
import spring.model.offer.OfferDTO;
import spring.model.personalmember.PersonalMemberDTO;
import spring.model.portfolio.PortFolioDTO;
import spring.model.resume.ResumeDTO;

@Component
public class ApplyCompanyDAO implements DAOMyBatisInter{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}


	public int total_personal(String memberID){
		return mybatis.selectOne("applycompany.total_personal", memberID);
	}

	//-------------------------------------------------------company
	public int total_company(int offerNum){
		return mybatis.selectOne("applycompany.total_company", offerNum);
	}
	public List<ApplyCompanyDTO> list_company(Map map){
		return mybatis.selectList("applycompany.list_company", map);
	}
	public PersonalMemberDTO read_c(Map map){
		return mybatis.selectOne("applycompany.read_c", map);
	}
	//----------------------------------------------------------------------------------
	public List<ResumeDTO> list_resume(String memberID){
		return mybatis.selectList("applycompany.list_resume", memberID);
	}
	public List<PortFolioDTO> List_portfolio(String memberID){
		return mybatis.selectList("applycompany.list_portfolio", memberID);
	}
	
	//-----------------------------------------------------------------------------------
	
	public List<LicenseDTO> list_L(String memberID){
		return mybatis.selectList("applycompany.list_License", memberID);
	}
	public List<ExternalActivityDTO> list_A(String memberID){
		return mybatis.selectList("applycompany.list_externalactivity", memberID);
	}
	public int delete_company(int offerNum){
		return mybatis.delete("applycompany.delete_company", offerNum);
	}
	public ApplyCompanyDTO read_personal(Map map){
		return (ApplyCompanyDTO)mybatis.selectOne("applycompany.read_p", map);
	}
	//---------------------------------------------------------------------------------
	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.insert("applycompany.create", dto);
	}
	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("applycompany.list_personal", map);
	}
	@Override
	public Object read(Object pk) throws Exception {
		int offerNum = (Integer)pk;
		return mybatis.selectOne("applycompany.read_personal", offerNum);
	}
	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	//전부삭제
	@Override
	public int delete(Object pk) throws Exception {
		String memberID = (String)pk;
		return mybatis.delete("applycompany.delete_personalA", memberID);
	}
	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	//개인적 삭제
	public int deletePersonal(String memberID,int offerNum){
		Map map = new HashMap();
		map.put("memberID", memberID);
		map.put("offerNum", offerNum);
		return mybatis.delete("applycompany.delete_personal", map);
	}
	public int memberIDCheck(String memberID, int offerNum){
		Map map = new HashMap();
		map.put("memberID", memberID);
		map.put("offerNum", offerNum);
		return mybatis.selectOne("applycompany.memberIDCheck", map);
	}
	public void viewup(int offerNum , String memberID){
		Map map = new HashMap();
	map.put("memberID", memberID);
	map.put("offerNum", offerNum);
		mybatis.update("applycompany.viewup", map);
	}
	public int viewCheck(String memberID,int offerNum){
		Map map = new HashMap();
		map.put("memberID", memberID);
		map.put("offerNum", offerNum);
		return mybatis.selectOne("applycompany.viewCheck", map);
	}
	
	
}
