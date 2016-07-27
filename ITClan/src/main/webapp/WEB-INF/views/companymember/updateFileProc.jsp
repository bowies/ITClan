<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{
  font-family: gulim; 
  font-size: 24px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">사진변경</DIV>
 
<DIV class="content">
<c:choose>
<c:when test="${cnt==1}">
사진을 변경했습니다.<br>
<DIV class='bottom'>
  <input type='button' value='나의정보' onclick="location.href='read?id=${id}'">
</DIV>
</c:when>
<c:otherwise>
사진변경를 실패했습니다.<br>
<DIV class='bottom'>
  <input type='button' value='다시시도' onclick="history.back()">
</DIV>
</c:otherwise>
</c:choose>
</DIV>
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 