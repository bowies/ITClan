<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 16px; 
} 
</style> 
 <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
  function input() {
	  var f= document.frm;
	  if(f.wname.value==""){
		  alert("작성자를 입력하시오")
		  f.wname.focus(); 
		  return false;
	  }
	  if(f.title.value==""){
		  alert("제목를 입력하시오")
		  f.title.focus(); 
		  return false;
	  }
	  if(f.content.value==""){
		  alert("내용을 입력하시오")
		  f.content.focus(); 
		  return false;
	  }
	  if(f.passwd.value==""){
		  alert("비밀번호를 입력하시오")
		  f.passwd.focus(); 
		  return false;
	  }
	  f.submit();
	
}
 </script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">등록</DIV>
 
<FORM name='frm' method='POST' action='create' onsubmit="return input()"">
  <TABLE class='table'>
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="40"></TD>
    </TR>
    <TR>
      <TD colspan="2"><textarea name="content"  rows="10" cols="40"></textarea></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 