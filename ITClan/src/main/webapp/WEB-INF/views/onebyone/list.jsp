<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet">

<script type="text/javascript">
	function read(oneByOneNum) {
		var url = "./read";
		url += "?oneByOneNum=" + oneByOneNum;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
<!-- *********************************************** -->
 <div class="aaa">
<DIV class="title">1:1 게시판 목록</DIV>

<div class="search">

<FORM name='frm' method='post' action='list'>
	
	
	<select name="col">
			<option value="id"
			<c:if test="${col=='id' }">selected</c:if>
			>ID</option> 
			<option value="name"
			<c:if test="${col=='name' }">selected</c:if>
			>성명</option>
			<option value="title" 
			<c:if test="${col=='title' }">selected</c:if>
			>제목</option>
			<option value="content" 
			<c:if test="${col=='content' }">selected</c:if>
			>내용</option>
			<option value="total" 
			<c:if test="${col=='total' }">selected</c:if>
			>전체출력</option>
	</select>
	<input type="text" name="word" value="${word }">
	<input type="submit" value="검색">
</FORM>
</div> 

<table width="800px" border="0" cellspacing="0" cellpadding="3">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>ID</th>
		<th>조회수</th>
		<th>등록일</th>
		<th>파일</th>
		
	</tr>
	<c:choose>
	<c:when test="${empty list}">
	<tr>
		<td colspan="8" align="center">등록된 글 없음 </td>
	</tr>
	</c:when>
	<c:otherwise>
	<c:forEach var="dto" items="${list}">
	<tr>
		<td>${dto.oneByOneNum}</td>
		
		<td>
			
		<c:forEach begin="1" end="${dto.indent}">		
		&nbsp;
			
		<c:if test="${dto.indent > 0 }">
		[답변]
		</c:if>
		</c:forEach>	
		<a href="javascript:read(${dto.oneByOneNum })">${dto.title}</a>		
		</td>	
		

		<td>${dto.id}</td>		
		 
		<td>${dto.viewcnt}</td>
		
		<td>${fn:substring(dto.regdate,0,10)}</td>
		<td><a href="${pageContext.request.contextPath }/download?dir=/storage/onebyone&filename=${dto.filename}">${dto.filename}</a></td>
	</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
</table> 
  
  
  <DIV class='bottom'>
  <br>
  	${paging}
    <input type='button' value='등록' onclick="location.href='./create'"  style="margin: 5px">
  </DIV>

</div>
 
</body>
</html>