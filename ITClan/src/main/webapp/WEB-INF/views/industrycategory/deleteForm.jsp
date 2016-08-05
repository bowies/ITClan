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
 
<FORM name='frm' method='POST' action='./delete'>
<input type="hidden" name="categoryCode" value="${param.categoryCode}">
  <div class="content">
	삭제하세용
  </div>
  <DIV class='bottom'>
    <input type='submit' value='삭제'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 