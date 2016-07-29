<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function update(oldfile) {
	var url = "update";
	url += "?oldfile="+oldfile;
	
	location.href = url;
}
</script>
<body>

<div style="width: 960px; margin : auto ;">
<b style="font-size: xx-large;">회원정보</b>
</div>

<table border="1" style="border-collapse: collapse; height: 270px;" >
<tr>
<td style="width: 80px;" align="center" rowspan="8"><img id="photo" src="./no_image.JPG" style="width: 170px; height: 170px;">
</td>
</tr>
<tr style="width: 100px;">
<th colspan="2">이름  *</th> 
<td colspan="4">${personalmemberdto.name }&nbsp;
${2016-(birth.substring(0,2)+1900) }세
/ ${personalmemberdto.memberID} </td>
</tr>

<tr>
<th rowspan="3">연락처  *</th>
</tr>

<tr>
<th>휴대폰</th>
<td colspan="4">
${personalmemberdto.phone }
</td>
</tr>

<tr>
<th>이메일</th>
<td colspan="4">
${personalmemberdto.email }
</td>
</tr>


<tr>
<th rowspan="3" colspan="2">주소</th>
</tr>

<tr>
<td colspan="4">
${personalmemberdto.address }
</td>
</tr>

<tr>
<td colspan="4">
${personalmemberdto.address2 }
</td>
</tr>
</table>

<input type="button" value="수정" onclick="update('${resumedto.picture}')">

</body>
</html>