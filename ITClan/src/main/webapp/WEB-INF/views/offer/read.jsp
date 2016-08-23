<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="./css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">

function listB(){
var url ="./list";
url = url + "?nowPage=${param.nowPage}";
url = url + "&col=${param.col}";
url = url + "&word=${param.word}";
 
location.href=url; 
}

function updateB(offerNum){
var url ="./update";
url = url + "?nowPage=${param.nowPage}";
url = url + "&col=${param.col}";
url = url + "&word=${param.word}";
url = url + "&offerNum="+offerNum;
 
location.href=url; 
}

function deleteB(offerNum){
var url="./delete";
url = url + "?nowPage=${param.nowPage}";
url = url + "&col=${param.col}";
url = url + "&word=${param.word}";
url = url + "&offerNum="+offerNum;
 
location.href=url;
}
 
function applyB(offerNum,memberID){
	
	
	var url="../applycompany/create";
	url = url + "?nowPage=${param.nowPage}";
// 	url = url + "&col=${param.col}";
// 	url = url + "&word=${param.word}";
	url = url + "&offerNum="+offerNum;
	url = url + "&memberID="+memberID;

	wr = window.open(url,"지원하기","width=600,height=800"); 
	wr.moveTo((window.screen.width-600)/2, (window.screen.height-800)/2);
} 

function applylistB(offerNum){
	var url="../a_company/list";
	url = url + "?offerNum="+offerNum;
	 
	location.href=url;
} 
</script>
 
</head> 
 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
 
<DIV class="title">채용공고 보기</DIV>
 
<TABLE class='table' width="50%">

   <TR>
     <TH>채용제목</TH>
     <TD>${dto.title}</TD>
   </TR>
   <TR>
     <TH>조회수</TH>
     <TD>${dto.viewCnt}</TD>
   </TR>
   <TR>
     <TH>작성자</TH>
     <TD>${dto.companyID}</TD>
   </TR>
   <TR>
     <TH>회사이름</TH>
     <TD>${dto.companyName}</TD>
   </TR>
   <TR>
     <TH>채용마감일</TH>
     <TD>${dto.offerDate}</TD>
   </TR>
   <TR>
     <TH>지원자격</TH>
     <TD>${dto.qualification}</TD>
   </TR>
   <TR>
     <TH>채용분야</TH>
     <TD>${dto.employmentSector}</TD>
   </TR>
   <TR>
     <TH>근무지역</TH>
     <TD>${dto.workingArea}</TD>
   </TR>
   <TR>
     <TH>급여</TH>
     <TD>${dto.salary}</TD>
   </TR>
   <TR>
     <TH>모집인원</TH>
     <TD>${dto.recruitment}</TD>
   </TR>
   <TR>
     <TH>주요업무</TH>
     <TD>${dto.task}</TD>
   </TR>
   <TR>
     <TH>채용상세</TH>
     <TD>${dto.detail}</TD>
   </TR>
</TABLE>
  
<DIV class='bottom'>
  <input type='button' value='목록' onclick="listB()">
  <input type='button' value='수정' onclick="updateB('${dto.offerNum}')">
  <input type='button' value='삭제' onclick="deleteB('${dto.offerNum}')">
<br>
  <input type='button' value='지원하기' onclick="applyB('${dto.offerNum}','${sessionScope.memberID }')">
  <input type='button' value='지원자목록보기' onclick="applylistB('${dto.offerNum}')">
</DIV>
</body>
<!-- *********************************************** -->
</html> 