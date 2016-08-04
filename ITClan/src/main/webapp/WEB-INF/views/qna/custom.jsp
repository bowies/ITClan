<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="uti" uri="/ELFunctions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>W3.CSS</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<body class="w3-container">
<%-- <jsp:include page="/menu/top.jsp" flush="false"/> --%>



<div id="wrap">
<!-- style="width:auto;" -->
<div class="w3-navbar w3-light-grey" style="height:400px; width:1250px; margin:auto;"  >

<!--   <a href="#"><img src="../img/customer.gif" ></a> -->

<!--   <a href="#"><img src="../img/서비스 안내.jpg"></a> -->
<div class="img">
  <a target="_blank" href="">
    <img width="400px" src="../img/자주찾는.jpg" alt="Fjords">
  </a>
  <div class="desc">
  <nav1>
  <ul>
  <li><a href="${pageContext.request.contextPath}/qna/list">글목록 </li></a>
<!--   <li><a href="">	개인회원 </li></a> -->
<!--   <li><a href="">	기업회원</li></a> -->
	
  	
  </ul>
  </nav1>
  </div>
</div>

<div class="img">
  <a target="_blank" href="">
    <img src="../img/회원정보 관리.jpg" alt="Forest" >
  </a>
  <div class="desc">
  <nav1>
  <ul>
  <li>	<a href="">아이디 찾기 </li></a>
  <li>	<a href="">회원정보 수정</li></a>
  <li>	<a href="">비밀번호 찾기</li></a>
  <li>	<a href="">회원탈퇴 신청</li>  </a>	
  </ul>
  </nav1>
  </div>
</div>


<div class="img">
  <a target="_blank" href="">
    <img src="../img/서비스 안내.jpg" alt="Mountains" width="300" height="200">
  </a>
  <div class="desc">
  <nav1>
  <ul>

  	<li><a href="">메뉴 보류 </li></a>
<!--   	<li><a href="">개인회원 </li></a> -->
<!--   	<li><a href="">기업회원</li></a> -->
  </nav1>
  </ul>
  </div>
</div>

<div class="img">
  <a target="_blank" href="">
    <img  src="../img/고객센터.gif" alt="Northern Lights" style="width:300px; height:185px;">
  </a>
  <div class="desc">
  <nav1>
   <ul>
    <li><a href="${pageContext.request.contextPath}/onebyone/create">1:1 고객상담하기</li></a>
   </ul>
   </nav1>
  </div>
</div>
</div>
 </div> <!-- wrap  -->
 
 임시검색
 
<!-- 		<div style="margin-right:auto;"> -->
		<div style="float:center;">
<!-- 				<form name="Search" method="post" action="./list" onsubmit="return search(this.form);"> -->
					<form name="Search" method="post" action="./list" >
					<div class="faqSchBox">
						<div class="faqList">
							<span id="MemTypeUI2" class="ccSprite schSel">
							</span>
							<select name="col">
								<option value="name"
								<c:if test="${col =='name' }">selected</c:if>
								>성명</option>
								<option value="title"
								<c:if test="${col =='title' }">selected</c:if>
								>제목</option>
								<option value="content"
								<c:if test="${col =='content' }">selected</c:if>
								>내용</option>
								<option value="total"
								<c:if test="${col =='total' }">selected</c:if>
								>전체출력</option>
							</select>
						</div>
						<label for="lb_faq1" class="skip">검색어 입력</label>
						<input type="text" name="word" id="Search_Text" value="${word }" class="schTxt text" 
						style="background-image: url(&quot;&quot;);">
							<input type="submit" value="검색">
					</div>
					</form>
	</div>
			
			
			
<!-- <div class="search"> -->
<!-- 	<form action="./list" method="post"> -->
<!-- 		<select name="col"> -->
<!-- 			<option value="name" -->
<%-- 			<c:if test="${col =='name' }">selected</c:if> --%>
<!-- 			>성명</option> -->
<!-- 			<option value="title" -->
<%-- 			<c:if test="${col =='title' }">selected</c:if> --%>
<!-- 			>제목</option> -->
<!-- 			<option value="content" -->
<%-- 			<c:if test="${col =='content' }">selected</c:if> --%>
<!-- 			>내용</option> -->
<!-- 			<option value="total" -->
<%-- 			<c:if test="${col =='total' }">selected</c:if> --%>
<!-- 			>전체출력</option> -->
<!-- 		</select> -->
<%-- 	<input type="text" name="word" value="${word }"> --%>
<!-- 	<input type="submit" value="검색"> -->
<!-- 	</form> -->
<!--  </div> -->
 
  
 
<div style="width:1250px; margin:auto;">
<table>
  <tr>
    <th>개인회원 FAQ</th>
    <th>기업회원 FAQ</th>
  </tr>
  <tr>
    <td>1</td>
    <td>2</td>
  </tr>
  <tr>
    <td>1</td>
    <td>2</td>
  </tr>
  <tr>
    <th>개인회원 서비스 안내</th>
    <th>기업회원 서비스 안내</th>
  </tr>
  <tr>
    <td>1</td>
    <td>2</td>
  </tr>
  <tr>
  <th>공지사항</th>
  </tr>
  <tr>
    <td>1</td>
    <td>2</td>
  </tr>
  
</table>
</div>  






</body>
</html>
