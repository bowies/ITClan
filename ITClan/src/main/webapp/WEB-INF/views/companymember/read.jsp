<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function deleteM(companyID){
if(confirm("정말탈퇴 하겠습니까?")){
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
       <img style="width: 50%"  src="../storage/${dto.companyName}">
      </TD>
    </TR>
    <TR>
      <TH>아이디</TH>
      <TD>${dto.companyID}</TD>
    </TR>
    <tr> 
      <th>이름</th> 
      <td>${dto.name}</td> 
    </tr> 
    <tr> 
      <th>전화번호</th> 
      <td>${dto.phone}</td> 
    </tr>           
    <tr>  
      <th>이메일</th> 
      <td>${dto.email}</td> 
    </tr> 
    <tr> 
      <th>사업자번호</th> 
      <td>${dto.companyNumber}</td> 
    </tr>           
    <tr>  
      <th>사업자명</th> 
      <td>${dto.companyName}</td> 
    </tr> 

  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick="location.href='update?companyID=${dto.companyID}'">
    <input type='button' value='탈퇴' onclick="deleteM('${dto.companyID}')">
    <input type='button' value='비번변경' onclick="location.href='updatePw?companyID=${dto.companyID}'">
   
  </DIV>
 </body>
<!-- *********************************************** -->
</html> 