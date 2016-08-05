<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="uti" uri="/ELFunctions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>W3.CSS</title>


<!-- <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css"> -->
<link  href="../css/style.css" rel="Stylesheet" type="text/css">


<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){

	
    $('#trig0').click(function(){
        $("p0").toggle();
    });
    $('#trig1').click(function(){
        $("p1").toggle();
    });
    $('#trig2').click(function(){
        $("p2").toggle();
    });
    $('#trig3').click(function(){
        $("p3").toggle();
    });
    $('#trig4').click(function(){
        $("p4").toggle();
    });
    $('#trig5').click(function(){
        $("p5").toggle();
    });
    $('#trig6').click(function(){
        $("p6").toggle();
    });
    $('#trig7').click(function(){
        $("p7").toggle();
    });
});

// $(document).ready(function() {
// 	$('div').toggle(
// 				function() {
// 					$(this).addClass('clicked');
// 				},
// 				function() {
// 					$(this).removeClass('clicked');
// 				}
// 			);
			
// 			$('div#buttonQ, div#buttonU').trigger('click');
// 		}
// 	);


</script>

<body>








<%-- <jsp:include page="/menu/top.jsp" flush="false"/> --%>




<div id="wrap">
<!-- style="width:auto;" -->
	<div class="w3-navbar w3-light-grey" style="height:400px; width:1250px; margin:auto;"  >
	
	<!--   <a href="#"><img src="../img/customer.gif" ></a> -->
	
	<!--   <a href="#"><img src="../img/서비스 안내.jpg"></a> -->
	<div class="img">
	    <img width="400px" src="../img/자주찾는.jpg" alt="Fjords">
	    <ul>
	  	<li><a href="${pageContext.request.contextPath}/qna/list">글목록 </li></a>
	  	</ul>
	<!--  <div class="desc"> -->
	<!--   <nav1> -->
	
	<!--   <li><a href="">	개인회원 </li></a> -->
	<!--   <li><a href="">	기업회원</li></a> -->
		
	  	
	<!--   </ul> -->
	<!--   </nav1> -->
	<!-- </div> -->
	</div>
	
	<div class="img">
	    <img src="../img/회원정보 관리.jpg" alt="Forest" >
	   <ul>
	  <li>	<a href="">아이디 찾기 </li></a>
	  <li>	<a href="">회원정보 수정</li></a>
	  <li>	<a href="">비밀번호 찾기</li></a>
	  <li>	<a href="">회원탈퇴 신청</li>  </a>	
	  </ul>
	
	</div>
	
	
	<div class="img">
	    <img src="../img/서비스 안내.jpg" alt="Mountains" width="300" height="200">
	    <ul>
	
	  	<li><a href="">메뉴 보류 </li></a>
	    
	 	</ul>
	
	</div>
	
	<div class="img">
	  <a target="_blank" href="">
	    <img  src="../img/고객센터.gif" alt="Northern Lights" style="width:300px; height:185px;">
	  </a>
	   <ul>
	    <li><a href="${pageContext.request.contextPath}/onebyone/create">1:1 고객상담하기</li></a>
	   </ul>
	
	</div>
	</div>
 </div> <!--wrap  -->
 

<div class="aaa">

 
<br>




<table class="padding3" width="680" border="0" cellspacing="0" cellpadding="3">


<tr bgcolor="62B5DF"><td height="1" colspan="5" style="padding:0"></td></tr>


		<tbody>
		

					<div>
					<tr>
						<td colspan="2">검색어 입력
			<!-- 				<form name="Search" method="post" action="./list" onsubmit="return search(this.form);"> -->
								<form name="Search" method="post" action="./list" >
								
									<div class="search">
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
								
									<input type="text" name="word"  value="${word }" >
									<input type="submit" value="검색">
									</div>
								
								</form>
						 </td>
						
					</tr>
					</div>
			
		
			  
				<div  border="0" style="width:1250px; margin:auto;">

						  <tr>
						    <th colspan="2" >개인회원 FAQ</th>
						 
						  </tr>
						  <tr>
						    <td>
						    <div id="trig0">
						    	<h3>토글 클릭</h3></div>
						 		<p0>0000000</p0>
						    </td>
						    
						     <td>
						 		<div id="trig1">
						 		<h3>토글클릭</h3></div>						    	
						    <p1>1111111</p1></td>
						    
						  
						  </tr>
						  <tr>
						  <th colspan="2"> 기업회원 FAQ</th>
						  </tr>
						  <tr>
						     <td>
						    <div id="trig3">
						    	<h3>토글 클릭</h3></div>
						 		<p3>0000000</p3>
						    </td>
						       <td>
						    <div id="trig4">
						    	<h3>토글 클릭</h3></div>
						 		<p4>0000000</p4>
						    </td>
						  </tr>
						  
						
						  
						  <tr>
						    <th colspan="2">개인회원 서비스 안내</th>
						  </tr>
							  <tr>
						     <td>
						    <div id="trig5">
						    	<h3>토글 클릭</h3></div>
						 		<p5>0000000</p5>
						    </td>
						       <td>
						    <div id="trig6">
						    	<h3>토글 클릭</h3></div>
						 		<p6>0000000</p6>
						    </td>
						  </tr>
						  
						    <tr>
						    <th colspan="2">기업회원 서비스 안내</th>
						  </tr>
						  <tr>
						    <td>1</td>
						    <td>2</td>
						  </tr>
						  
						  <tr>
						  <th colspan="2">공지사항</th>
						  </tr>
						  <tr>
						    <td>1</td>
						    <td>2</td>
						  </tr>
						  
						<tr><td colspan="2">&nbsp;</td></tr>	
				</div>	
						
</tbody>
</table>
</div>  
	





</body>
</html>
