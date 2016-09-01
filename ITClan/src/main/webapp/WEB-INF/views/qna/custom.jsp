<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>W3.CSS</title>

<style>
button.accordion.active, button.accordion:hover {
    background-color: #99d0f9;
}
div.panel.show {
    display: block;
}

 div.panel 
 { 
 line-height: 30px; 
 margin:auto; 
 font-size:16px; 
 padding:5px; 
 background:#ffffff; 
 display: none;
/*  border:solid 1px #666;  */
/*  border-radius:3px;  */
 } 

/* accordion */
button.accordion {
    background-color: #ffffff;
    color: #444;
    cursor: pointer;
    padding: 8px;
    width: 100%;
    text-align: left;
    border: none;
    outline: none;
    transition: 0.4s;
}
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
.img {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 100px;
    height: 150px;
}
.wrap{
   width: 250px;
   height: 150px;
}
.left{
	width:150px;
	margin-left:0;
	float:left;
} 

.aaa{
	height:400px; 
	width:900px;
	margin-left:50px;
 	position:absolute;
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


<!-- <div class="wrap"> -->
<!-- style="width:auto;" -->
<!-- 	<div class="w3-navbar w3-light-grey" style="height:300px; width:900px; margin:auto;"  > -->
	
	<!--   <a href="#"><img src="../img/customer.gif" ></a> -->
	
	<!--   <a href="#"><img src="../img/서비스 안내.jpg"></a> -->
<!-- 	<div class="img"> -->
<!-- 	    <img width="200px" src="../img/자주찾는.jpg"> -->

	    <ul>
	  	<li><a href="${pageContext.request.contextPath}/qna/list">Q & A 목록 </li></a>
	  	</ul>

<!-- 	</div> -->
	  
<!-- 	<div class="img"> -->
<!-- 	    <img src="../img/회원정보 관리.jpg"  > -->
	   <ul>
	  <li>	<a href="">아이디 찾기 </li></a>
	  <li>	<a href="">회원정보 수정</li></a>
	  <li>	<a href="">비밀번호 찾기</li></a>
	  <li>	<a href="">회원탈퇴 신청</li>  </a>	
	  </ul>
	
<!-- 	</div> -->
	

<!-- 	<div class="img"> -->
	  <a target="_blank" href="">
<!-- 	    <img  src="../img/고객센터.gif"  style="width:200px; height:185px;"> -->
	  </a>
	   <ul>
	    <li><a href="${pageContext.request.contextPath}/onebyone/create">1:1 고객상담하기</li></a>
	    <li><a href="${pageContext.request.contextPath}/qna/chat">실시간 질문하기</li></a>
	   </ul>
	   
	
<!-- 	</div> -->
<!-- 	</div> -->
<!--  </div> wrap  -->
 

<div class="aaa">

 
<br>




<table width="900px">


<tr bgcolor="62B5DF"><td height="1" colspan="5" style="padding:0"></td></tr>


		<tbody>
		

						  <div class="left">
						  <tr>
						    <th colspan="2" ><h3>개인회원 FAQ</h3></th>
						 
						  </tr>
						</div>
				
						

						  <tr>
						    <td colspan="2" >
						    	<h4 class="flip0">탈퇴하면 어떻게 되나요?</h4>
						    <div class="panel0">	
						 		<p>로그인으로 이용하시는 모든 서비스 이용에 제한을 받으실 수 있습니다.</p>
						 	</div>	
						    </td>
						    </tr>
					    
						    <tr>
						     <td colspan="2">
						 		<h4 class="flip1" >비밀번호 변경은 어디에서 하나요?</h4>
						 		    	
						 	<div class="panel1">
						  	  <p1>ID로 로그인 하신 회원의 경우, [회원정보 관리] 페이지에서 직접 변경이 가능합니다. 

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