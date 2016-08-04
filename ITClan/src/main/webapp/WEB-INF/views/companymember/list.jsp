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
<option value="name"
<c:if test="${col==name}">selected='selected'</c:if>
>성명</option>
<option value="email"
<c:if test="${col==email}">selected='selected'</c:if>
>이메일</option>
<option value="id"
  <c:if test="${col==companyID}">selected='selected'</c:if>
>아이디</option>
<option value="total"
  <c:if test="${col==total}">selected='selected'</c:if>
>전체출력</option>
</select>
<input type="text" name="word" value="${word}">
<input type="submit" value="검색" />
  &emsp;<input type='button' value='회원 등록'  onclick="location.href='../companymember/create'"> 
</FORM>
</DIV>
 
<c:forEach var="dto" items="${list}">
<TABLE> 
  
  <TR> 
    <TD rowspan='6' width='20%' align="center">
    <TH width='20%'>아이디</TH> 
    <TD width='60%'><A href='../companymember/read?companyID=${dto.companyID}'>${dto.companyID}</A></TD>
  </TR>
   
  <TR> 
    <TH>성명</TH> 
    <TD>${dto.name}</TD> 
  </TR> 
  <TR> 
    <TH>전화번호</TH> 
    <TD>${dto.phone}</TD> 
  </TR> 
  <TR> 
    <TH>이메일</TH> 
    <TD>${dto.email}</TD> 
  </TR> 
  <TR> 
    <TH>사업자번호</TH> 
    <TD>${dto.companyNumber}</TD> 
  </TR> 
  <TR> 
    <TH>회사명</TH> 
    <TD>${dto.companyName}</TD> 
  </TR> 
  
 
</TABLE> 
<BR> 
</c:forEach>
 
<DIV class="bottom"> 
${paging}
</DIV> 
 
 
</body> 
</html> 