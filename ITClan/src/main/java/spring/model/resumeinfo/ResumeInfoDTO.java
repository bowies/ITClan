package spring.model.resumeinfo;

import spring.model.personalmember.PersonalMemberDTO;

public class ResumeInfoDTO {

    private String memberID       ;
    private String education      ;
    private String career         ;
    private String employmentType ;
    private int exSalary          ;
    private String disableGrade   ;
    private String picture        ;
    private String exArea         ;
    private String exField        ;
    private String military       ;
	
    private PersonalMemberDTO pmdto;

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getEmploymentType() {
		return employmentType;
	}

	public void setEmploymentType(String employmentType) {
		this.employmentType = employmentType;
	}

	public int getExSalary() {
		return exSalary;
	}

	public void setExSalary(int exSalary) {
		this.exSalary = exSalary;
	}

	public String getDisableGrade() {
		return disableGrade;
	}

	public void setDisableGrade(String disableGrade) {
		this.disableGrade = disableGrade;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getExArea() {
		return exArea;
	}

	public void setExArea(String exArea) {
		this.exArea = exArea;
	}

	public String getExField() {
		return exField;
	}

	public void setExField(String exField) {
		this.exField = exField;
	}

	public String getMilitary() {
		return military;
	}

	public void setMilitary(String military) {
		this.military = military;
	}

	public PersonalMemberDTO getPmdto() {
		return pmdto;
	}

	public void setPmdto(PersonalMemberDTO pmdto) {
		this.pmdto = pmdto;
	}

	
    
}
