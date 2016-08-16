package spring.model.personalmember;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.resumeinfo.ResumeInfoMgr;
@Service
public class PersonalMemberMgr {
	
	@Autowired
	private PersonalMemberDAO dao;
	@Autowired
	private ResumeInfoMgr mgr;
	
    public void delete(String memberID) throws Exception{
    	 
        mgr.delete(memberID);
        dao.delete(memberID);
 }

}
