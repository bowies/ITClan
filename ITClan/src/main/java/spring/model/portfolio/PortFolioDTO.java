package spring.model.portfolio;

public class PortFolioDTO {

    private int portfolioNum     ; 
    private String memberID      ; 
    private String portfolioName ;
    
	public int getPortfolioNum() {
		return portfolioNum;
	}
	public void setPortfolioNum(int portfolioNum) {
		this.portfolioNum = portfolioNum;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		memberID = memberID;
	}
	public String getPortfolioName() {
		return portfolioName;
	}
	public void setPortfolioName(String portfolioName) {
		this.portfolioName = portfolioName;
	} 
}