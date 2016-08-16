package spring.model.survey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.subsurvey.SubSurveyDAO;

@Service
public class SurveyMgr {
	@Autowired
	private SubSurveyDAO sdao;
	@Autowired
	private SurveyDAO dao;
	
	public void Delete(int preNum) throws Exception{
		sdao.delete(preNum);
		dao.delete(preNum);
	}

}
