package spring.model.companymember;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.companyinfo.CompanyInfoDAO;

@Service
public class CompanyMemberMgr {
	@Autowired
	private CompanyMemberDAO cdao;

	@Autowired
	private CompanyInfoDAO cidao;

	public void delete(String CompanyID) throws Exception {

		cdao.delete(CompanyID);
		cidao.delete(CompanyID);
	}
}