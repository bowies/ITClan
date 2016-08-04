package spring.model.portfolio;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PortFolioDTO {

    private int portfolioNum     ; 
    private String memberID      ; 
    private String portfolioName ;
    
    private MultipartFile portfolioMF;
    
    private List portfolioList;
    
	public MultipartFile getPortfolioMF() {
		return portfolioMF;
	}
	public void setPortfolioMF(MultipartFile portfolioMF) {
		this.portfolioMF = portfolioMF;
	}
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
	public List getPortfolioList() {
		return portfolioList;
	}
	public void setPortfolioList(List portfolioList) {
		this.portfolioList = portfolioList;
	}
}
