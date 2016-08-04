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
function input(f){
	if(f.subject.value==''){
	alert("제목을 입력하세요");
	f.subject.focus();
	return false;
	}

}
</script>
</head> 
 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' 
      method='POST'
      enctype="multipart/form-data"
      action='./update' onsubmit="return input(this)">
  <input type="hidden" name="num" value="${dto.num}">
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}">
  <input type="hidden" name="oldfile" value="${dto.filename}">
  
    <TABLE class='table'>
    <TR>
      <TH>작성자</TH>
      <TD><input type="text" name="companyid" value="${dto.companyid}"></TD>
    </TR>
    <TR>
      <TH>회사이름</TH>
      <TD><input type="text" name="companyname" value="${dto.companyname}"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="30" value="${dto.title}"></TD>
    </TR>
    <TR>
      <TH>채용마감일</TH>
      <TD><input type="text" name="offerdate" value="${dto.offerdate}"></TD>
    </TR>
    <TR>
  	  <TH>지원자격</TH>
      <TD><input type="text" name="qualification" value="${dto.qualification}"></TD>
    </TR>
    <TR>
      <TH>채용분야</TH>
      <TD><input type="text" name="employmentSector" value="${dto.employmentSector}"></TD>
    </TR>
    <TR>
      <TH>근무지역</TH>
      <TD><input type="text" name="workingArea" value="${dto.workingArea}"></TD>
    </TR>
    <TR>
      <TH>급여</TH>
      <TD><input type="text" name="salary" value="${dto.salary}"></TD>
    </TR>
    <TR>
      <TH>모집인원</TH>
      <TD><input type="text" name="recruitment" value="${dto.recruitment}"></TD>
    </TR>
    <TR>
      <TH>주요업무</TH>
      <TD><input type="text" name="task" value="${dto.task}"></TD>
    </TR>
    <TR>
      <TH>채용상세</TH>
      <TD><textarea cols="30" rows="10" name="detail"></textarea></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='목록' onclick="location.href='./list'">
  </DIV>
</FORM>
</body>
<!-- *********************************************** -->
</html> 
 