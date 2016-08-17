<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript">
	function inputCheck(frm) {
		var f = document.frm; // <FORM>태그 객체 

		if (f.memberID.value == "") {
			alert("아이디를 입력해 주세요.");
			f.memberID.focus(); // 폼이름.input 태그명.커서 셋팅    

			return; // 프로그램 종료, 값을 돌려줌 
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			f.passwd.focus();
			return;
		}
	
		if (f.repasswd.value == "") {
			alert("비밀번호를 확인해 주세요");
			f.repasswd.focus();
			return;
		}

		//비밀번호가 일치하는지 검사 
		if (f.passwd.value != f.repasswd.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			f.passwd.focus();
			return;
		}

		if (f.name.value == "") {
			alert("이름을 입력해 주세요.");
			f.name.focus();
			return;
		}

		if (f.birth.value == "") {
			alert("생년월일(숫자)을 입력해 주세요.");
			f.birth.focus();
			return;
		}
		if (f.phone.value == "") {
			alert("전화번호을 입력해 주세요.");
			f.phone.focus();
			return;
		}
	

		if (f.email.value == "") {
			alert("이메일을 입력해 주세요.");
			f.email.focus();
			return;
		}

		if (f.address.value == "") {
			alert("이메일을 입력해 주세요.");
			f.address.focus();
			return;
		}
		if (f.address2.value == "") {
			alert("이메일을 입력해 주세요.");
			return;
		}

		// Form onsubmit 이벤트일경우 
		// return false; 

		f.submit();
	}

	// 중복 아이디를 검사합니다. 
	function idCheck(memberID) {
		if (memberID == "") {
			window.alert("아이디를 입력해 주세요.");
			document.frm.memberID.focus(); // 커서 이동 
		} else {
			url = "./id_proc?memberID=" + memberID; // GET 
			wr = window.open(url, "아이디검색", "width=500,height=400");
			wr.moveTo((window.screen.width - 500) / 2,
					(window.screen.height - 400) / 2);// x, y 
		}
	}
	function EmailCheck(email) {
		if (email == "") {
			window.alert("이메일를 입력해 주세요.");
			document.frm.email.focus(); // 커서 이동 
		} else {
			url = "./email_proc?email=" + email; // GET 
			wr = window.open(url, "이메일검색", "width=500,height=400");
			wr.moveTo((window.screen.width - 500) / 2,
					(window.screen.height - 400) / 2);// x, y 
		}
	}
</script>

<script>
	$(function() {
		$("#passwd").val("passwd").css("color", "#ccc").one("focus",
				function() {
					$(this).val("").css("color", "#000");
				}).blur(
				function() {
					if ($(this).val() == "") {
						$(this).val("passwd").css("color", "#ccc").one("focus",
								function() {
									$(this).val("").css("color", "#000");
								});
					}
				});
	});
	$(function() {
		$("#repasswd").val("패스워드 확인").css("color", "#ccc").one("focus",
				function() {
					$(this).val("").css("color", "#000");
				}).blur(
				function() {
					if ($(this).val() == "") {
						$(this).val("패스워드 확인").css("color", "#ccc").one(
								"focus", function() {
									$(this).val("").css("color", "#000");
								});
					}
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
table{
	width: 60%;
	border: 1px solid;
	border-collapse: collapse;
}
table tr td {
	border: 1px solid;
	border-collapse: collapse;
}

#joinTitle {
	width: 430px;
	height: 30px;
	border: 1px solid;
	border-color: #F6F6F6;
}

#join {
	width: 430px;
}

.btu_personal {
	width: 250px;
	margin: auto;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #ffffff;
	padding: 10px 20px;
	background: -moz-linear-gradient(top, #0091ff 0%, #003366);
	background: -webkit-gradient(linear, left top, left bottom, from(#0091ff),
		to(#003366));
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	border: 1px solid #054687;
	-moz-box-shadow: 0px 1px 3px rgba(000, 000, 000, 0.5), inset 0px 0px 1px
		rgba(255, 255, 255, 0.5);
	-webkit-box-shadow: 0px 1px 3px rgba(000, 000, 000, 0.5), inset 0px 0px
		1px rgba(255, 255, 255, 0.5);
	box-shadow: 0px 1px 3px rgba(000, 000, 000, 0.5), inset 0px 0px 1px
		rgba(255, 255, 255, 0.5);
	text-shadow: 0px -1px 0px rgba(000, 000, 000, 0.7), 0px 1px 0px
		rgba(255, 255, 255, 0.3);
}
</style>
</head>
<body style="padding: 50px;">
	<div align="center">
		<h2>회원가입</h2>
	</div>

	<form method="post" action="./create" name="frm">
	<table style="margin: auto;">
	<tr>
	<td style="background-color:  #D9E5FF">memberID</td>
	<td align="left"><input type="text" name="memberID" style="width: 250px;"> &nbsp;&nbsp;
	<input type="button" value="ID중복확인"
				onclick="idCheck(document.frm.memberID.value)" style="height: 23px" />
	</td>
	</tr>
	<tr>
	<td style="background-color:  #D9E5FF">Name</td>
	<td align="left"><input type="text" name="name" style="width: 300px;">
	</td>
	</tr>
	<tr>
	<td style="background-color:  #D9E5FF">Birth</td>
	<td align="left"><input type="date" name="birth" style="width: 300px;" max="${mTime}">
	</td>
	</tr>
	<tr>
	<td style="background-color:  #D9E5FF">Passwd</td>
	<td align="left"><input id="passwd" name="passwd" type="password"
						style="width: 300px;">
	</td>
	</tr>
	<tr>
	<td style="background-color:  #D9E5FF">rePasswd</td>
	<td align="left"><input type="password" name="repasswd" style="width: 300px;">
	</td>
	</tr>
	<tr>
	<td style="background-color:  #D9E5FF">Email</td>
	<td align="left"><input type="email" name="email" style="width: 300px;"> &nbsp;&nbsp;
	<input type="button" value="email중복확인"
						onclick="EmailCheck(document.frm.email.value)" />
	</td>
	</tr>
	<tr>
	<td style="background-color:  #D9E5FF">Phone</td>
	<td align="left"><input type="text" name="phone" style="width: 300px;"maxlength="11">
	</td>
	</tr>
	
	<tr>
	<td style="background-color:  #D9E5FF">address</td>
	<td align="left"><input type="text" name="address" style="width: 300px;">
	</td>
	</tr>
	
	<tr>
	<td style="background-color:  #D9E5FF">address2</td>
	<td align="left">
	<input type="text" name="address2" style="width: 300px;">
	</td>
	</tr>
	
	</table>
	<div align="center" style="margin: auto; margin-top: 30px; width: 550px;">
		<input type="submit" class="btu_personal" value="personalmember create!">
		</div>
		
	</form>
</body>
</html>