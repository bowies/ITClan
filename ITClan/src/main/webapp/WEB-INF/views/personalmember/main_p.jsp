<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table tr td {
	margin: 10px;
}

</style>

<script type="text/javascript">
function updatepic(memberID){
	var url = "./updatepic";
	url += "?memberID=" + memberID;
	url += "&oldfile=${picture}";
	location.href=url;
}
function create(memberID){
	var url = "../resumeInfo/create";
	url += "?memberID=" + memberID;
	location.href=url;
}
</script>
</head>
<body>

<table style="margin: auto;">
<tr>
<td rowspan="2">
<img src="${pageContext.request.contextPath}/storage/resumeInfo_img/${picture}" width="200px" height="200px"><br>
<input type="button" onclick="updatepic('${memberID}')" value="사진수정">

</td>
<td><a href="./read">나의정보</a></td>
<td>
<c:choose>
<c:when test="${cnt>0 }">
<a href="../resumeInfo/read">이력서</a>
</c:when>
<c:otherwise>
이력서 없음!!
<input type="button" onclick="create('${memberID}')" value="이력서 등록">
</c:otherwise>
</c:choose>
</td>
</tr>
<tr><td><a href="../applycompany/list_personal">지원한 회사들</a></td>
<td><a href="#">채용정보</a></td>
</tr>
</table>

</body>
</html>