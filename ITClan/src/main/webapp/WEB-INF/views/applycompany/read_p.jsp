<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 


<script type="text/javascript">
function listB() {
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	
	location.href=url;
	
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
 
<DIV class="title">★ 조회</DIV>
 
  <TABLE class='table'>
    <TR>
      <th colspan="2">title</th>
      <TD colspan="2">${olist.title}</TD>
    </TR>
    <TR>
      <TH>회사명</TH>
      <TD>${olist.companyName }</TD>
      <th>모집인원</th>
      <td>${olist.recruitment }</td>
    </TR>
    <TR>
      <TH>작성자</TH>
      <TD>${dto.wname }</TD>
    </TR>
    <TR>
      <TD colspan="2">${dto.content }</TD>
    </TR>
    <TR>
      <TH>조회수</TH>
      <TD>${dto.viewcnt }</TD>
    </TR>
    <TR>
      <TH>등록일</TH>
      <TD>${dto.wdate }</TD>
    </TR>

  </TABLE>
  
  <DIV class='bottom'>

    <input type='button' value='목록' onclick="listB()">

  </DIV>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 