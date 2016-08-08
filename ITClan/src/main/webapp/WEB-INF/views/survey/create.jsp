<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	width: 60%;
	margin: auto;
}
</style>
</head>
<body>
<form action="./create" method="post">
<table>
<tr>
<th>title</th><td><input type="text" name="title"></td>
</tr>
<tr>
<th>endDate</th><td><input type="date" name="enddate"></td>
</tr>
<tr>
<th>content1</th><td><input type="text" name="content1"></td>
</tr>
<tr>
<th>content2</th><td><input type="text" name="content2"></td>
</tr>
<tr>
<th>content3</th><td><input type="text" name="content3"></td>
</tr>
<tr>
<th>content4</th><td><input type="text" name="content4"></td>
</tr>
</table>
<div style="width: 50%; margin: auto;"> <input type="submit" value="input"></div>
</form>
</body>
</html>