package spring.model.personalmember;

import java.util.List;

public class PersonalMemberDTO {
	 private String memberID ;            
     private String name           ;
     private String birth            ;
     private String email           ;
     private String phone           ;
     private String passwd          ;
     private String grade           ;
     private String address         ;
     private String address2        ;
     private List resumInfoList;
     private List resumeList;
     private List portFolioList;
     private List ApplyCompanyList;
     
     
     
     
     
	public List getResumInfoList() {
		return resumInfoList;
	}
	public void setResumInfoList(List resumInfoList) {
		this.resumInfoList = resumInfoList;
	}
	public List getResumeList() {
		return resumeList;
	}
	public void setResumeList(List resumeList) {
		this.resumeList = resumeList;
	}
	public List getPortFolioList() {
		return portFolioList;
	}
	public void setPortFolioList(List portFolioList) {
		this.portFolioList = portFolioList;
	}
	public List getApplyCompanyList() {
		return ApplyCompanyList;
	}
	public void setApplyCompanyList(List applyCompanyList) {
		ApplyCompanyList = applyCompanyList;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}

     
}
