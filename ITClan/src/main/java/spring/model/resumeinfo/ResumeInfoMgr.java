package spring.model.resumeinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.applycompany.ApplyCompanyDAO;
import spring.model.externalactivity.ExternalActivityDAO;
import spring.model.license.LicenseDAO;
import spring.model.resumedetail.ResumeDetailDAO;

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
	private ResumeDetailDAO resumedetaildao;
	
	
	public void delete(String memberID, Object pk) throws Exception {
		applycompanydao.delete(pk);
		resumedao.delete(pk);
		externalactivitydao.deleteinfo(memberID);
		licensedao.deleteinfo(memberID);
		resumedetaildao.deleteinfo(memberID);
	}
}