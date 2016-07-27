<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
 
<DIV class="title">정보수정</DIV>
 
<div class="content">
<c:choose>
<c:when test="${cnt==1}">
정보수정을 했습니다.<br>
<DIV class='bottom'>
  <input type='button' value='정보확인' 
  onclick="location.href='read?id=${dto.id}'">
</DIV>
</c:when>
<c:otherwise>
정보수정을 실패했습니다.<br>
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