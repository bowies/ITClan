package spring.model.survey;

public class SurveyDTO {
	private int preNum;
	private String title;
	private int viewcnt;
	private String regdate;
	private String enddate;
	
	
	
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getPreNum() {
		return preNum;
	}
	public void setPreNum(int preNum) {
		this.preNum = preNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	
	

}
