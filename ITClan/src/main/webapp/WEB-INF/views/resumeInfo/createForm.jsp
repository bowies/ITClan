<%@page import="spring.model.personalmember.PersonalMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="check.html" method="post">

<div style="width: 960px; margin: auto;">
<h1>회원정보</h1>
</div>
<table border="1">
<tr>
<td style="width: 80px;" align="center" rowspan="12"><img id="photo" src="./no_image.JPG" style="width: 170px; height: 170px;">
<input style="text-align: center; width: 76px;" type="file" id="imgInp">
</td>
</tr>
<tr>
<th colspan="2">이름 </th>
<td>
${personalmemberdto.name }
</td>
</tr>

<tr>
<th colspan="2">생년월일</th>
<td colspan="3">
${personalmemberdto.birth }
</td>
</tr>

<tr>
<th colspan="2">장애등급</th>
<td>
<input type="radio" value="장애">장애
<select>
<option>----
<option>1등급
<option>2등급
<option>3등급
<option>4등급
<option>5등급
<option>6등급
</select>
<input style="margin-left : 20px" type="radio" value="비장애">비장애
</td>
</tr>

<tr>
<th colspan="2">병역사항</th>
<td>
<input type="radio" value="군필">군필
<input style="margin-left : 15px" type="radio" value="미필">미필
<input style="margin-left : 15px" type="radio" value="면제">면제
</td>
</tr>

<tr>
<th rowspan="3">연락처 </th>
</tr>

<tr>
<th>휴대폰</th>
<td>
${personalmemberdto.phone }
</td>
</tr>

<tr>
<th>이메일</th>
<td>
email@email.com
</td>
</tr>


<tr>
<th rowspan="3" colspan="2">주소</th>
</tr>
<tr>
	<td colspan="3">
		주소
	</td>
</tr>
<tr>
	<td colspan="3">
		상세주소
	</td>
</tr>

</table>


</form>

</body>
</html>