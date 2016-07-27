<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link href="${pageContext.request.contextPath}/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function read(num){
var url = "./read";
url = url + "?num="+num;
url = url + "&nowPage=${nowPage}";
url = url + "&col=${col}";
url = url + "&word=${word}";
 
location.href=url;
}
 
function downFile(fname){
var url = "${pageContext.request.contextPath}/download";
url = url + "?dir=/storage";
url = url + "&filename="+fname;
 
location.href=url;
}
</script>
 
</head> 
 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
 
<DIV class="title">게시판 목록</DIV>
 <DIV class="content">
  <form name="frm" method="post" action="./list">
  <select name="col">
  <option value="name">성명</option>
  <option value="subject">제목</option>
  <option value="content">내용</option>
  <option value="subject_content">제목+내용</option>
  <option value="total">전체출력</option>
  </select>
  <script type="text/javascript">
  document.frm.col.value='${col}'
  </script>
  <input type="text" name="word" value="${word}">
  <input type="submit" value="검색"/>
  </form>
 </DIV>
  <TABLE class='table'>
    <TR>
      <TH>번호</TH>
      <TH>성명</TH>
      <TH>제목</TH>
      <TH>조회수</TH>
      <TH>등록날짜</TH>
      <TH>파일</TH>     
    </TR>
<c:forEach var="dto" items="${list}">
<TR>
<TD>${dto.num}</TD>
<TD>${dto.name}</TD>
<TD>
<c:forEach begin="1" end="${dto.indent}">
   &nbsp; &nbsp; 
</c:forEach>
<c:if test="${dto.indent>0 }">
   [답변]
</c:if>
<a href="javascript:read('${dto.num}')">${dto.subject}</a>
<c:if test="${util:newImg(fn:substring(dto.regdate,0,10)) }">
<img src="${pageContext.request.contextPath}/images/new.gif" >
</c:if>
</TD>
<TD>${dto.count}</TD>
<TD>${fn:substring(dto.regdate,0,10)}</TD>
<TD>
<c:choose>
	<c:when test="${empty dto.filename}">파일없음</c:when>
	<c:otherwise>
	<a href="javascript:downFile('${dto.filename}')">${dto.filename}</a>
	</c:otherwise>
</c:choose>
</TD>
</TR>
</c:forEach> 
</TABLE>
  
  <DIV class='bottom'>
    ${paging}
    <input type='button' value='등록' onclick="location.href='./create'">
  </DIV>
</body>
<!-- *********************************************** -->
</html> 