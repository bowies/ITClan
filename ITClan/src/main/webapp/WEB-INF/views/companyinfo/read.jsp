<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function deleteM(companyID){
if(confirm("정말 삭제 하겠습니까?")){
	var url = "delete";
	url = url +"?companyID="+companyID;
	 
	location.href=url;
 
}
 
}
</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
 
<DIV class="title">${dto.companyID}의 회원정보</DIV>
 
  <TABLE class='table'>
    <TR>
      <TD colspan="2">
       <img style="width: 50%"  src="../storage/${dto.ci}">
      </TD>
    </TR>
    <TR>
      <TH>아이디</TH>
      <TD>${dto.companyID}</TD>
    </TR>
    <tr> 
      <th>회사명</th> 
      <td>${dto.companyName}</td> 
    </tr> 
    <tr> 
      <th>기업형태</th> 
      <td>${dto.companyScale}</td> 
    </tr>           
    <tr>  
      <th>대표자명</th> 
      <td>${dto.bossName}</td> 
    </tr> 
    <tr> 
      <th>사업자번호</th> 
      <td>${dto.companyNumber}</td> 
    </tr>           
    <tr>  
      <th>분류코드</th> 
      <td>${dto.categoryCode}</td> 
    </tr> 

  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick="location.href='update?companyID=${dto.companyID}'">
    <input type='button' value='정보삭제' onclick="deleteM('${dto.companyID}')">
   
  </DIV>
 </body>
<!-- *********************************************** -->
</html> 