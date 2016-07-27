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
  font-size: 20px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">패스워드 수정 처리</DIV>
 <div class="content">
 <c:choose>
 <c:when test="${cnt==1}">
 패스워드를 변경했습니다.<br> 
    로그인해보세요~~~<br><br> 
    <input type='button' value='로그인' onclick="location.href='./login'"> 
 </c:when>
 <c:otherwise>
 패스워드 변경에 실패 했습니다.<br><br><br> 
    <input type='button' value='다시 시도' onclick="history.back();">
 </c:otherwise>
 </c:choose>
</DIV> 
 
<!-- *********************************************** -->
</body> 
<!-- *********************************************** --> 
</html> 
 
