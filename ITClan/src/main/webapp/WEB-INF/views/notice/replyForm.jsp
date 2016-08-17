<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
  
<DIV class="title">답변</DIV>
 
<FORM name='frm' method='POST' action='reply'>
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
<input type="hidden" name="noticeNum" value="${dto.noticeNum}">
  <TABLE class='table'>
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size='40' value="${dto.title}"></TD>
    </TR>
    <TR>
      <TD colspan="2"><textarea name="content" rows='10' cols='40'  maxlength="1333"></textarea></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='전송' onclick="location.href='list'">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 