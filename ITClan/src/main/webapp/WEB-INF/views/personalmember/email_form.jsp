<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Email 중복 확인</title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body style="margin:  0 auto">

 
<DIV class="title2">Email 중복 확인</DIV>
 <div class="content">
<FORM name='frm' method='POST' action='./email_proc'>
Email를 입력해주세요 <br><br>
  <TABLE style="width:30%;margin: 0 auto ">
    <TR>
      <TH>Email</TH>
      <TD><input type="email" name = "email" ></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='중복확인' class="btu">
    <input type='button' value='취소' onclick="window.close()" class="btu">
  </DIV>
</FORM>
 </div>

</body>
<!-- *********************************************** -->
</html> 