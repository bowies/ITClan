<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">아이디 찾기</DIV>
<div class="content">
<c:choose>
<c:when test="${not empty companyID}">
당신의 아이디는 ${companyID}<br>
<DIV class='bottom'>
  <input type='button' value='로그인' onclick="location.href='./login'">
</DIV>
</c:when>
<c:otherwise>
회원정보가 없습니다.<br>
<DIV class='bottom'>
<input type='button' value='다시시도' onclick="history.back()">
</DIV>
</c:otherwise>
</c:choose>
</div>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 