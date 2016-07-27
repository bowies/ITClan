<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style01.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">회원가입 처리</DIV>
 
<DIV class="content" align="center">
<c:choose>
<c:when test="${flag }">
ID 와 Email 이 중복입니다.
다시 하십시오
  <input type='button' value='home' onclick="location.href='../'" class = "btu" >
</c:when>
<c:otherwise>
	<c:choose>
	<c:when test="${cnt>0 }">
	회원가입 되었습니다.
	  <input type='button' value='log-in' onclick="location.href='./login'" class = "btu">
  <input type='button' value='home' onclick="location.href='../'" class = "btu"> 
  	</c:when>
  	<c:otherwise>
  	회원가입에 실패했습니다.
  	<input type='button' value='Back' onclick="history.back()" class="btu">
  <input type='button' value='home' onclick="location.href='../'" class = "btu"> 
  	</c:otherwise>
	</c:choose>
</c:otherwise>
</c:choose>

</DIV>

<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 