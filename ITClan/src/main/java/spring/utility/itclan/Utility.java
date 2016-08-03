package spring.utility.itclan;

public class Utility {
	
	public static String nullCheck(String str){
		if(str==null){
			str="";
		}
		
		return str;
	}
}