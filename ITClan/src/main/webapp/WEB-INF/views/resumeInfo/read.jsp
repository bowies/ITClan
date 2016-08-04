<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	function update(oldpicture) {
		var url = "update";
		url += "?oldpicture=" + oldpicture;

		location.href = url;
	}
	
	 function downFile(biograph){
			var url = "../download";
			url = url + "?dir=../storage";
			url = url + "&biograph="+biograph;
			 
			location.href=url;
	 }

		function downFile(portfolio){
			var url = "../download";
			url = url + "?dir=../storage";
			url = url + "&portfolio="+portfolio;
			 
			location.href=url;
	}
</script>
<body>

	<div style="width: 960px; margin : auto ;">

<h1>회원정보</h1>
</div>
<table border="1" style="border-collapse: collapse; height: 270px;" >
<tr >
<td style="width: 80px;" align="center" rowspan="8">
<img id="photo" src="../storage/resumeInfo_img/${resumeinfodto.picture }" style="width: 165px; height: 165px;">
</td>
</tr>
<tr style="width: 100px;">
<th colspan="2">이름  *</th>
<td colspan="4">${personalmemberdto.name }&nbsp; ${2016-(personalmemberdto.birth.substring(0,2)+1900) }세 / ${personalmemberdto.memberID}</td>
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
<th rowspan="3" colspan="2">주소</th>
</tr>

<tr>
<td colspan="4">
${personalmemberdto.address }
</td>
</tr>

<tr>
<td colspan="4">
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
${resumeinfodto.exArea }
</div>
</th>
<th colspan="3">지원분야<br><br>
<div style="text-align: center; padding-bottom: 20px;">
${resumeinfodto.exField }
</div>
</th>
</tr>

<tr>
<th colspan="3">포토폴리오<br>
<div style="text-align: center; padding-bottom: 10px;">
</div>
</th>

<th colspan="3">자기소개서
<div style="text-align: center; padding-bottom: 10px;">
</div>
</th>
</tr>
</table>

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

	<input type="button" value="수정"
		onclick="update('${resumedto.picture}')">
</body>
</html>