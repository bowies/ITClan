<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<!-- *********************************************** -->

	<DIV class="title">회원 수정 (* 필수 입력)</DIV>

	<FORM name='frm' method='POST' action='./update'
		onsubmit="return inputCheck()">

		<input type="hidden" name="companyID" value="${dto.companyID}">
		<input type="hidden" name="eclick" value=0> 
		<TABLE class='table' width="80%">

			<tr>
				<th>*아이디</th>
				<td>${dto.companyID}</td>
			</tr>
			<tr>
				<th>*이름</th>
				<td>${dto.name}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" value="${dto.phone}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email"> 
					
					
				</td>
			</tr>
		
			<tr>
				<th>사업자번호</th>
				<td><input type="text" name="companyNumber"> 
					
					
				</td>
			</tr>
			<tr>
				<th>회사명</th>
				<td><input type="text" name="companyName"> 
					
					
				</td>
			</tr>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='회원수정'> <input type='reset'
				value='취소'>
		</DIV>7
	</FORM>


	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>