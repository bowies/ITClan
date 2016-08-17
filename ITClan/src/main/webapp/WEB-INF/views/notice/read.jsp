<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
	//댓글관련 함수시작
	function rcheck(tarea) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member/login";
				url = url + "?noticeNum=${dto.noticeNum}";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&flag=../notice/read";
				location.href = url;
			} else {
				tarea.blur();
			}
		}
	}

	function input(f) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member/login";
				url = url + "?noticeNum=${dto.noticeNum}";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&flag=../notice/read";
				location.href = url;
				return false;
			} else {

				return false;
			}
		} else if (f.content.value == "") {
			alert("댓글 내용을 입력하세요.");
			f.content.focus();
			return false;
		}
	}
	function rupdate(replyNum, rcontent) {
		var f = document.rform;
		f.content.value = rcontent;
		f.rnum.value = rnum;
		f.rsubmit.value = "수정";
		f.action = "./rupdate"
	}
	function rdelete(replyNum) {
		if (confirm("정말삭제 하겠습니까?")) {
			var url = "./rdelete";
			url = url + "?replyNum=" + replyNum;
			url = url + "&noticeNum=${dto.noticeNum}";
			url = url + "&nowPage=${param.nowPage}";
			url = url + "&nPage=${nPage}";
			url = url + "&col=${param.col}";
			url = url + "&word=${param.word}";
			location.href = url;
		}
	}
	//댓글관련 함수끝
	function deleteM() {
		var url = "./delete"
		url += "?noticeNum=${dto.noticeNum}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function listB() {
		var url = "./list"
		url += '?col=${param.col}';
		url += '&word=${param.word}';
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function updateB() {
		var url = "./update"
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&noticeNum=${dto.noticeNum}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->

	<DIV class="title"></DIV>

	<TABLE class='table'>
		<TR>
			<TH>제목</TH>
			<TD>${dto.title}</TD>
		</TR>
		<TR>
			<TH>조회수</TH>
			<TD>${dto.viewCnt}</TD>
		</TR>
		<TR>
			<TH>등록일</TH>
			<TD>${dto.regDate}</TD>
		</TR>
		<TR>
			<TD colspan="2">${dto.content}</TD>
		</TR>
	</TABLE>

	<DIV class='bottom'>
		<c:if test="${sessionScope.grade == 'A'}">
		<input type='button' value='등록' onclick="location.href='./create'">
		<input type='button' value='목록' onclick="listB()"> 
		<input type='button' value='삭제' onclick="deleteM()"> 
		<input type='button' value='수정' onclick="updateB()"> 
		</c:if>
	</DIV>
	<hr>
	<c:forEach var="rdto" items="${rlist}">
		<div class="rlist">
			${rdto.id}<br />
			<p>${rdto.content}</p>
			${rdto.regDate}
			<c:if test="${sessionScope.id==rdto.id }">
				<span style="float: right;"> <a
					href="javascript:rupdate('${rdto.replyNum}','${rdto.content }')">
						수정</a>|<a href="javascript:rdelete('${rdto.replyNum}')">삭제</a>
				</span>
			</c:if>
		</div>
	</c:forEach>
	<div class="rcreate">
		<form name="rform" action="./rcreate" method="post"
			onsubmit="return input(this)">
			<textarea rows="3" cols="28" name="content" onclick="rcheck(this)"></textarea>
			<input type="submit" name="rsubmit" value="등록"> <input
				type="hidden" name="noticeNum" value="${dto.noticeNum}"> <input
				type="hidden" name="id" value="${sessionScope.id}"> <input
				type="hidden" name="nowPage" value="${param.nowPage}"> <input
				type="hidden" name="nPage" value="${nPage}"> <input
				type="hidden" name="col" value="${param.col}"> <input
				type="hidden" name="word" value="${param.word}"> <input
				type="hidden" name="replyNum" value="0">


		</form>
	</div>
	<div class="bottom">${paging}</div>
	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
