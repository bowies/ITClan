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
	public String list_D(String memberID,int resumeNum){
		Map map = new HashMap();
		map.put("memberID", memberID);
		map.put("resumeNum", resumeNum);
		return (String)mybatis.selectOne("applycompany.list_resume", map);
	}
	public String list_P(String memberID,int portfolioNum){
		Map map = new HashMap();
		map.put("memberID", memberID);
		map.put("portfolioNum", portfolioNum);
		return (String)mybatis.selectOne("applycompany.list_portfolio", map);
	}
	
	public List<LicenseDTO> list_L(String memberID){
		return mybatis.selectList("applycompany.list_License", memberID);
	}
	public List<ExternalActivityDTO> list_A(String memberID){
		return mybatis.selectList("applycompany.list_externalactivity", memberID);
	}
	public int delete_company(int offerNum){
		return mybatis.delete("applycompany.delete_company", offerNum);
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
	@Override
	public int delete(Object pk) throws Exception {
		String memberID = (String)pk;
		return mybatis.delete("applycompany.delete_personal", memberID);
	}
	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
}
