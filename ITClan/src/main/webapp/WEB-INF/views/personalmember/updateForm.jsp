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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript"> 
  // 입력 값 검사후 서버로 전송 
  function inputCheck(){ 
    var f = document.frm; // <FORM>태그 객체 
 
 
    if(f.name.value == ""){ 
      alert("이름을 입력해 주세요."); 
      f.name.focus(); 
      return false; 
    } 
    if(f.phone.value == ""){ 
      alert("phone을 입력해 주세요."); 
      f.phone.focus(); 
      return false; 
    } 
    if(f.address.value == ""){ 
      alert("address을 입력해 주세요."); 
      f.address.focus(); 
      return false; 
    } 
    if(f.address2.value == ""){ 
      alert("상세주소을 입력해 주세요."); 
      f.address2.focus(); 
      return false; 
    } 


  
	f.submit;
  } 
 
</script> 
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<DIV class="title">회원 수정 (* 필수 입력)</DIV>
 
<FORM name='frm' 
      method='POST' 
      action='./update'
      onsubmit="return inputCheck()">
      <input type="hidden" name="memberID" value="${dto.memberID }">
  <TABLE class='table' width="80%">
     <tr>  
       <th>*아이디</th> 
       <td> 
          ${dto.memberID }
        </td> 
       <td>아이디입니다.</td> 
     </tr> 
     <tr>  
       <th>*이름</th> 
       <td><input type="text" name="name" value="${dto.name }"> </td> 
       <td>고객실명을 입니다.</td> 
     </tr> 
     <tr>  
       <th>전화번호</th> 
       <td><input type="text" name="phone" value="${dto.phone }"></td> 
       <td> </td> 
     </tr>           
       
     <tr>   
       <th>주소</th> 
       <td> 
       <input type="text" name="address" size="45" value="${dto.address }"><br/> 
       <input type="text" name="address2" size="45" value="${dto.address2 }"> 
       </td> 
       <td>주소를 적어 주세요.</td> 
     </tr> 
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='회원수정'>
    <input type='reset' value='취소'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
 