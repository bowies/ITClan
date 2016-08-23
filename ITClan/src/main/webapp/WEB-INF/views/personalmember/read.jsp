<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>member 정보</title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 16px; 
}
.title{
font-size : 30px;
	width : 400px;
	height : 30px;
	margin: 20px auto ;
	padding-left: 15px;
}
.bottom{
	width : 400px;
	height : 30px;
	margin: 10px auto ;
	padding-left: 15px;
}
table tr th{
	background-color : #DAD9FF;
	height: 44px;
}
table tr td{
	padding-left : 10px;
	height: 44px;
	
}

</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function deleteM(memberID){
if(confirm("정말탈퇴 하겠습니까?")){
	var passwd = prompt("비밀번호를 입력하세요","");
var url = "./deletePwC";
url += "?memberID="+memberID
		url+= "&passwd="+passwd;
location.href=url;
 
}
 
}

function update(memberID) {
	var passwd = prompt("비밀번호를 입력하세요","");
	var url = "./updatePassC";
	url += "?memberID="+memberID;
	url += "&passwd="+passwd;
	location.href=url;
	
}
function updatepw(memberID) {
	var passwd = prompt("비밀번호를 입력하세요","");
	var url = "./updatepwC";
	url += "?memberID="+memberID;
	url += "&passwd="+passwd;
	location.href=url;
	
}

</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">${dto.name }의 회원정보</DIV>
 
  <TABLE class='table' style="margin: auto;width: 640px;border: 1px solid;border-collapse: collapse;">
    <TR>
      <TH>아이디</TH>
      <TD>${dto.memberID }</TD>
    </TR>
    <tr> 
      <th>이름</th> 
      <td>${dto.name }</td> 
    </tr> 
    <tr> 
      <th>생년월일</th> 
      <td>${dto.birth }</td> 
    </tr>                 
    <tr> 
      <th>전화번호</th> 
      <td>${dto.phone }</td> 
    </tr>        
    <tr>  
      <th>이메일</th> 
      <td>${dto.email }</td> 
    </tr> 
  
    <tr>  
      <th>주소</th> 
      <td> 
        ${dto.address } <br> 
        ${dto.address2 }
      </td> 
    </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick="update('${dto.memberID}')">
    <input type='button' value='탈퇴' onclick="deleteM('${dto.memberID}')">
    <input type='button' value='비번수정' onclick="updatepw('${dto.memberID}')">
  </DIV>
 
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>