package spring.model.applycompany;

import java.util.List;

import spring.model.personalmember.PersonalMemberDTO;

public class ApplyCompanyDTO {
	private int applyCode;
	private String applyDate;
	private String memberID;
	private int offerNum;
	private int resumeNum;
	private int portfolioNum;
	private int viewCheck;
	private List offerList;
	private PersonalMemberDTO pmdto;
	
	
	
	
	
	

	public PersonalMemberDTO getPmdto() {
		return pmdto;
	}

	public void setPmdto(PersonalMemberDTO pmdto) {
		this.pmdto = pmdto;
	}

	public List getOfferList() {
		return offerList;
	}

	public void setOfferList(List offerList) {
		this.offerList = offerList;
	}

	public int getViewCheck() {
		return viewCheck;
	}

	public void setViewCheck(int viewCheck) {
		this.viewCheck = viewCheck;
	}


	public int getResumeNum() {
		return resumeNum;
	}

	public void setResumeNum(int resumeNum) {
		this.resumeNum = resumeNum;
	}

	public int getPortfolioNum() {
		return portfolioNum;
	}

	public void setPortfolioNum(int portfolioNum) {
		this.portfolioNum = portfolioNum;
	}

	public int getApplyCode() {
		return applyCode;
	}

	public void setApplyCode(int applyCode) {
		this.applyCode = applyCode;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public int getOfferNum() {
		return offerNum;
	}

	public void setOfferNum(int offerNum) {
		this.offerNum = offerNum;
	}


}
