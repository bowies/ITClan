package spring.model.portfolio;

public class PortFolioDTO {

    private int portfolioNum     ; 
    private String MemberID      ; 
    private String portfolioName ;
    
	public int getPortfolioNum() {
		return portfolioNum;
	}
	public void setPortfolioNum(int portfolioNum) {
		this.portfolioNum = portfolioNum;
	}
	public String getMemberID() {
		return MemberID;
	}
	public void setMemberID(String memberID) {
		MemberID = memberID;
	}
	public String getPortfolioName() {
		return portfolioName;
	}
	public void setPortfolioName(String portfolioName) {
		this.portfolioName = portfolioName;
	} 
}
