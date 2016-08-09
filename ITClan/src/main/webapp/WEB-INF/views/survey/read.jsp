<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin: auto;
	width: 60%;
}
</style>
<script type="text/javascript">
function chE(memberID){
	if('${surID}'==memberID){
		alert("결과보기를 클릭하세요");
		return false;
	}
	
}
</script>
</head>
<body>

<form name="frm" action="./read" method="post" onsubmit="return chE('${sessionScope.memberID}')">
<input type="hidden" name="preNum" value="${param.preNum }">
<input type="hidden" name="col" value="${param.col }">
<input type="hidden" name="word" value="${param.word }">
<input type="hidden" name="nowPage" value="${param.nowPage }">
<table>
<tr>
<th>${dto.title}</th>
</tr>
<tr>
<td align="right">${fn:substring(dto.regdate,0,10)}~${dto.enddate}</td>
</tr>
<tr>
<td><input type="radio" name="str" value="ans1">${dto.content1 }</td>
</tr>
<tr>
<td><input type="radio" name="str" value="ans2">${dto.content2 }</td>
</tr>
<tr>
<td><input type="radio" name="str" value="ans3">${dto.content3 }</td>
</tr>
<tr>
<td><input type="radio" name="str" value="ans4">${dto.content4 }</td>
</tr>
</table>
<div style="margin: auto;">
<input type="submit" value="확인">
<input type="button" value="결과" name="last" onclick="./read?preNum=${param.preNum}">
</div>
</form> 



</body>
</html>