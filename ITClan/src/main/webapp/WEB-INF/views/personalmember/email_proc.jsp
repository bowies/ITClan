<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>회원가입</title> 

<script type="text/javascript">
function use() {
	opener.frm.email.value='${email}'
	self.close();
}
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body style="margin:  0 auto">

 
<DIV class="title2">Email 중복확인</DIV>
 <div class="content">
 입력된 아이디 :${email }<br><br>
 <c:choose>
 <c:when test="${cnt ==1 }">
 중복되어 사용할수 없습니다.<br><br>
 </c:when>
 <c:otherwise>
 중복이 아닙니다♥ 사용가능합니다.<br><br>
 <input type="button" value="사용" onclick="use()" class="btu">
 </c:otherwise>
 </c:choose>

 </div>
    <div class="bottom">
    <input type="button" value="다시시도" onclick="location.href='email_form'" class="btu">
    <input type="button" value="닫기" onclick="window.close();" class="btu">
    </div>
 

</body>
<!-- *********************************************** -->
</html> 