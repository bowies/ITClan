<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
tr,th {
text-align: left;

}
table{
margin: auto;
width: 960px;
}
</style>
<script type="text/javascript">
	function update() {
		var url = "update";
		location.href = url;
	}
	
	 function downresume(biograph){
			var url = "${pageContext.request.contextPath }/download";
			url = url + "?dir=/storage/resume/";
			url = url + "&filename="+biograph;
			 
			location.href=url;
	 }

		function downport(portfolio){
			var url = "${pageContext.request.contextPath }/download";
			url = url + "?dir=/storage/portfolio/";
			url = url + "&filename="+portfolio;
			 
			location.href=url;
	}
		
</script>
<body>
<div style="width: 960px; margin : auto ;">
<h1>회원정보</h1>
</div>
<table border="1" style="border-collapse: collapse; height: 270px;" >
<tr >
<td style="width: 80px;" align="center" rowspan="10">
<img id="photo" src="../storage/resumeInfo_img/${resumeinfodto.picture }" style="width: 165px; height: 165px;">
</td>
</tr>
<tr style="width: 100px;">
<th colspan="2">이름  *</th>
<td colspan="4">${personalmemberdto.name }&nbsp; ${personalmemberdto.birth }세 / ${personalmemberdto.memberID} </td>
</tr>

<tr style="width: 100px;">
<c:choose>
<c:when test="${resumeinfodto.military.substring(0,2)=='미필' }">
</c:when>
<c:otherwise>
<th colspan="2">병역사항</th>
<td colspan="4">${resumeinfodto.military }</td>
</c:otherwise>
</c:choose>
</tr>

<tr style="width: 100px;">
<th colspan="2">장애여부</th>
<c:choose>
<c:when test="${resumeinfodto.disableGrade.substring(0,1)=='-' }">
<td colspan="4">
${resumeinfodto.disableGrade.substring(5,8) }
</td>
</c:when>
<c:otherwise>
<td colspan="4">
${resumeinfodto.disableGrade.substring(0,2) }
(${resumeinfodto.disableGrade.substring(3) })
</td>
</c:otherwise>
</c:choose>

</tr>

<tr>
<th rowspan="3">연락처  *</th>
</tr>

<tr>
<th>휴대폰</th>
<td colspan="4">
${personalmemberdto.phone }
</td>
</tr>

<tr>
<th>이메일</th>
<td colspan="4">
${personalmemberdto.email }
</td>
</tr>


<tr>
<th colspan="2">주소</th>
<td colspan="4">
${personalmemberdto.address }
${personalmemberdto.address2 }
</td>
</tr>

<tr>
<th>학력사항</th>
<th>경력사항</th>
<th>희망연봉</th>
<th>고용형태</th>
<th>자격증</th>
<th>대외활동</th>
</tr>
<tr>
<td align="center" style=" border-top:1px solid white; padding-top: 20px; padding-bottom: 20px;">
${resumeinfodto.education }
</td>

<td align="center" style=" border-top:1px solid white; padding-top: 20px; padding-bottom: 20px;">
${resumeinfodto.career }
</td>

<td align="center" style=" border-top:1px solid white; padding-top: 20px; padding-bottom: 20px;">
${resumeinfodto.exSalary }
</td>

<td align="center" style=" border-top:1px solid white; padding-top: 20px; padding-bottom: 20px;">
${resumeinfodto.employmentType }
</td>

<td align="center" style=" border-top:1px solid white; padding-top: 20px; padding-bottom: 20px;">
${limax }개
</td>

<td align="center" style=" border-top:1px solid white; padding-top: 20px; padding-bottom: 20px;">
${exmax }번
</td>
</tr>

<tr>
<th colspan="3">희망근무지<br><br>
<div style="text-align: center; padding-bottom: 20px;">
${resumeinfodto.exArea.substring(0,2)}
>
${resumeinfodto.exArea.substring(4)}
</div>
</th>
<th colspan="4">지원분야<br><br>
<div style="text-align: center; padding-bottom: 20px;">
${resumeinfodto.exField }
</div>
</th>
</tr>

<tr>
<td colspan="3" style="border-bottom-style: hidden; padding-bottom: 15px;">포토폴리오</td>
<td colspan="4" style="border-bottom-style: hidden;padding-bottom: 15px;">자기소개서</td>
</tr>

<tr>
<td colspan="3" style="text-align: center;">
<c:choose>
<c:when test="${pomax ==0 }">
<label>포트폴리오가 없습니다.</label>
</c:when>

<c:otherwise>
<c:forEach items="${portfoliolist}" var="portfoliodto">
<a href="javascript:downport('${portfoliodto.portfolioName}')">${portfoliodto.portfolioName}</a><hr>
</c:forEach>
</c:otherwise>
</c:choose>
</td>


