<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function deleteI(code){
	var url = "./delete";
	url += "?categoryCode=" + code;
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
 
<FORM name='frm' 
      method='POST' 
      action=''>
      
  <TABLE class='table'>
    <TR>
      <TH>분류코드</TH>
      <TD>${dto.categoryCode}</TD>
    </TR>
    <TR>
      <TH>분류명</TH>
      <TD>${dto.categoryName}</TD>
    </TR>

  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' onclick="deleteI('${dto.categoryCode}');" value='삭제'>
    <input type='reset' value='취소'>
  </DIV>
  
  </FORM>
  
 </body>
<!-- *********************************************** -->
</html> 