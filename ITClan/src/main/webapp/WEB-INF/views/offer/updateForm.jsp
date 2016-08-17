<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="./css/style.css" rel="Stylesheet" type="text/css">

</head> 
 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
 
<DIV class="title">수정페이지</DIV>
 
<FORM name='frm' method='POST' action='./update'>
  <input type="hidden" name="offerNum" value="${dto.offerNum}">
  <input type="hidden" name="nowPage" value="${param.nowPage}">
  <input type="hidden" name="col" value="${param.col}">
  <input type="hidden" name="word" value="${param.word}">
  
    <TABLE class='table'>
    <TR>
      <TH>작성자</TH>
      <TD>${dto.companyID}</TD>
    </TR>
    <TR>
      <TH>회사이름</TH>
      <TD>${dto.companyName}</TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="30" value="${dto.title}"></TD>
    </TR>
    <TR>
      <TH>채용마감일</TH>
      <TD><input type="text" name="offerDate" size="30" value="${dto.offerDate}"></TD>
    </TR>
    <TR>
  	  <TH>지원자격</TH>
      <TD><input type="text" name="qualification" size="30" value="${dto.qualification}"></TD>
    </TR>
    <TR>
      <TH>채용분야</TH>
      <TD><input type="text" name="employmentSector" size="30" value="${dto.employmentSector}"></TD>
    </TR>
    <TR>
      <TH>근무지역</TH>
      <TD><input type="text" name="workingArea" size="30" value="${dto.workingArea}"></TD>
    </TR>
    <TR>
      <TH>급여</TH>
      <TD><input type="text" name="salary" size="30" value="${dto.salary}"></TD>
    </TR>
    <TR>
      <TH>모집인원</TH>
      <TD><input type="text" name="recruitment" size="30" value="${dto.recruitment}"></TD>
    </TR>
    <TR>
      <TH>주요업무</TH>
      <TD><textarea cols="32" rows="5" name="task" >${dto.task}</textarea></TD>
    </TR>
    <TR>
      <TH>채용상세</TH>
      <TD><textarea cols="32" rows="10" name="detail">${dto.detail}</textarea></TD>
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