package spring.model.companymember;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.companyinfo.*;

@Service
public class CompanyMemberMgr {
	@Autowired
	private CompanyMemberDAO cmdao;

	@Autowired
	private CompanyInfoDAO cidao;

	public void delete(String CompanyID) throws Exception {

		cmdao.delete(CompanyID);
		cidao.delete(CompanyID);
	}
}