<td colspan="4" style="text-align: center;">
<c:choose>
<c:when test="${remax ==0 }">
자기소개서가 없습니다.
</c:when>

<c:otherwise>
<c:forEach items="${resumelist }" var="resumedto">
<a href="javascript:downresume('${resumedto.resumeName}')">${resumedto.resumeName }</a><hr>
</c:forEach>
</c:otherwise>
</c:choose>
</td>
</tr>
</table>

<br><br>
<c:choose>
<c:when test="${resumeinfodto.termTime.substring(0,1)==',' }">
<div style="width: 960px; margin : auto ;">
<h1>학력사항
<label style="font-size: small;">(${resumeinfodto.education})</label>
</h1>
</div>
</c:when>

<c:otherwise>
<div style="width: 960px; margin : auto ;">
<h1>학력사항
<label style="font-size: small;">(${resumeinfodto.education})</label>
</h1>
</div>

<table border="1" style="border-collapse :collapse; ">
<tr style="background-color: #AFE1FF;">
<th style="text-align: center ;">재학기간</th>
<th style="text-align: center ;">학교명</th>
<th style="text-align: center ;">전공</th>

<c:choose>
<c:when test="${resumeinfodto.GPA.substring(0,1)==',' }">
</c:when>

<c:otherwise>
<th style="text-align: center ;">
학점
</th>
</c:otherwise>
</c:choose>
</tr>


<tr style="text-align: center;">
 <td>
${resumeinfodto.termTime.substring(0,7) }
(${resumeinfodto.termTime.substring(8,10)})
~
${resumeinfodto.termTime.substring(11,18) }
(${resumeinfodto.termTime.substring(termTimelast-2,termTimelast)})
</td>

<td>
${resumeinfodto.schoolName }
</td>	


<c:choose>
<c:when test="${resumeinfodto.major.substring(0,1)==','}">
<td>
${resumeinfodto.major.substring(1)}
</td>
</c:when>
<c:otherwise>
<td>
${resumeinfodto.major.substring(0,majorlast-1) }
</td>
</c:otherwise>
</c:choose>

<c:choose>
<c:when test="${resumeinfodto.GPA.substring(0,1)==',' }">
</c:when>

<c:when test="${resumeinfodto.GPA.substring(GPAlast-4,GPAlast-3)==',' }">
<td>
${resumeinfodto.GPA.substring(0,GPAlast-4)} /
${resumeinfodto.GPA.substring(GPAlast-3)}
</td>
</c:when>
</c:choose>
</tr>
</table>
</c:otherwise>
</c:choose>


<c:choose>
<c:when test="${empty licenselist }">
</c:when>

<c:otherwise>
<br><br>
<div style="width: 960px; margin : auto ;">
<h1>자격증</h1>
<table border="1" style="border-collapse :collapse; ">
<tr style="background-color: #AFE1FF;">
<th style="text-align: center ;">취득일</th>
<th style="text-align: center ;">자격증명</th>
</tr>

<c:forEach var="licensedto" items="${licenselist }">
<tr style="text-align: center;">
<td>
${licensedto.takeDate }
</td>
<td>
${licensedto.qualification }
</td>
</tr>
</c:forEach>
</table>
</div>
</c:otherwise>
</c:choose>

<c:choose>
<c:when test="${empty externalactivitylist }">
</c:when>
<c:otherwise>
<br><br>
<div style="width: 960px; margin : auto ;">
<h1>대외활동</h1>
<table border="1" style="border-collapse :collapse; ">
<tr style="background-color: #AFE1FF;">
<th style="text-align: center ;">활동기간</th>
<th style="text-align: center ;">활동구분</th>
<th style="text-align: center ;">활동내용</th>
</tr>

<c:forEach var="externalactivitydto" items="${externalactivitylist }">
<tr style="text-align: center;">
<td>
${externalactivitydto.actPeriod }
</td>
<td>
${externalactivitydto.actContent }
</td>
<td>
${externalactivitydto.actSector }
</td>
</tr>
</c:forEach>
</table>
</div>
</c:otherwise>
</c:choose>

<br><br>
<div style="width: 960px; margin:auto; text-align : center ;">
 위의 모든 기재사항은 사실과 다름없음을 확인합니다.<br><br>
		작성자 : <b>${personalmemberdto.name }</b>
</div>

<c:choose>
<c:when test="${empty memberID }">
</c:when>
<c:otherwise>
<br>
<div style="width: 960px; margin : auto ; text-align: center;">
	<input type="button" value="수정"
		onclick="update()">
</div>
</c:otherwise>
</c:choose>
</body>
</html>