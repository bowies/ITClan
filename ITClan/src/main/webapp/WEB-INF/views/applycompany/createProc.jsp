<%@ page contentType="text/html; charset=UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 16px; 
} 
</style> 
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="content">
<c:choose>
<c:when test="${cnt>0 }">
지원에 성공했습니다.
</c:when>
 <c:otherwise>
실패했습니다.
 </c:otherwise>
</c:choose>
<br>
<input type="button" value="닫기" onclick="window.close();" style="margin: 5px">
</DIV>
 

 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 