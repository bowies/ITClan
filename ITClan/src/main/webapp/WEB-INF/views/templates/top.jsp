<%@ page contentType="text/html; charset=UTF-8" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 
<html>
<head>
<style type="text/css">

body{
width:1000px; 
margin: 0 auto;

}

#top {

height:30px;
opacity:0.8;
margin: 0 auto;

}

#top2{

height: 100px;
margin: 0 auto;
position: relative;


}

#top2 #logo{
width:198px; height: 44px;

position: absolute;
top:20px;
left:50px;

}

#top2 #search{
    clear: both;
    width: 300px;
      height: 33px;
    border: 2px solid #866538;
position: absolute;
top:20px;
left:350px;
}

ul#menu li{
display : inline;
}


ul#menu li a{
color:black;
float: right;
text-decoration:none;
margin-left: 10px;


}

li#admin{
float:right;
padding-right:10px
} 
</style>
</head>
<body>
<!-- 상단 메뉴 -->
<div id="top">
    <ul id="menu">
    
     <li><a style="float: left;"  href="${pageContext.request.contextPath}/">홈</a></li>    
    
    <c:choose>
    <c:when test="${empty sessionScope.companyID}">
     <li><a href="${pageContext.request.contextPath}/companymember/login">기업회원로그인</a></li>
     <li><a href="${pageContext.request.contextPath}/companymember/agree">회원가입</a></li>
     
	</c:when>
     <c:otherwise>
     <li><a href="${pageContext.request.contextPath}/companymember/logout">로그아웃</a></li>
     <li><a href="${pageContext.request.contextPath}/companymember/read">나의정보</a></li>
     <li><a href="${pageContext.request.contextPath}/companymember/update">회원수정</a><li>
     <li><a href="${pageContext.request.contextPath}/companymember/delete">회원탈퇴</a><li>     
     </c:otherwise>
     </c:choose>
        
     
     
     <c:if test="${not empty sessionScope.companyId and sessionScope.grade == 'A'}">
     <li id="Admin"><a href="${pageContext.request.contextPath}/companymember/list">회원목록</a></li>
	</c:if>
 
    </ul>
    
</div>
<div id="top2">
	<div id="logo"><img src="${pageContext.request.contextPath}/image/sample.png">
	
	</div>
	
	
	<div id="search"> search
	
	
	</div>
 


</div>

</body>
