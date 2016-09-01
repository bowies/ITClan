<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>


<style>
.login{
margin: 0 auto;
position :relative;
width:400px;
margin-top:50px;
margin-bottom:10px;
background:url(../image/background.jpg) no-repeat;
border: 2px solid #b4b4b4;
border-radius: 7px;

}

.login h3{
padding: 10px 0 16px 12px;
margin-left: 75px;

}
.login.id, .login.pw{
 margin-left: 18px;
 
}

.login.id{
padding-bottom: 5px;
}
.login.id label{
padding-right: 11px;
}
.login #logid{
width:200px;
height: 18px;
border: 1px solid;
margin-left: 18px;
}

 .login #logpw {
width:200px;
height: 18px;
border: 1px solid;
margin-left: 2px;
}

.login label{
margin-top:4px;

}

.bottom input{
margin-left: 20px;
margin-bottom: 10px;

}

.id, .pw{
margin-left: 20px;

}

</style>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->

 
 
<FORM name='frm' method='POST' action='${pageContext.request.contextPath}/companymember/login'>
  <div class='login'>
    <h3><img src="/itclan/image/loginbutton.png" alt="로그인"/></h3>
    <p class="id">
      <label for="logid">로그인</label>
      <input type="text" name="companyID" autofocus value='${c_id_val}' id="logid">
       <c:choose>
       <c:when test="${c_id=='Y'}">
       <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장
       </c:when>
       <c:otherwise>
       <input type='checkbox' name='c_id' value='Y' > ID 저장 
       </c:otherwise>
       </c:choose>
     
    </p>
    <p class="pw">
    <label for="logpw">패스워드</label>
      <input type="password" name="passwd" id="logpw">
    </p>
    
    <DIV class='bottom'>
    <input type='submit' value='로그인'>
    
    <input type='button' value='ID찾기' onclick="location.href='./idFind'">
    <input type='button' value='Password찾기' onclick="location.href='./pwFind'">
    <input type='button' value='회원가입' onclick="location.href='./agree'">
  </DIV>
  </div>
  
  
</FORM>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 