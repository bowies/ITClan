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
  font-size: 16px; 
} 
</style> 
 <script type="text/JavaScript">

 </script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">등록</DIV>
 
<FORM name='frm' method='POST' action='./create'>
<input type="hidden" name = "offerNum" value="${param.offerNum}">
<input type="hidden" name = "memberID" value="${param.memberID}">
 <TABLE class='table'>
     
<c:choose>
<c:when test="${cnt>0}">
    <tr>
    <td align="center" colspan="2">
    이미지원하였습니다.
    </td>
    </tr>
 </c:when>
<c:otherwise>
<tr>
      <TH colspan="2">지원하시겠습니까?</TH>
</tr>
<tr>
<td>
<c:forEach items="${reList}" var="redto">
<input type="radio" name="resumeNum" value="${redto.resumeNum}">${redto.resumeName }<br>
</c:forEach>
</td>
<td>
<c:forEach items="${pfList }" var="pfdto">
<input type="radio" name="portfolioNum" value="${pfdto.portfolioNum}">${pfdto.portfolioName }<br>
</c:forEach>
</td>
</tr>

</c:otherwise>
</c:choose>
 </table>
  <c:choose>
  <c:when test="${cnt>0 }">
      <input type='button' value='취소' onclick="window.close();">
  </c:when>
  <c:otherwise>
  <input type='submit' value='등록'>
   <input type='button' value='취소' onclick="window.close();">
  </c:otherwise>
  </c:choose>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 