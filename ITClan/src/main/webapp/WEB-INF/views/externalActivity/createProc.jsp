<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 팝업창 닫기 -->
<!-- 부모창 새로고침
		window.opener.parent.location.reload(); 사용가능 
		location.reload() -> 현재페이지 새로고침 -->
<script type="text/javascript">
/* window.self.close(); */
/* window.opener.parent.location.reload(); */
/*  opener.location.href = '../resumeInfo/create'; */

 
</script>

<div style=" margin: auto; background-color: #D9E5FF; border: 2px solid #2478FF; padding-bottom: 15px; padding-top: 15px; width: 960px;">
			<div>
			<label>대외활동</label>
			<label style="float: right;"> 
			<a>-삭제</a>
			</label>
			</div>
			<hr>
			
			<div>
			<label>활동구분</label>
			<label>
			${param.actSector }
			</label>
			</div>
			<hr>
			
			<div>
			<label>활동기간</label>
			<label>
			${param.actPeriod }
			</label>
			</div>
			<hr>
			
			<div>
			<label>활동내용</label>
			<label>
			${param.actContent }
			</label>
			</div>
			</div>
			<br>
			