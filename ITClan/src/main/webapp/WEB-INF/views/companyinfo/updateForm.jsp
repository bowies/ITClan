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

	<DIV class="title">회사 정보</DIV>

	<FORM name='frm' method='POST' action='./update'
		onsubmit="return inputCheck()">

		<input type="hidden" name="companyID" value="${dto.companyID}">
		<TABLE class='table' width="80%">

			<tr>
				<th>기업회원 아이디</th>
				<td><input type="text" name="companyID" value="${dto.companyID}"></td>
			</tr>
			<tr>
				<th>회사명</th>
				<td><input type="text" name="companyName" value="${dto.companyName}"></td>
			</tr>
			<tr>
				<th>기업형태</th>
				<td><input type="text" name="companyScale" value="${dto.companyScale}"></td>
			</tr>
			<tr>
				<th>대표자명</th>
				<td><input type="text" name="bossName" value="${dto.bossName}"></td>
			</tr>
		
			<tr>
				<th>사업자번호</th>
				<td><input type="text" name="companyNumber" value="${dto.companyNumber}"></td>
			</tr>
			<tr>
				<th>회사마크 사진파일명</th>
				<td><input type="text" name="ci" value="${dto.ci}"></td>
			</tr>
			<tr>
				<th>분류코드</th>
				<td><input type="text" name="categoryCode" value="${dto.categoryCode}"></td>
			</tr>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='회원수정'> <input type='reset'
				value='취소'>
		</DIV>
	</FORM>


	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>