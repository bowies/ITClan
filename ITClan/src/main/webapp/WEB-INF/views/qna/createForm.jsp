<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>
<body>

<%-- <jsp:include page="/menu/top.jsp" flush="false"/> --%>


<div class="center">
<h1>Q & A </h1>
<form name="qnaform" method="post" action="createProc" >
<table width="680" border="0" cellspacing="0" cellpadding="0" align="center"> 

<!-- 			<input type="hidden" name="mode" value="write_ok"> -->
<!-- 			<input type="hidden" name="page" value="1"> -->
<!-- 			<input type="hidden" name="idx" value=""> -->
			
			
<tbody><tr><td>
	<table class="helpdesk-qna-write" width="680" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr><td>
		<table class="padding5" width="680" border="0" cellpadding="5" cellspacing="0" bgcolor="#FFFFFF">
		<tbody><tr bgcolor="62B5DF"><td height="1" colspan="4"></td></tr>
		<tr>
		<td width="83" bgcolor="#F3EEEB"><div align="center">제목</div></td>
		<td width="372"><div align="left"><input name="title" type="text" class="textareabg" size="60" value=""></div></td>
		<td width="93" bgcolor="#F3EEEB"><center>작성자</center></td>
		<td width="92">글쓴이</td>
		<%-- 		 ${sessionScope.userLoginInfo.Name} --%>
		</tr>
		<tr bgcolor="62B5DF"><td height="1" colspan="4"></td></tr>
		<tr>
		<td bgcolor="#F3EEEB" class="line160"><center>내용</center></td>
		<td class="line160" colspan="3"><textarea name="content" cols="90" rows="20" class="textarea" onfocus="checkCommentDefault(this, 'focus')" onblur="checkCommentDefault(this, 'blur')"></textarea></td>
		</tr>
		<tr bgcolor="62B5DF"><td height="1" colspan="4"></td></tr>
		</tbody></table>
	</td></tr> 
	</tbody></table>
</td> </tr> 
<tr><td>&nbsp;</td></tr> 
<!-- <tr bgcolor="62B5DF"><td height="1"></td></tr> -->
<tr><td height="30">
		<div align="right">&nbsp;</div>
		<center>
		<DIV class='bottom'>
   		 <input type='submit' value='전송'>
    	<input type='button' value='취소' onclick="history.back();"> 
 		 </DIV>  

		</center></td></tr>

<tr bgcolor="ffffff"><td height="30">&nbsp;</td></tr>
<!-- <tr><td bgcolor="ffffff">&nbsp;</td></tr>  -->
</tbody></table>

</form>
</div>

</body>
</html>