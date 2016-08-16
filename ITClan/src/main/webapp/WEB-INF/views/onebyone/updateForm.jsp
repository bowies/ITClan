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
<script type="text/javascript">
function input(frm){ //f 는 form
	var filename = frm.filename.value;
	if(frm.wname.value == ""){
		alert("이름을 입력하세요"); //경고창
		frm.name.focus();//focus가 name으로 간다.
		return false;
	}
	if(frm.title.value == ""){
		alert("제목을 입력하세요"); //경고창
		frm.title.focus();//focus가 name으로 간다.
		return false;
	}
	if(frm.content.value == ""){
		alert("내용을 입력하세요"); //경고창
		frm.content.focus();//focus가 name으로 간다.
		return false;
	}


	
}
    </script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">수정</DIV>
 
<FORM method='POST'
	  action='update'
	  onsubmit="return input(this)"
	  enctype="multipart/form-data">
<input type="hidden" name="oneByOneNum" value="${param.oneByOneNum }">
<input type="hidden" name="oldfile" value="${param.oldfile }">
<input type="hidden" name="col" value="${param.col }">
<input type="hidden" name="word" value="${param.word }">
<input type="hidden" name="nowPage" value="${param.nowPage }">
  <TABLE class='table'>
    <TR>
      <TH>성명</TH>
      
<%--       <TD><input type="text" name="name" value="${sessionScope.name }"></TD> --%>
      <TD><input type="text" name="name" value="<%=session.getAttribute("name") %>"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" size="40" value="${dto.title }"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea name="content" rows="10" cols="40">${dto.content }</textarea></TD>
    </TR>
     <TR>
      <TH>원본파일</TH>
      <TD>
      <img src="../storage/img/${param.oldfile }" width="150px">
      원본파일명:${param.oldfile }
      </TD>
    </TR>
    <TR>
      <TH>변경파일</TH>
      <TD>
      <input type="file" name="filenameMF">
      </TD>
    </TR>
 
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 