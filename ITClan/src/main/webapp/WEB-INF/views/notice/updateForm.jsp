<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>  
 <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content'); 
  };
 </script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">수정</DIV> 
 
<FORM name='frm' method='POST' action='update'>
<input type="hidden" name="noticeNum" value=${dto.noticeNum}>
<input type="hidden" name="col" value=${param.col}>
<input type="hidden" name="word" value=${param.word}>
<input type="hidden" name="nowPage" value=${param.nowPage}>
  <TABLE class='table'>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size='40' value="${dto.title}"></TD>
    </TR>
    <TR>
      <TD colspan="2"><textarea name="content" rows='10' cols='40' placeholder="content" maxlength="">${dto.content}</textarea></TD>
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