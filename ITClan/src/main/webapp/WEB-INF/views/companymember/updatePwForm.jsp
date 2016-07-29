<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">비밀번호 변경</DIV>
<FORM name='frm' 
      method='POST' 
	  action='./updatePw'
	  onsubmit="return input(this)">
 <input type="hidden" name='companyID' value='${param.companyID}'>
  <TABLE class='table'>
    <TR>
      <TH>*패스워드</TH>
      <TD><input type="password" name="passwd" size="15" value=""></TD>
      <TD>패스워드를 적어주세요.</TD>
    </TR>
       <TR>
      <TH>*패스워드 확인</TH>
      <TD><input type="password" name="repasswd" size="15" value=""></TD>
      <TD>패스워드를 확인합니다.</TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='패스워드 수정'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 