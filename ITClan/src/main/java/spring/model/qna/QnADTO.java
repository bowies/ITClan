package spring.model.qna;

public class QnADTO {

	private int qnANum;
	private String title;
	private String name;
	private String content;
	
	private String regdate;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getQnANum() {
		return qnANum;
	}
	public void setQnANum(int qnANum) {
		this.qnANum = qnANum;
	} 
	
}