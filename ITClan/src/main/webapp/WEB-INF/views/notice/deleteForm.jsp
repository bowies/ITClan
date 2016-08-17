<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>  
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="content">삭제
 삭제하면 복구할 수 없습니다.<br><br>
 </DIV>
<FORM name='frm' method='POST' action='./delete'>
<input type="hidden" name="noticeNum" value=${param.noticeNum}>
<input type="hidden" name="col" value=${param.col}>
<input type="hidden" name="word" value=${param.word}>
<input type="hidden" name="nowPage" value=${param.nowPage}>
  <TABLE class='table'> 
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='전송' onclick="location.href='list'">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 </DIV>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 