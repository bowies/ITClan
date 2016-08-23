package spring.model.externalactivity;

import java.util.List;

public class ExternalActivityDTO {
	int test;
   private int actNum            ;
   private String actPeriod  ;
   private String actSector  ;
   private String actContent ;
   private String memberID   ;


public int getActNum() {
	return actNum;
}

public void setActNum(int actNum) {
	this.actNum = actNum;
}

public String getActPeriod() {
	return actPeriod;
}

public void setActPeriod(String actPeriod) {
	this.actPeriod = actPeriod;
}

public String getActSector() {
	return actSector;
}

public void setActSector(String actSector) {
	this.actSector = actSector;
}

public String getActContent() {
	return actContent;
}

public void setActContent(String actContent) {
	this.actContent = actContent;
}

public String getMemberID() {
	return memberID;
}

public void setMemberID(String memberID) {
	this.memberID = memberID;
}

   
}
