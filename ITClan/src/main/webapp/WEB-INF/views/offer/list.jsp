<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function read(offerNum) {
		var url = "read";
		url += "?offerNum=" + offerNum;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
</script>
<link href='../css/style.css' rel='Stylesheet' type='text/css'>

</head>
<body>

<DIV class="title">채용공고 목록</DIV>

<DIV class="content">

	<FORM name ='personalmember' method="POST" action="./list">
		<select name="col">
			<option value="title"
				<c:if test="${col==title}">selected='selected'</c:if>>제목</option>
			<option value="CompanyName"
				<c:if test="${col==CompanyName}">selected='selected'</c:if>>회사이름</option>
			<option value="WorkingArea"
				<c:if test="${col==WorkingArea}">selected='selected'</c:if>>지역</option>
			<option value="total"
				<c:if test="${col==total}">selected='selected'</c:if>>전체출력</option>
		</select> <input type="text" name="word" value="${word}"> <input
			type="submit" value="검색" />

		<c:if test="${sessionScope.grade == 'C'}">
			<input type='button' value='채용공고 등록'
				onclick="location.href='../offer/create'">
			<input type='button' value='지원자 목록'
				onclick="location.href='#'">	
		</c:if>
	</FORM>
</DIV>

<c:forEach var="dto" items="${list}">
	<TABLE border='1' align='center' width='70%'>
		<TR>
			<TH>글번호</TH>
			<TD>${dto.offerNum}</TD>
		</TR>
		<TR>
			<TH width='20%'>채용공고</TH>
			<TD width='60%'><A href="javascript:read('${dto.offerNum}')">${dto.title}</A></TD>
		</TR>
		<TR>
			<TH>회사이름</TH>
			<TD>${dto.companyName}</TD>
		</TR>
		<TR>
			<TH>모집인원</TH>
			<TD>${dto.recruitment}</TD>
		</TR>
		<TR>
			<TH>채용마감일</TH>
			<TD>${dto.offerDate}</TD>
		</TR>
		<TR>
			<TH>조회수</TH>
			<TD>${dto.viewCnt}</TD>
		</TR>

	</TABLE>
	<BR>
</c:forEach>

<DIV class="bottom">${paging}</DIV>


</body>
</html>
