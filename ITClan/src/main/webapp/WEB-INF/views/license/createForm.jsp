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
<input type="hidden" name="memberID" value="${memberID }">
<div>
<label>자격증
<input type="text" name="qualification">
</label>
</div>
<div>
<label>날짜
<input type="text" name="takeDate">
</label>
</div>
<input type="submit" value="전송" onclick="window.close();">
</form>
</body>
</html>