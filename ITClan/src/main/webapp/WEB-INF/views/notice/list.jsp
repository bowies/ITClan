<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function read(noticeNum){
	var url = "./read";
	url += "?noticeNum="+noticeNum;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";	
	location.href=url;	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<DIV class="title">공지사항</DIV>

<DIV class="search">
<form method="POST" action="./list">
	<select name="col">
		<option value="title"
		<c:if test="${col=='title'}">selected</c:if>
		>제목</option>
		<option value="content"
		<c:if test="${col=='content'}">selected</c:if>
		>내용</option>
		<option value="total"
		<c:if test="${col=='total'}">selected</c:if>
		>전체출력</option>
	</select>
	<input type="text" name="word" value="${word}">
	<input type="submit" value="검색">
</form>
</DIV>
 
<TABLE class='table'>
  <TR>
    <TH>번호</TH>
    <TH>제목</Th>
    <TH>조회수</Th>
    <TH>등록일</TH>
  </TR>
<c:choose>
<c:when test="${empty list}">
  <TR>
  	<TD colspan="8" align="center">등록된 글이 없습니다.</TD>
  </TR>
</c:when>
<c:otherwise>
  <c:forEach items="${list}" var="dto">
  <TR>
  	<TD>${dto.noticeNum}</TD>
  	<TD>
  	<a href="javascript:read('${dto.noticeNum}')">${dto.title}<c:if test="${rcount>0 }">
            <span style="color:red;">(${rcount})</span>
          </c:if></a>  	
  	</TD>
  	<TD>${dto.viewCnt}</TD>
  	<TD>${dto.regDate}</TD>
  </TR>
</c:forEach>
</c:otherwise>
</c:choose>
</TABLE> 
<DIV class='bottom'>
    ${paging}
    <input type='button' value='등록' onclick="location.href='create'">
</DIV>
</body>
<!-- *********************************************** -->
</html> 

