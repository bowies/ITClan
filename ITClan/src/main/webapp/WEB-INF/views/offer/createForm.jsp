<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

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
	
	f.submit();
	
}
</script>

</head> 
 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
 
<DIV class="title">채용공고 등록</DIV>
 
<FORM name='frm' method='POST' action='./create'>
  <TABLE class='table'>
    <TR>
      <TH>작성자</TH>
      <TD><input type="text" name="companyID"></TD>
    </TR>
    <TR>
      <TH>회사이름</TH>
      <TD><input type="text" name="companyName" size="30"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="30"></TD>
    </TR>
    <TR>
      <TH>채용마감일</TH>
      <TD><input type="text" name="offerDate" size="30"></TD>
    </TR>
    <TR>
  	  <TH>지원자격</TH>
      <TD><input type="text" name="qualification" size="30"></TD>
    </TR>
    <TR>
      <TH>채용분야</TH>
      <TD><input type="text" name="employmentSector" size="30"></TD>
    </TR>
    <TR>
      <TH>근무지역</TH>
      <TD><input type="text" name="workingArea" size="30"></TD>
    </TR>
    <TR>
      <TH>급여</TH>
      <TD><input type="text" name="salary" size="30"></TD>
    </TR>
    <TR>
      <TH>모집인원</TH>
      <TD><input type="text" name="recruitment" size="30"></TD>
    </TR>
    <TR>
      <TH>주요업무</TH>
      <TD><textarea cols="32" rows="5" name="task"></textarea></TD>
    </TR>
    <TR>
      <TH>채용상세</TH>
      <TD><textarea cols="32" rows="15" name="detail"></textarea></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='목록' onclick="location.href='./list'">
  </DIV>
</FORM>
 
</body>
<!-- *********************************************** -->
</html> 