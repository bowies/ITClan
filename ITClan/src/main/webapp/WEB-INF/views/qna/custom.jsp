<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>W3.CSS</title>

<style>
/* p0 p1 p2 p3 p4 p5{ */
/* 	style="display: block;" */
/* } */
.left{
		text-align: left;
}
h4:hover {color:#3163ce; text-decoration:none; border-color:silver;} 
div.panel,p.flip
{
line-height: 30px;
margin:auto;
font-size:16px;
padding:5px;
text-align:center;
background:blue;
border:solid 1px #666;
color:lime;
border-radius:3px;
}
div.panel0,div.panel1,div.panel2,div.panel3,div.panel4,div.panel5,div.panel6,div.panel7,div.panel8 
{
height:120px;
display:none;
}
p.flip
{
cursor:pointer;
}
</style>
<!-- <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css"> -->
<link  href="../css/style.css" rel="Stylesheet" type="text/css">


<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
/* Toggle between adding and removing the "active" and "show" classes when the user clicks on one of the "Section" buttons. The "active" class is used to add a background color to the current button when its belonging panel is open. The "show" class is used to open the specific accordion panel */
var acc = document.getElementsByClassName("accordion");
var i;
for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show");
    }
}
$(document).ready(function(){
	
    $('.flip0').click(function(){
        $(".panel0").toggle();
    });
    $('.flip1').click(function(){
        $(".panel1").toggle();
    });
    $('.flip2').click(function(){
        $(".panel2").toggle();
    });
    $('.flip3').click(function(){
        $(".panel3").toggle();
    });
    $('.flip4').click(function(){
        $(".panel4").toggle();
    });
    
    $('.flip5').click(function(){
        $(".panel5").toggle();
    });
    $('.flip6').click(function(){
        $(".panel6").toggle();
    });
    $('.flip7').click(function(){
        $(".panel7").toggle();
    });
});
</script>

<body>


<div id="wrap">
<!-- style="width:auto;" -->
	<div class="w3-navbar w3-light-grey" style="height:400px; width:1250px; margin:auto;"  >
	
	<!--   <a href="#"><img src="../img/customer.gif" ></a> -->
	
	<!--   <a href="#"><img src="../img/서비스 안내.jpg"></a> -->
	<div class="img">
	    <img width="400px" src="../img/자주찾는.jpg" alt="Fjords">
	    <ul>
	  	<li><a href="${pageContext.request.contextPath}/qna/list">Q & A 목록 </li></a>
	  	</ul>

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
	    <li><a href="${pageContext.request.contextPath}/qna/chat">실시간 질문하기</li></a>
	   </ul>
	
	</div>
	</div>
 </div> <!--wrap  -->
 

<div class="aaa">

 
<br>




<table width="1100px" border="0" cellspacing="0" cellpadding="3">


<tr bgcolor="62B5DF"><td height="1" colspan="5" style="padding:0"></td></tr>


		<tbody>
		

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
			

				
			  
<!-- 				<div border="0" style="width:1100px; margin:auto;"> -->

						  <div class="left">
						  <tr>
						    <th colspan="2" ><h3>개인회원 FAQ</h3></th>
						 
						  </tr>
						</div>
						<tr>
						<td><button class="accordion">잡코리아를 탈퇴하면 어떻게 되나요?</button>
						<div class="panel">
						  <p>탈퇴 시, 해당 아이디로 사이트를 이용하셨던 이력서, 지원내역 등 모든 정보가 삭제 됩니다. </p>
						</div>
						</td>
						</tr>
						

						  <tr>
						    <td colspan="2" >
						    	<h4 class="flip0">페이스북 로그인으로 잡코리아를 이용하고 있는데 탈퇴하면 어떻게 되나요?</h4>
						    <div class="panel0">	
						 		<p>로그인으로 이용하시는 모든 서비스 이용에 제한을 받으실 수 있습니다.</p>
						 	</div>	
						    </td>
						    </tr>
					    
						    <tr>
						     <td colspan="2">
						 		<h4 class="flip1" >비밀번호 변경은 어디에서 하나요?</h4>
						 		    	
						 	<div class="panel1">
						  	  <p1>잡코리아 ID로 로그인 하신 회원의 경우, [회원정보 관리] 페이지에서 직접 변경이 가능합니다. 

								<br>비밀번호를 변경하는 방법은 다음과 같습니다.
								<br>1. 회원 로그인 후 [회원정보 관리] 클릭해 주세요.
								<br>2. 비밀번호 변경에서 새로운 비밀번호를 입력해 주세요. </p1></td>
						    </div>
						  
						  </tr>
						  
						  <tr>
						  <th colspan="2"><h3>기업회원 FAQ</h3></th>
						  </tr>
						  <tr>
						     <td colspan="2">
						    
						    	<h4 class="flip2">토글 클릭</h4>
						    <div class="panel2">
						 		<p3>0000000</p3>
						 	</div>
						    </td>
						    </tr>
						    <tr>
						       <td colspan="2">
						    <div  class="flip3">
						    	<h4>토글 클릭</h4></div>
						    <div  class="panel3">	
						 		<p4>1111111</p4>
						    </div>
						    </td>
						    
						  </tr>
						  
						  </div>
						  
						  <tr>
						    <th colspan="2">개인회원 서비스 안내</th>
						  </tr>
						  
							  <tr>
							  
						     <td colspan="2">
						    <div class="flip4">
						    	<h4>토글 클릭</h4></div>
							    <div class="panel4">	
						 		<p5>0000000</p5>
						 		</div>
						    </td>
						    </tr>
						    <tr>
						    
						       <td colspan="2">
						    <div class="flip5">
						    	<h4>토글 클릭</h4></div>
						    	<div class="panel5">	
						 		<p6>0000000</p6>
						 		</div>
						    </td>
						  </tr>
						  
						    <tr>
						    <th colspan="2">기업회원 서비스 안내</th>
						  </tr>
						  <tr>
							  
						     <td colspan="2">
						    <div class="flip6">
						    	<h4>토글 클릭</h4></div>
							    <div class="panel6">	
						 		<p5>0000000</p5>
						 		</div>
						    </td>
						    </tr>
						    <tr>
						    
						       <td colspan="2">
						    <div class="flip7">
						    	<h4>토글 클릭</h4></div>
						    	<div class="panel7">	
						 		<p6>0000000</p6>
						 		</div>
						    </td>
						  </tr>
						  
					
						  
						  
						<tr><td colspan="2">&nbsp;</td></tr>	
											
</tbody>

</table>
</div>  




</body>
</html>