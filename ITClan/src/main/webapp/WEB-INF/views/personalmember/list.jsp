<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href='../css/style01.css' rel='Stylesheet' type='text/css'> 
 
</head> 
<body> 
 
<DIV class="title">회원 목록</DIV> 
 
<DIV class="content"> 
  <input type='button' value='회원 등록'  onclick="location.href='../personal/create'" style="margin-bottom: 10px"> 
 
<FORM method="POST" action="./list">
<select name="col">
<option value="name"
<c:if test="${col =='name' }">selected</c:if>
>성명</option>
<option value="memberID"
<c:if test="${col == 'memberID' }">selected</c:if>
>아이디</option>
<option value="total"
<c:if test="${col == 'total' }">selected</c:if>
>전체출력</option>
</select>
<input type="text" name="word" value="${param.word }">
<input type="submit" value="검색" />
</FORM>
</DIV>
 <table class="readTable" style="width: 80%">
 <tr>
 <th>memberID</th>
 <th>name</th>
 <th>Birth Day</th>
 <th>Phone</th>
 <th>Email</th>
</tr>
<c:forEach var="dto" items="${list}">
  <tr> 
    <TD width="100px"><A href='../userM/read?memberID=${dto.memberID }'>${dto.memberID }</A></TD> 
     <TD>${dto.name }</TD> 
     <TD>${dto.birth }</TD> 
    <TD width="250px">${dto.phone }</TD> 
    <TD>${dto.email }</TD> 
  </TR> 
</c:forEach> 
 
 </table>

<BR> 
 
<DIV class="bottom"> 
${paging }
</DIV> 
</body> 
</html> 