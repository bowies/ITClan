<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
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
 
<DIV class="title">로그인 처리</DIV>
 
<div class="content">
<c:choose>
<c:when test="${cnt==1}">
로그인 되었습니다.<br>
<DIV class='bottom'>
  <input type='button' value='홈' onclick="location.href='../'">
</DIV>
</c:when>
<c:otherwise>
id와 passwd가 일치하지 않습니다.<br>

<DIV class='bottom'>
  <input type='button' value='다시시도' onclick="history.back()">
</div>
</c:otherwise>
</c:choose>
 </div>
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 