<%@ page contentType="text/html; charset=UTF-8" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

 
<link href='../css/style.css' rel='Stylesheet' type='text/css'> 
 
</head> 
<body> 

<DIV class="title">회원 목록</DIV> 
 
<DIV class="content"> 
 
<FORM method="POST" action="./list">
<select name="col">
<option value="categoryCode"
<c:if test="${col==categoryCode}">selected='selected'</c:if>
>분류코드</option>
<option value="categoryName"
<c:if test="${col==categoryName}">selected='selected'</c:if>
>분류명</option>
</select>
<input type="text" name="word" value="${word}">
<input type="submit" value="검색" />
  
</FORM>
</DIV>
 
<c:forEach var="dto" items="${list}">
<TABLE> 
    
  <TR> 
    <TH>분류코드</TH> 
    <TD><A href='../industrycategory/read?categoryCode=${dto.categoryCode}'>${dto.categoryCode}</A></TD>
  </TR> 
  <TR> 
    <TH>분류명</TH> 
    <TD>${dto.categoryName}</TD> 
  </TR> 
  
  
 
</TABLE> 
</c:forEach>
 
 
 
<DIV class="bottom"> 
${paging}
</DIV> 
 
</body> 
</html> 