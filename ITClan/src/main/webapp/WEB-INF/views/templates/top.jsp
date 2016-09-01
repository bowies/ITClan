<%@ page contentType="text/html; charset=UTF-8" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 
<html>
<head>
<style type="text/css">

.topbody{
width:1000px; 
margin: 0 auto;


}

#top {

height:30px;
opacity:0.8;
margin: 0 auto;
border-bottom: 2px solid #83532F;
}

#top2{

height: 80px;
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

.topgra{
height: 15px;
margin-bottom: 50px;
background: -webkit-linear-gradient(top, rgba(131,83,47,1) 0%,rgba(131,84,49,1) 1%,rgba(127,148,165,0) 64%,rgba(125,185,232,0) 100%);


}
</style>
</head>
<body class="topbody">
<!-- 상단 메뉴 -->
<div id="top">
    
    <ul id="menu">
    
         
  	  
    <c:choose>


    <c:when test="${empty sessionScope.grade}">
    
     <li><a href="${pageContext.request.contextPath}/members/login">로그인</a></li>
     <li><a href="${pageContext.request.contextPath}/members/agree">회원가입</a></li>
     <li><a href="${pageContext.request.contextPath}/qna/custom">고객지원</a></li>
          
	</c:when>
     <c:otherwise>
     <c:choose>
     <c:when test="${sessionScope.grade =='C'}">
     <li><a href="${pageContext.request.contextPath}/companymember/logout">로그아웃</a></li>
     <li><a href="${pageContext.request.contextPath}/companymember/read">나의정보</a></li>
     <li><a href="${pageContext.request.contextPath}/companyinfo/read?companyID=${sessionScope.companyID}">회사정보</a></li>
     </c:when>
     <c:otherwise>
      <c:choose>
      <c:when test="${sessionScope.grade=='P'}">
     <li><a href="${pageContext.request.contextPath}/personal/logout">로그아웃</a></li>
     <li><a href="${pageContext.request.contextPath}/personal/read">나의정보</a></li>     
      </c:when>
      <c:otherwise>
     <li id="Admin"><a href="${pageContext.request.contextPath}/admin/list_personal">개인회원목록</a></li>
     <li id="Admin"><a href="${pageContext.request.contextPath}/admin/list_company">기업회원목록</a></li>
     <li id="Admin"><a href="${pageContext.request.contextPath}/companyinfo/list">회사정보목록</a></li>
      <c:choose>
      <c:when test="${empty sessionScope.memberID }">
       <li id="Admin"><a href="${pageContext.request.contextPath}/companymember/logout">로그아웃</a></li>
      </c:when>
      <c:otherwise>
      <li id="Admin"><a href="${pageContext.request.contextPath}/personal/logout">로그아웃</a></li>
      </c:otherwise>
      </c:choose>
     
      </c:otherwise>
      </c:choose>
     </c:otherwise>
     </c:choose>
     
     </c:otherwise>
     </c:choose>

 
    </ul>
    
</div>
<div id="top2">
	<div id="logo">
	<a href="${pageContext.request.contextPath}/">
	<img src="${pageContext.request.contextPath}/image/sample.png">
	</a>
	</div>
	
	
	<div id="search"> search
	
	
	</div>
 


</div>
<div class="topgra">


</div>


</body>
