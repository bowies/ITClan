<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function input(f){
	if(f.career[0].checked==false && f.career[1].checked==false){
		alert("경력사항을 선택해주세요.");
		f.career[0].focus();
		return false;
	}
}
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">

//경력사항
 $(document).ready(function() {
	$("#activity").hide();
	$("#newcomer").click(function() {
		$("#activity").hide();
	});
});

$(document).ready(function() {
	$("#career").click(function() {
		$("#activity").show();

	});
}); 

if(${exmax>0 }){
	$(document).ready(function() {
		$("#activity").show();

	});
}
//------------------------------------------

//경력사항 추가 팝업창
function externalactivityCreate(exmax){
	if(exmax>=5){
		alert("5개 이상");
		return false;
	}else{
	var url = "../externalActivity/create";
	wr = window.open(url,"대외활동","width=500,height=400"); 
    wr.moveTo((window.screen.width-500)/2, (window.screen.height - 400)/2);// x, y
	}
}
//------------------------------------------
function licenseCreate(limax){
	if(limax>=5){
		alert("5개 이상");
		return false;
	}else{
	var url = "../license/create";
	wr = window.open(url,"자격증","width=500,height=400"); 
    wr.moveTo((window.screen.width-500)/2, (window.screen.height - 400)/2);// x, y
	}
}

//경력사항 삭제

function deleteL(licenseNum) {
	var url = "../license/delete"
	url += "?licenseNum="+licenseNum;
	
	location.href=url;
}

function deleteEX(actNum) {
	var url ="../externalActivity/delete";
	url += "?actNum="+actNum;
	
	location.href=url;
}
</script>
</head>
<body>
	<form action="./create" method="post"
		 onsubmit="return input(this)">
			<input type="hidden" name="memberID" value="${memberID }">
			<input type="hidden" name="education" value="${resumeinfodto.education }">
			<input type="hidden" name="employmentType" value="${resumeinfodto.employmentType }">
			<input type="hidden" name="exSalary" value="${resumeinfodto.exSalary }">
			<input type="hidden" name="disableGrade" value="${resumeinfodto.disableGrade }">
			<input type="hidden" name="exArea" value="${resumeinfodto.exArea }">
			<input type="hidden" name="exField" value="${resumeinfodto.exField }">
			<input type="hidden" name="military" value="${resumeinfodto.military }">
			<input type="hidden" name="schoolName" value="${resumeinfodto.schoolName }">
			<input type="hidden" name="major" value="${resumeinfodto.major }">
			<input type="hidden" name="termTime" value="${resumeinfodto.termTime }">
			<input type="hidden" name="GPA" value="${resumeinfodto.GPA }">
			<input type="hidden" name="picture" value="${resumeinfodto.picture }">
		
		<div style="width: 960px; margin: auto;">
			<h1>경력사항
			<label style="font-size: small;">(최대 5개 입력)</label>
			</h1>
		</div>
		
		<div style="text-align: center; margin: auto; background-color: #D9E5FF; border: 2px solid #2478FF; padding-bottom: 15px; padding-top: 15px; width: 960px;">
			<b>경력사항 *</b>
			<c:choose>
				<c:when test="${exmax>0 }">
					<input type="radio" name="career" id="newcomer" value="신입">신입
					<input type="radio" name="career" id="career" value="경력" checked="checked">경력
				</c:when>
				<c:otherwise>
					<input type="radio" name="career" id="newcomer" value="신입">신입
					<input type="radio" name="career" id="career" value="경력">경력
				</c:otherwise>
			</c:choose>
		</div>
			<br>
			<div style="width: 960px; margin: auto;" id="activity">
 			<c:forEach var="externalactivitydto" items="${externalactivitylist }">
			<div style=" margin: auto; background-color: #D9E5FF; border: 2px solid #2478FF; padding-bottom: 15px; padding-top: 15px; width: 960px;">
			<div>
			<label>대외활동</label>
			<label style="float: right;"> 
			<a href="javascript:deleteEX('${externalactivitydto.actNum}')">-삭제</a>
			</label>
			</div>
			<hr>
			
			<div>
			<label>활동구분</label>
			<label>
			${externalactivitydto.actSector }
			</label>
			</div>
			<hr>
			
			<div>
			<label>활동기간</label>
			<label>
			${externalactivitydto.actPeriod }
			</label>
			</div>
			<hr>
			
			<div>
			<label>활동내용</label>
			<label>
			${externalactivitydto.actContent }
			</label>
			</div>
			</div>
			<br>
			</c:forEach>		
			<input style="float: right;" type="button" value="+추가" onclick="externalactivityCreate('${exmax}')">
			</div>		
			
			<br>	
			<div style="width: 960px; margin: auto;">
			<h1>자격증
			<label style="font-size: small;">(최대 5개 입력)</label>
			</h1>
			
			<input type="button" value="+추가" onclick="licenseCreate('${limax}')"><br><br>
			<div id="parentId">
 			<c:forEach var="licensedto" items="${licenselist }">
			<div style=" margin: auto; background-color: #D9E5FF; border: 2px solid #2478FF; padding-bottom: 15px; padding-top: 15px; width: 960px;">
			<div>
			<label>자격증</label>
			<label style="float: right;"> 
			<a href="javascript:deleteL('${licensedto.licenseNum}')">-삭제</a>
			</label>
			</div>
			<hr>
			
			<div>
			<label>자격증명</label>
			<label>
			${licensedto.qualification }
			</label>
			</div>
			<hr>
			
			<div>
			<label>취득일자</label>
			<label>
			${licensedto.takeDate }
			</label>
			</div>
			</div>
			<br>
			</c:forEach>
			</div>
			</div>
			
			<div style="width: 960px; margin: auto; text-align: center;">
			<input type="button" value="뒤로" onclick="javascript:history.back();">	
			<input type="submit" value="확인">	
			</div>
</form>
</body>
</html>