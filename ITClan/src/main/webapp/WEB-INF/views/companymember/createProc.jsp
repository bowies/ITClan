<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title"></DIV>

	<DIV class="content">
	
	<c:choose>
	<c:when test="${flag}">
	아이디와 이메일 중복확인 하세요
	</c:when>
	<c:otherwise>
		<c:choose>
		<c:when test="${cnt==1}">
			<a href = "javascript:offer()" target="_self">
<img src="./image/welcome.png"; style="position: absolute; top: 150px; left: 200px; width: 400px;">

</a>
			<DIV class='bottom'>
			<input type='button' value='로그인' onclick="location.href='login'">
			<input type='button' value='홈' onclick="location.href='../'">
			</DIV>
		</c:when>
		<c:otherwise>
			회원가입을 실패했습니다.
			<DIV class='bottom'><br>
			<input type='button' value='다시시도' onclick="history.back()"> 
			<input type='button' value='홈' onclick="location.href='../'">
			</DIV>
		</c:otherwise>
		</c:choose>
	</c:otherwise>
	</c:choose>

	</DIV>
	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
