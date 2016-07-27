<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script type="text/javascript">
  function inputCheck(frm){ 
	    var f = document.frm; // <FORM>태그 객체 
	     
	    if(f.id.value == ""){ 
	      alert("아이디를 입력해 주세요."); 
	      f.id.focus(); // 폼이름.input 태그명.커서 셋팅    
	 
	      return;       // 프로그램 종료, 값을 돌려줌 
	    } 
	    if(f.passwd.value == ""){ 
	      alert("비밀번호를 입력해 주세요."); 
	      f.passwd.focus(); 
	      return; 
	    } 
	    if(f.repasswd.value == ""){ 
	      alert("비밀번호를 확인해 주세요"); 
	      f.repasswd.focus(); 
	      return; 
	    } 
	     
	    //비밀번호가 일치하는지 검사 
	    if(f.passwd.value != f.repasswd.value){ 
	      alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요."); 
	      f.passwd.focus(); 
	      return; 
	    } 
	     
	    if(f.name.value == ""){ 
	      alert("이름을 입력해 주세요."); 
	      f.name.focus(); 
	      return; 
	    } 
	
	 
	    if(f.phone.value == ""){ 
	      alert("전화번호을 입력해 주세요."); 
	      f.phone.focus(); 
	      return; 
	    } 
	 
	    if(f.e_em1.value == ""){ 
	      alert("이메일을 입력해 주세요."); 
	      f.e_em1.focus(); 
	      return; 
	    } 
	    if(f.e_em2.value == ""){ 
	      alert("이메일을 입력해 주세요."); 
	      f.e_em2.focus(); 
	      return; 
	    } 
	    if(f.address.value == ""){ 
	      alert("이메일을 입력해 주세요."); 
	      f.address.focus(); 
	      return; 
	    } 
	    if(f.address2.value == ""){ 
	      alert("이메일을 입력해 주세요."); 
	      return; 
	    } 
	 
	       // Form onsubmit 이벤트일경우 
	    // return false; 
	     
	    f.submit(); 
	  } 
	 
	  // 중복 아이디를 검사합니다. 
	  function idCheck(id){ 
	    if(id == ""){ 
	      window.alert("아이디를 입력해 주세요."); 
	      document.frm.id.focus(); // 커서 이동 
	    }else{ 
	      url="./id_proc?id=" + id;  // GET 
	      wr = window.open(url,"아이디검색","width=500,height=400"); 
	      wr.moveTo((window.screen.width-500)/2, (window.screen.height-400)/2);// x, y 
	    } 
	  } 
	  function EmailCheck(email){ 
	    if(email == ""){ 
	      window.alert("아이디를 입력해 주세요."); 
	      document.frm.email.focus(); // 커서 이동 
	    }else{ 
	      url="./email_proc?email=" + email;  // GET 
	      wr = window.open(url,"이메일검색","width=500,height=400"); 
	      wr.moveTo((window.screen.width-500)/2, (window.screen.height-400)/2);// x, y 
	    } 
	  } 
  </script>
  
  <script>

  $(function(){
		$("#passwd").val("passwd").css("color","#ccc").one("focus",function(){
			$(this).val("").css("color","#000");
		}).blur(function () {
			if($(this).val()==""){
				$(this).val("passwd").css("color","#ccc").one("focus",function(){
					$(this).val("").css("color","#000");
				});
			}
		});
	});
  $(function(){
		$("#repasswd").val("패스워드 확인").css("color","#ccc").one("focus",function(){
			$(this).val("").css("color","#000");
		}).blur(function () {
			if($(this).val()==""){
				$(this).val("패스워드 확인").css("color","#ccc").one("focus",function(){
					$(this).val("").css("color","#000");
				});
			}
		});
	});
  var addressList = new Array("naver.com","hanmail.net","nate.com","daum.net","gmail.com");
  window.onload = function(){
	    var v_sidoSelect = document.getElementById("sideSelect"); // SELECT TAG
	        
	    for (i =0 ; i<addressList.length; i++){// 0 ~ 3   
	        // 새로운 <option value=''>값</option> 태그 생성
	        var optionEl = document.createElement("option");
	    
	        // option태그에 value 속성 값으로 저장
	        optionEl.value = addressList[i];
	        
	        // text 문자열을 새로 생성한 <option> 태그의 값으로 추가
	        optionEl.appendChild (document.createTextNode(addressList[i]));
	        
	        // 만들어진 option 태그를 <select>태그에 추가
	        v_sidoSelect.appendChild(optionEl);
	    }
  }
  $(document).ready(function(){
	  $("#sideSelect").change(function(){
	  	var value = $(".selectBox option:selected").text();
	  	if(value!="선택하세요" && value!="직접입력"){
	  		$("#m_em2").val(value);
	  		$("#m_em2").attr("disabled",true);
	  	}else{
	  		$("#m_em2").val("");
	  		$("#m_em2").attr("disabled",false);
	  	}
	  });
	  });
  $(document).ready(function(){
		$("#join").hide();
	    $("#joinTitle").click(function(){
	        $("#join").slideToggle();
	    });
	}); 
  </script>
