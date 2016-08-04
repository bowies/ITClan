<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./create" method="post">
<input type="text" name="memberID" value="${memberID }">
<div>
<label>활동구분
<input type="text" name="actSector">
</label>
</div>
<div>
<label>활동기간
<input type="text" name="actPeriod">
</label>
</div>
<div>
<label>활동내용
<input type="text" name="actContent">
</label>
</div>
<input type="submit" value="전송">
</form>
</body>
</html>