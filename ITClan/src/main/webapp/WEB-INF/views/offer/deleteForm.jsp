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
<link href="./css/style.css" rel="Stylesheet" type="text/css">
</head> 
 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
 
<DIV class="title">삭제</DIV>
 
<DIV class="content">
<c:choose>
	<c:otherwise>
	<FORM name='frm' method='POST' action='./delete'>
	<input type="hidden" name="nowPage" value="${param.nowPage}">
	  <input type="hidden" name="col" value="${param.col}">
	  <input type="hidden" name="word" value="${param.word}">
	  <input type="hidden" name="offernum" value="${param.offernum}">
	  
	  <DIV class='bottom'>
	    <input type='submit' value='삭제'>
	    <input type='button' value='취소' onclick="history.back()">
	  </DIV>
     </FORM>
	</c:otherwise>

</c:choose>

 </DIV>
</body>
<!-- *********************************************** -->
</html> 