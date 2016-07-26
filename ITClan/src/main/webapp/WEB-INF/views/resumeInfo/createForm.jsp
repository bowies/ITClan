<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="check.html" method="post">

<div style="width: 960px; margin: auto;  background-color: #D9E5FF; border: 2px solid #2478FF; padding-bottom: 15px; padding-top: 15px; ">
<b style="font-size: x-large; text-align: left; padding-left: 5px;">이력서제목 *</b>&nbsp;&nbsp;&nbsp; <input style="width: 750px; height:30px ;  margin: auto;" type="text">
</div>

<div style="width: 960px; margin: auto;">
<h1>회원정보</h1>
</div>
<table border="1">
<tr>
<td style="width: 80px;" align="center" rowspan="12"><img id="photo" src="./no_image.JPG" style="width: 170px; height: 170px;">
<input style="text-align: center; width: 76px;" type="file" id="imgInp">
</td>
</tr>
<tr>
<th colspan="2">이름  *</th>
<td colspan="3"><input id="input" type="text" value="관리자"/>&nbsp;/admin</td>
</tr>

<tr>
<th colspan="2">생년월일/성별  *</th>
<td colspan="3">


<input type="radio" value="남">남&nbsp;
<input type="radio" value="여">여
</td>
</tr>

<tr>
<th rowspan="4">연락처  *</th>
</tr>

<tr>
<th>휴대폰</th>
<td>
<select name="국제번호" style="width: 90px;">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>
-
<input style="width: 70px;" type="text" name="휴대폰앞자리">
-
<input style="width: 70px;" type="text" name="휴대폰뒷자리">
</td>
</tr>

<tr>
<th>전화번호</th>
<td>
<select style="width: 90px;">
<option value="선택">선택</option>
<option value="02">02</option>
<option value="031">031</option>
<option value="032">032</option>
<option value="033">033</option>
<option value="041">041</option>
<option value="042">042</option>
<option value="043">043</option>
<option value="044">044</option>
<option value="051">051</option>
<option value="052">052</option>
<option value="053">053</option>
<option value="054">054</option>
<option value="055">055</option>
<option value="061">061</option>
<option value="062">062</option>
<option value="063">063</option>
<option value="064">064</option>
<option value="070">070</option>
<option id="select" value="직접입력">직접입력</option>
</select>
-
<input style="width: 70px;" type="text" name="전화번호 앞자리">
-
<input style="width: 70px;" type="text" name="전화번호 뒷자리">
(예: 02-123-4567)
<!-- <samp>-
<input id="input" type="text">
</samp> -->
</td>
</tr>
<tr>
<th>이메일</th>
<td>
<input style="width: 200px;" type="text"> @
<input id="m_em2" style="width: 200px;" type="text">
<select id="Email" class="selectBox">
<option>선택하세요</option>
<option value="naver.com">naver.com</option>
<option value="hanmail.net">hanmail.net</option>
<option value="nate.com">nate.com</option>
<option value="daum.net">daum.net</option>
<option value="gmail.com">gmail.com</option>
<option>직접입력</option>
</select>
</td>
</tr>

<tr>
<th colspan="2">홈페이지</th>
<td colspan="3">
<input type="text" style="width: 430px;" value="http://">
<samp style="font-size: small;">(SNS,블로그 가능)</samp>
</td>
</tr>

<tr>
<th rowspan="4" colspan="2">주소</th>
</tr>
<tr>
	<td colspan="3">
		<input type="text" name="zipcode" style="width: 430px; maxlength="5" id="sample6_postcode" placeholder="우편번호">
		<input type="button" value="주소검색" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
	</td>
</tr>
<tr>
	<td colspan="3">
		<input type="text" name="address1" style="width: 430px; id="sample6_address" placeholder="주소"><br>
	</td>
</tr>
<tr>
	<td colspan="3">	
		<input type="text" name="address2" style="width: 430px; id="sample6_address2" placeholder="상세주소"><br>
	</td>
</tr>
</table>


</form>

</body>
</html>