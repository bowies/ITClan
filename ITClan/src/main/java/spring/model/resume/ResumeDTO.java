package spring.model.resume;

public class ResumeDTO {

    private int resumeNum      ; 
    private String memberID    ; 
    private String resumeName  ;
    
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
		memberID = memberID;
	}
	public String getResumeName() {
		return resumeName;
	}
	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}
    
    
}
