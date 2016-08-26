<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<form action="./delete" method="post">
<input type="hidden" name="portfolioNum" value="${portfolioNum }">
<div style="margin: auto; text-align: center;">
삭제하시겠습니까?
</div><br>
<div style="margin: auto; text-align: center;">
<input type="submit" value="삭제">
<input style="margin-right: 10px;" type="button" value="취소" onclick="window.close(this)">
</div>
</form>
</body>
</html>