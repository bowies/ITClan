<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="title"> 삭제 </div>
<div class="content">삭제하면 복구할수 없습니다.
<FORM name='frm' method='POST' action='./delete'>
<input type="hidden" name = "qnANum" value="${param.qnANum }">
<input type="hidden" name = "col" value="${param.col }">
<input type="hidden" name = "word" value="${param.word }">
<input type="hidden" name = "nowPage" value="${param.nowPage }">
<table style="width: 50%">


</table>
  
  <DIV class='bottom'>
    <input type='submit' value='전송'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>

</div>

</body>
</html>
