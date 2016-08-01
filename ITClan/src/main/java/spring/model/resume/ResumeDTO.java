package spring.model.resume;

import java.util.List;

public class ResumeDTO {

	private int resumeNum ;
    private String memberID  ;
    private String resumeName;
    
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

	public String getResumeName() {
		return resumeName;
	}

	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}

	public List getResumeList() {
		return resumeList;
	}

	public void setResumeList(List resumeList) {
		this.resumeList = resumeList;
	}

	
    
}
