package spring.model.resumedetail;

import java.util.List;

public class ResumeDetailDTO {

    private int resumeNum     ;
    private String memberID   ;
    private String biograph   ;
    private String portfolio  ;
    
    private List resumeList;

	public int getResumeNum() {
		return resumeNum;
	}

	public void setResumeNum(int resumeNum) {
		this.resumeNum = resumeNum;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getBiograph() {
		return biograph;
	}

	public void setBiograph(String biograph) {
		this.biograph = biograph;
	}

	public String getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}

	public List getResumeList() {
		return resumeList;
	}

	public void setResumeList(List resumeList) {
		this.resumeList = resumeList;
	}
    
}
