<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="./css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function input(){
	var f = document.frm;
	if(f.name.value==''){
		alert("이름을 입력하세요");
		f.name.focus();
		return;
	}
	if(f.subject.value==''){
		alert("제목을 입력하세요");
		f.subject.focus();
		return;
	}
	if(f.content.value==''){
		alert("내용을 입력하세요");
		f.content.focus();
		return;
	}
	if(f.passwd.value==''){
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		return;
	}
	
	f.submit();
	
}
</script>

</head> 
 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
 
<DIV class="title">글쓰기</DIV>
 
<FORM name='frm' 
 method='POST' 
 enctype="multipart/form-data" 
 action='./create'>
  <TABLE class='table'>
    <TR>
      <TH>글쓴이</TH>
      <TD><input type="text" name="name"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="subject" size="30"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea cols="30" rows="10" name="content"></textarea></TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="filenameMF"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='등록' onclick="input()">
    <input type='button' value='목록' onclick="location.href='./list'">
  </DIV>
</FORM>
 
 
</body>
<!-- *********************************************** -->
</html> 