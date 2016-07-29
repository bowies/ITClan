package spring.model.resume;

import java.util.List;

public class ResumeDTO {

	private int resumeNum ;
    private int MemberID  ;
    private int resumeName;
    
    private List resumeList;

	

	public int getResumeNum() {
		return resumeNum;
	}

	public void setResumeNum(int resumeNum) {
		this.resumeNum = resumeNum;
	}

	public int getMemberID() {
		return MemberID;
	}

	public void setMemberID(int memberID) {
		MemberID = memberID;
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
