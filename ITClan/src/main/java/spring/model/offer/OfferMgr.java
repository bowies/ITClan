package spring.model.offer;

import org.springframework.beans.factory.annotation.Autowired;

import spring.model.applycompany.ApplyCompanyDAO;

public class OfferMgr {

	@Autowired
	private OfferDAO odao;
	
	@Autowired
	private ApplyCompanyDAO acdao;
	
	public void delete(int OfferNum) throws Exception{
		odao.delete(OfferNum);
		acdao.delete_company(OfferNum);
	}
}
