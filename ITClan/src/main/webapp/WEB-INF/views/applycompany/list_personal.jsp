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
  font-size: 12px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function readB(offerNum,memberID,portfolioNum,resumeNum) {
	var url = "./read_p";
	url += "?offerNum=" + offerNum;//변수의 인식
	url += "&memberID="+memberID;
	url += "&portfolioNum="+portfolioNum;
	url += "&resumeNum="+resumeNum;
	url += "&nowPage=${nowPage}";
	
	location.href=url;
	
	
}
function del(offerNum,memberID) {
	alert("삭제하시겠습니까? ");
	var url = "./delete";
	url += "?offerNum="+offerNum;
	url += "&memberID="+memberID;
	
	location.href=url;
	
}
</script>

</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 <DIV class="title">게시판 목록</DIV>


  <TABLE>
    <TR>
      <th width = "25%">제목</th>
      <th>회사명</th>
      <th>모집인원</th>
      <th>등록일</th>
      <th>삭제여뷰</th>
   </TR>
  <c:choose>
  <c:when test="${empty list}">
  <tr>
	  <td colspan="8" align="center">등록된 글이 없습니다.</td>
	  </tr>
  </c:when>
  <c:otherwise>
  <c:forEach var="dto" items="${list}">
 <c:forEach items="${dto.offerList}" var="offerList">
  <tr>
    <td><a href="javascript:readB('${dto.offerNum }','${dto.memberID }','${dto.portfolioNum }','${dto.resumeNum }')">
    ${offerList.title}</a></td>
    <td>${offerList.companyName }</td>
    <td>${offerList.recruitment }</td>
    <td>${fn:substring(dto.applyDate,0,10) }</td>
    <td>
    <c:choose>
    <c:when test="${dto.viewCheck >0 }">
   삭제불가
    </c:when>
     <c:otherwise>
      <a href="javascript:del('${dto.offerNum }','${dto.memberID }')">삭제</a>
     </c:otherwise>
    </c:choose>
    </td>
    </tr>
    </c:forEach>
  </c:forEach>
  </c:otherwise>
  </c:choose>   
  </TABLE>
  
  <DIV class='bottom'>
  	${paging}<br>
  </DIV>

 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 