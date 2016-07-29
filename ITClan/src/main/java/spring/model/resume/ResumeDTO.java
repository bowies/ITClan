package spring.model.resume;

import java.util.List;

public class ResumeDTO {

	private int resumeNum ;
    private int memberID  ;
    private int resumeName;
    
    private List resumeList;

	

	public int getResumeNum() {
		return resumeNum;
	}

	public void setResumeNum(int resumeNum) {
		this.resumeNum = resumeNum;
	}

	public int getMemberID() {
		return memberID;
	}

	public void setMemberID(int memberID) {
		memberID = memberID;
	}

	public int getResumeName() {
		return resumeName;
	}

	public void setResumeName(int resumeName) {
		this.resumeName = resumeName;
	}

	public List getResumeList() {
		return resumeList;
	}

	public void setResumeList(List resumeList) {
		this.resumeList = resumeList;
	}
    
}
