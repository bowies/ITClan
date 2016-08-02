<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="uti" uri="/ELFunctions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function listB() {
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;	
}
function updateB() {
	var url = "update";
	url += "?oneByOneNum=${dto.oneByOneNum}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";	
	location.href=url;	
}
function deleteB() {
	var url = "delete";
	url += "?oneByOneNum=${dto.oneByOneNum}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
	
}

function replyB() {
	var url = "reply";
	url += "?oneByOneNum=${dto.oneByOneNum}";
	url += "&col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;	
}

</script>

</head>
<body>



<DIV class="title">★ 조회</DIV>
 
  <TABLE class='table'>
    <TR>
      <TH>번호</TH>
      <TD>${dto.oneByOneNum }</TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD>${dto.title }</TD>
    </TR>
    <TR>
      <TH>ID</TH>
      <TD>${dto.id }</TD>
    </TR>
    <TR>
      <th>내용</th>
      <TD colspan="2">${dto.content }</TD>
    </TR>
 	<TR>
      <th>메일</th>
      <TD colspan="2">${dto.mail}</TD>
    </TR>

    <TR>
      <TH>등록일</TH>
<%--       <TD>${dto.regdate }</TD> --%>
      <TD>${fn:substring(dto.regdate,0,16)}</TD>
      
    </TR>
    
     <TR>
      <TH>파일</TH>
      <td><a href="${pageContext.request.contextPath }/download?dir=/storage/onebyone&filename=${dto.filename}">${dto.filename}</a></td>
    </TR>
	<tr>
	<th>조회수</th>
	<td>${dto.viewcnt}</td>
	</tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='등록' onclick="location.href='./create'">
 
    <input type='button' value='목록' onclick="listB()">
    
<!--     로그인 상태일 경우만 수정 삭제 버튼 보여주고 기능구현 만들기 
    Object getAttribute(String name)  사용
	예 : Object data = session.getAttribute("test");
	String dato00 = (String) data; -->
 <%--   <%  if(${sessionScope.id} == "")
   {
    
    }
    %> --%>
 <%-- <%  
 
  String log= (String)session.getAttribute("id");
 %> --%>
<%--    	<c:if test="${dto.id == log}"> --%>



   	<c:if test="${sessionScope.memberID == dto.id}">
   		 <input type='button' value='수정' onclick="updateB()">
   	
   	</c:if>
   	<c:if test="${sessionScope.companyID == dto.id}">
   		 <input type='button' value='수정' onclick="updateB()">
   	
   	</c:if>
    <c:if test="${sessionScope.grade == 'A'}">
   		 <input type='button' value='수정' onclick="updateB()">   	
   		<input type='button' value='삭제' onclick="deleteB()">
   	</c:if>
   
<!--     <input type='button' value='수정' onclick="updateB()"> -->
<!--    	<input type='button' value='삭제' onclick="deleteB()"> -->

    
<%--    	<c:if test="${sessionScope == not null}"> --%> 
    <input type='button' value='답변' onclick="replyB()">
<%--     </c:if> --%>
 
    <input type='button' value='다운로드'  
           onclick="location.href='${pageContext.request.contextPath }/download?dir=/storage/onebyone&filename=${dto.filename}'">
 
  </DIV>

</body>
</html>


