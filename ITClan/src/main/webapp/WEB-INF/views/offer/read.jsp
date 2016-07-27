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
<script type="text/javascript">
function downFile(fname){
var url = "${pageContext.request.contextPath}/download";
url = url + "?dir=/storage";
url = url + "&filename="+fname;
 
location.href=url;
}
 
function listB(){
var url ="./list";
url = url + "?nowPage=${param.nowPage}";
url = url + "&col=${param.col}";
url = url + "&word=${param.word}";
 
location.href=url; 
}
 
function updateB(num){
var url ="./update";
url = url + "?nowPage=${param.nowPage}";
url = url + "&col=${param.col}";
url = url + "&word=${param.word}";
url = url + "&num="+num;
 
location.href=url; 
}
function replyB(num){
var url="./reply";
url = url + "?nowPage=${param.nowPage}";
url = url + "&col=${param.col}";
url = url + "&word=${param.word}";
url = url + "&num="+num;
 
location.href= url;
}
function deleteB(num){
var url="./delete";
url = url + "?nowPage=${param.nowPage}";
url = url + "&col=${param.col}";
url = url + "&word=${param.word}";
url = url + "&num="+num;
url = url + "&oldfile=${dto.filename}";
 
location.href=url;
}
 
</script>
 
</head> 
 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
 
<DIV class="title">내용보기</DIV>
 
<TABLE class='table' width="50%">
   <TR>
     <TH>글쓴이</TH>
     <TD>${dto.name }</TD>
   </TR>
   <TR>
     <TH>제목</TH>
     <TD>${dto.subject }</TD>
   </TR>
   <TR>
     <TH>내용</TH>
     <TD>${dto.content }</TD>
   </TR>
   <TR>
     <TH>조회수</TH>
     <TD>${dto.count}</TD>
   </TR>
   <TR>
     <TH>파일명</TH>
     <TD>
     <c:choose>
     	<c:when test="${empty dto.filename}">파일없음</c:when>
     	<c:otherwise>
     	<a href="javascript:downFile('${dto.filename}')">
    	${dto.filename}(${dto.filesize}) 
    	</a>
     	</c:otherwise>
     </c:choose>  
     </TD>
   </TR>
</TABLE>
  
<DIV class='bottom'>
  <input type='button' value='목록' onclick="listB()">
  <input type='button' value='수정' onclick="updateB('${dto.num}')">
  <input type='button' value='답변' onclick="replyB('${dto.num}')">
  <input type='button' value='삭제' onclick="deleteB('${dto.num}')">
</DIV>
</body>
<!-- *********************************************** -->
</html> 