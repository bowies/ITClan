<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 


</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 

 
<DIV class="content">
<c:choose>
<c:when test="${flag }">
ID 와 Email 이 중복입니다.
다시 하십시오
  <input type='button' value='home' onclick="location.href='../'" class = "btu" >
</c:when>
<c:otherwise>
	<c:choose>
	<c:when test="${cnt>0 }">
	
<img src="../image/welcome.png" style="position: absolute; top: 150px; left: 200px; width:800px; margin-bottom: 100px;">


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