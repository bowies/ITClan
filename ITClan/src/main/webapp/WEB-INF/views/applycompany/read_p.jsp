<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 


<script type="text/javascript">
function listB() {
	var url = "list_personal";
	url += "?nowPage=${param.nowPage}";
	
	location.href=url;
	
}
</script>
<style type="text/css"> 
.table{
	border: 1px solid;
	border-collapse: collapse;
}
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
 
  <TABLE class="table" style=" margin: auto;" >
    <TR>
       <TD colspan="4" style="text-align: center; font-size: 16px; font-family: sans-serif;">${odto.title}</TD>
    </TR>
    <TR>
      <TH>회사명</TH>
      <TD>${odto.companyName }</TD>
      <th>모집인원</th>
      <td>${odto.recruitment }</td>
    </TR>
    <TR>
      <TH colspan="2">작성자</TH>
      <TD colspan="2">${pmdto.name }</TD>
    </TR>
    <TR>
    <th> 자기소개서</th>
      <TD height="50px;">
      <a href="${pageContext.request.contextPath }/download?dir=/storage/resume&filename=${redto.resumeName }">
      ${redto.resumeName }</a></TD>
    <th>포트폴리오</th>
      <TD height="50px;">
      <a href="${pageContext.request.contextPath }/download?dir=/storage/portfolio&filename=${pfdto.portfolioName }">
      ${pfdto.portfolioName }
      </a>
      </TD>
    </TR>
  </TABLE>
  
  <DIV align="center" style="margin-top: 20px;">

    <input type='button' value='목록' onclick="listB()">

  </DIV>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 