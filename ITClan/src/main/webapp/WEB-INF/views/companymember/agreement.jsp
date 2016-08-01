<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html>  
<head> 
<meta charset="utf-8"> 
<title>회원가입</title> 

<script language="javascript"> 
  // 자바스크립트는 리턴 타입이 없습니다. 
  function send(){ 
    // Checkbox 체크 검사 
    // 폼이름.input 태그의 주어진 이름.속성 
    if(document.frm.agree.checked == false){ 
      alert('회원 약관에 동의해야 회원 가입이 가능합니다.'); 
      return false; // 서브밋 중지 
    }else{ 
      return true;  // 서브밋 진행 
    } 
  } 
</script> 
<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
</head> 
 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<!-- *********************************************** -->
 
<br/> 
<!-- onsubmit 이벤트는 form이 submit이 될 때 발생함. 
    실행된 함수가 false를 리턴하면 submit을 하지 않음. 
 --> 
<form name="frm" method="post"  
      action="./create"  
      onsubmit="return send();"> 
 
<div class='title' style='width: 20%;'>약관동의</div> 
 
<table border="0" cellspacing="0" cellpadding="2"  align="center"> 
    <tr>  
        <td align="center"> 
            <textarea cols="100" rows="20">
            이 안에 내용을 넣어야지!
            </textarea> 
        </td> 
    </tr> 
</table> 
 
<div style="text-align: center"> 
  <label><input type="checkbox" name="agree" value="1" > 약관에 동의합니다</input></lable>
  <input type="submit" value="회원가입"></input>  
  <input type="button" value="취소" onclick="history.back();" /> 
</div> 
 
</form> 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>