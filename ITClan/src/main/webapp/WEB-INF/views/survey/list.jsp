<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	border-collapse : collapse
	border : 1px solid;
	margin : auto;
	width: 60%;
}
tr td{
	border: 1px solid;
	border-collapse: collapse;
}


</style>
<script type="text/javascript">
function read(preNum,sub,enddate){

	if('${sessionScope.memberID}'==""){
		alert("로그인을하세요");
		return false;
	}else{
		var url = "./read";
		url += "?preNum="+preNum;
		url += "&sub="+sub;
		url += "&nowPage=${nowPage}";
		url += "&col=${col}";
		url += "&word=${word}";
		location.href = url;
		
	}
	
	
}
function del(preNum){
	var url = "./delete";
	url += "?preNum="+preNum;
	location.href = url;
}
</script>
</head>
<body>
<div>
<FORM method="POST" action="./list">
<select name="col" >
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
</div>

<table>
<tr>
<td style="background-color: #FAF4C0">Number ${surID}</td>
<td style="background-color: #FAF4C0">Title</td>
<td style="background-color: #FAF4C0">viewCnt</td>
<td style="background-color: #FAF4C0">Date</td>
<c:if test="${sessionScope.grade == 'A'}">
<td style="background-color: #FAF4C0">delete</td>
</c:if>
</tr>
<c:choose>
<c:when test="${empty list}">
<tr>
<td colspan="4"> 내용이 없습니다.</td>
</tr>
</c:when>
<c:otherwise>
<c:forEach items="${list}" var="dto">
<tr>
<td>${dto.preNum }</td>
<td><a href="javascript:read('${dto.preNum}','${dto.sub }','${dto.enddate }')"> ${dto.title }</a></td>
<td>${dto.viewcnt }</td>
<td>${fn:substring(dto.regdate,0,10)}~${dto.enddate }</td>
<c:if test="${sessionScope.grade == 'A'}">
<td><a href="javascript:del('${dto.preNum}')">삭제</a></td>
</c:if>
</tr>
</c:forEach>
</c:otherwise>
</c:choose>
</table>

<DIV class="bottom"> 
${paging }
</DIV>

</body>
</html>