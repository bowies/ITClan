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

</head>
<body>
<table>
<tr>
<td style="background-color: #FAF4C0">Number</td>
<td style="background-color: #FAF4C0">Title</td>
<td style="background-color: #FAF4C0">viewCnt</td>
<td style="background-color: #FAF4C0">Date</td>
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
<td>${dto.title }</td>
<td>${dto.viewcnt }</td>
<td>${fn:substring(dto.regdate,0,10)}~${dto.enddate }</td>
</tr>
</c:forEach>
</c:otherwise>
</c:choose>
</table>
</body>
</html>