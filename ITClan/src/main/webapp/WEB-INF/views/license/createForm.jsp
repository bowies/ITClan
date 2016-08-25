<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function input(f) {
	if(f.qualification.value==""){
		alert("자격증 입력해주세요");
	return false;
	}
	
	if(f.takeDate.value==""){
		alert("날짜를 입력해주세요");
	return false;
	}
}
</script>
</head>
<body>
<form action="./create" method="post" onsubmit="return input(this)">
<div id="one">
<input type="hidden" name="memberID" value="${memberID }">
<div>
<label>자격증
<input type="text" name="qualification">
</label>
</div>
<div>
<label>날짜
<input type="date" name="takeDate">
</label>
</div>
</div>
<input type="submit" value="전송">
</form>
</body>
</html>