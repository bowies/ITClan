package spring.model.license;

import java.util.List;

public class LicenseDTO {
	
    private int licenseNum       ;
    private String qualification ;
    private String takeDate      ;
    private String memberID      ;
    

	public int getLicenseNum() {
		return licenseNum;
	}

	public void setLicenseNum(int licenseNum) {
		this.licenseNum = licenseNum;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getTakeDate() {
		return takeDate;
	}

	public void setTakeDate(String takeDate) {
		this.takeDate = takeDate;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}


    
}
