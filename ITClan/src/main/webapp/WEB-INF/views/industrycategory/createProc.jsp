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


	<DIV class="content">
	
		<c:choose>
		<c:when test="${cnt>0}">
			분류 코드 등록 성공<br>
			<DIV class='bottom'>
			<input type='button' value='홈' onclick="location.href='../'">
			</DIV>
		</c:when>
		<c:otherwise>
			분류 코드 등록 재시도<br>
			<DIV class='bottom'>
			<input type='button' value='다시시도' onclick="history.back()"> 
			<input type='button' value='홈' onclick="location.href='../'">
			</DIV>
		</c:otherwise>
		</c:choose>

	</DIV>
	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
