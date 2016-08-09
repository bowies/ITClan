package spring.model.resume;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ResumeDTO {

    private int resumeNum      ; 
    private String memberID    ; 
    private String resumeName  ;
    
    private MultipartFile resumeMF ;
    
    private List resumeList ;
    
	public MultipartFile getResumeMF() {
		return resumeMF;
	}
	public void setResumeMF(MultipartFile resumeMF) {
		this.resumeMF = resumeMF;
	}
	public List getResumeList() {
		return resumeList;
	}
	public void setResumeList(List resumeList) {
		this.resumeList = resumeList;
	}
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
