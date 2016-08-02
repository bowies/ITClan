<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->

	<DIV class="title">게시글 삭제</DIV>

	<FORM name='frm' method='POST' action='./delete'>
		<input type="hidden" name="oneByOneNum" value="${param.oneByOneNum }"> 
	<input type="hidden" name="oldfile" value="${param.oldfile }">
	<input type="hidden" name="col" value="${param.col }">
<input type="hidden" name="word" value="${param.word }">
<input type="hidden" name="nowPage" value="${param.nowPage }">

		<div class="content">

			삭제를 하시면 더이상 복구가 불가능 합니다.<br> 그래도 삭제를 원하시 아래 삭제버튼을 클릭하세요.
		</div>


		<DIV class='bottom'>
		<br><br>
			<br><br><input type='submit' value='삭제'>
			<input type='button' value='취소' onclick="history.back()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
