<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function input(f) {
	if(f.passwd.value==""){
		alert("password를 입력하세요");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("repassword를 확인해 주세요");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value != f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요");
		f.repasswd.value="";
		f.repasswd.focus();
		return false;
	}
}

</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 16px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">Password 변경</DIV>
 
<FORM name='frm'
	  method='POST'
	  action='./updatePw'
	  onsubmit="return input(this)">
<input type="hidden" name="memberID" value="${param.memberID}">
  <TABLE class='table'>
    <TR>
      <TH>패스워드</TH>
      <TD><input type="password" name="passwd" size="15" value=""></TD>
      <TD>password를 적어주세요</TD>
    </TR>
       <TR>
      <TH>패스워드 확인</TH>
      <TD><input type="password" name="repasswd" size="15" value=""></TD>
      <TD>password를 확인합니다.</TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type="submit" value="패스워드 수정">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 

</body>
<!-- *********************************************** -->
</html> 