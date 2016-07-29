package spring.model.resumeinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.applycompany.ApplyCompanyDAO;
import spring.model.externalactivity.ExternalActivityDAO;
import spring.model.license.LicenseDAO;
import spring.model.resume.ResumeDAO;

@Service
public class ResumeInfoMgr {

	@Autowired
	private ApplyCompanyDAO applycompanydao;
	
	@Autowired
	private ResumeInfoDAO resumedao;
	
	@Autowired
	private ExternalActivityDAO externalactivitydao;
	
	@Autowired
	private LicenseDAO licensedao;
	
	@Autowired
	private ResumeDAO resumedetaildao;
	
	
	public void delete(String memberID) throws Exception {
		applycompanydao.delete(memberID);
		externalactivitydao.deleteinfo(memberID);
		licensedao.deleteinfo(memberID);
		resumedetaildao.deleteinfo(memberID);
		resumedao.delete(memberID);
	}
}
