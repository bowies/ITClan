<%@ page contentType="text/html; charset=UTF-8" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 
<html>
<head>
<style type="text/css">
ul#menu li{
display : inline;
}
ul#menu li a{
background-color: #3399ff;
color:white;
padding : 10px 20px;
text-decoration:none;
border-radius:10px 10px 0 0;
}
ul#menu li a:hover{
background-color: orange;
}
li#admin{
float:right;
padding-right: 30px
} 
</style>
</head>
<body>
<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table style="width: 100%">
  <tr>
    <td>
        <img src="${pageContext.request.contextPath}/images/images.jpg" width='100%' height='32%'>
    </td>
  </tr>
  
   <tr>
    <td>
    <ul id="menu">
    
     <li><a href="${pageContext.request.contextPath}/">홈</a></li>    
    
    <c:choose>
    <c:when test="${empty sessionScope.id}">
     <li><a href="${pageContext.request.contextPath}/companymember/idFind">ID찾기</a></li>
     <li><a href="${pageContext.request.contextPath}/companymember/pwFind">PW찾기</a></li>
     <li><a href="${pageContext.request.contextPath}/companymember/agreement">회원가입</a><li>
     <li><a href="${pageContext.request.contextPath}/companymember/pwFind">회원정보</a><li>
	</c:when>
     <c:otherwise>
     <li><a href="${pageContext.request.contextPath}/companymemberr/logout">로그아웃</a></li>
     <li><a href="${pageContext.request.contextPath}/companymember/read?companyID=${sessionScope.id}">나의정보</a></li>
     <li><a href="${pageContext.request.contextPath}/companymember/update?companyID=${sessionScope.id}">회원수정</a><li>
     <li><a href="${pageContext.request.contextPath}/companymember/updatePw?companyID=${sessionScope.id}">비밀번호수정</a><li>
     <li><a href="${pageContext.request.contextPath}/companymember/delete?companyID=${sessionScope.id}">회원탈퇴</a><li>     
     </c:otherwise>
     </c:choose>
     
     <c:if test="${not empty sessionScope.id and sessionScope.grade == 'A'}">
     <li id="Admin"><a href="${pageContext.request.contextPath}/companymember/list">회원목록</a></li>
	</c:if>
 
    </ul>
    </td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->
 
 
 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">