<style type="text/css">
input[type=text] {

    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
input[type=text]:focus {
    background-color: lightblue;
}

table tr td {
	border: 0px;
	
}
#joinTitle{
	width: 430px;
	height: 30px;
	border: 1px solid; 
	border-color: #F6F6F6; 
}
#join{
	width: 430px;
}
.btu_personal{
	width : 250px;
	margin:auto;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #ffffff;
	padding: 10px 20px;
	background: -moz-linear-gradient(
		top,
		#0091ff 0%,
		#003366);
	background: -webkit-gradient(
		linear, left top, left bottom,
		from(#0091ff),
		to(#003366));
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	border: 1px solid #054687;
	-moz-box-shadow:
		0px 1px 3px rgba(000,000,000,0.5),
		inset 0px 0px 1px rgba(255,255,255,0.5);
	-webkit-box-shadow:
		0px 1px 3px rgba(000,000,000,0.5),
		inset 0px 0px 1px rgba(255,255,255,0.5);
	box-shadow:
		0px 1px 3px rgba(000,000,000,0.5),
		inset 0px 0px 1px rgba(255,255,255,0.5);
	text-shadow:
		0px -1px 0px rgba(000,000,000,0.7),
		0px 1px 0px rgba(255,255,255,0.3);
}


</style>
</head>
<body style="padding: 50px;">
<div align="center">
<h2>회원가입</h2>
</div>

<form action="./create" name="frm">
<div style=" margin: auto;width: 550px; background-color: #C4DEFF;" align="center">
<div id="name" style="width: 500px;padding-top: 23px; "> 
<div id="name_sub1" style="width: 100px; float: left; margin-left:  30px">
Name 
</div>
<div id="name_sub2"><input type="text" name="name" style="width: 300px; ">
<input type="button" value="ID중복확인"  onclick="idCheck(document.frm.id.value)" style="height: 23px"/>
</div>
<hr style="border-color: #2478FF; ">
</div>
<div id="MemberID" style="width: 500px"> 
<div id="ID_sub1" style="width: 100px; float: left; margin-left:  30px">
memberID 
</div>
<div id="ID_sub2"><input type="text" name="id" style="width: 300px; "></div>
<hr style="border-color: #2478FF;">
</div>
<div id="pw" style="width: 500px"> 
<div id="pw_sub1" style="width: 100px; float: left; margin-left:  30px">
Pw 
</div>
<div id="pw_sub2"><input id="passwd" type="text" style="width: 300px; "></div>

</div>
<div id="passwdCheck" style="width: 500px"> 
<div id="pwc_sub1" style="width: 100px; float: left; margin-left:  30px">
Pw Check
</div>
<div id="pwc_sub2"><input type="text" name="repasswd" style="width: 300px; "></div>
<hr style="border-color: #2478FF;">
</div>
<div id="Email" style="width: 500px"> 
<div id="email_sub1" style="width: 100px; float: left; margin-left:  30px">
Email
</div>
<div id="pwc_sub2"><input id="m_em1" name="m_em1" type="text" size="10">&nbsp;@&nbsp;<input type="text" size="12"  name="m_em2" id="m_em2" value="">
	<select onchange="select()" id="sideSelect" class="selectBox">
	<option value="">선택하세요</option>
	</select>
	<input type="button" value="email중복확인"  onclick="EmailCheck(document.frm.email.value)"/>
	</div>
<hr style="border-color: #2478FF;">
</div>
<div id="Phone" style="width: 500px"> 
<div id="Phone_sub1" style="width: 100px; float: left; margin-left:  30px">
Phone 
</div>
<div id="Phone_sub2"><input type="text" name="phone" style="width: 300px; "></div>
<hr style="border-color: #2478FF;">
</div>
<div id="address" style="width: 500px"> 
<div id="address_sub1"  style="width: 100px; float: left; margin-left:  30px">
address 
</div>
<div id="address_sub2"><input type="text" name="address" style="width: 300px; "></div>
<hr style="border-color: #2478FF;">
</div>
<div id="address2" style="width: 500px"> 
<div id="address2_sub1" style="width: 100px; float: left; margin-left:  30px">
address2 
</div>
<div id="address2_sub2"><input type="text" name="address2" style="width: 300px; "></div>
<hr style="border-color: #2478FF;">
</div>
</div>


<div align="center" style="margin : auto;margin-top: 30px ;width: 550px;">
<input type="submit" class="btu_personal" value="personalmember create!">
</div>
</from>


</body>
</html>