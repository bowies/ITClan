<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css"> 
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
</script>
</head>
<body>
<DIV class="title">수정</DIV>
 
<FORM name='frm' method='POST' action='update'>
<input type="hidden" name="qnANum" value="${dto.qnANum }">
<input type="hidden" name="col" value="${param.col }">
<input type="hidden" name="word" value="${param.word }">
<input type="hidden" name="nowPage" value="${param.nowPage }">
  <TABLE class='table'>
    <TR>
      <TH>성명</TH>
      <TD>${dto.name}</TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="80" value="${dto.title}"></TD>
    </TR>
    <TR>
      <th>내용</th>
      <TD colspan="2"><textarea name="content" rows="20" cols="90">${dto.content}</textarea></TD>
    </TR>

  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 

</body>
</html>