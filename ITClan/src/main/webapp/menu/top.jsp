<%@ page contentType="text/html; charset=UTF-8" %> 
 
<% String root = request.getContextPath(); 

 %>
 
<html>
<head>
<style type="text/css">
ul#menu li{
display : inline;
}
ul#menu li a{
background-color: black;
color:white;
pading : 10px 20px;
text-decoration:none;
border-radius:4px 4px 0 0;
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
        <img src="${pageContext.request.contextPath}/images/images.jpg" width='100%' height='100%'>
    </td>
  </tr>
  
  <tr>
    <td>
    <ul id="menu">
     <li><a href="${pageContext.request.contextPath}/">홈</a></li>    
      <li><a href="${pageContext.request.contextPath}/list">글목록</a></li>
     <li><a href="${pageContext.request.contextPath}/create">글생성</a></li>
    </ul>
    </td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->
 
 
 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">