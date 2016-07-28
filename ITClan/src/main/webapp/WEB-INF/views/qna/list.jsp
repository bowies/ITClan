<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="uti" uri="/ELFunctions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
/* table li ul li{ */
/* font-size: 12px; }*/

/* Style the buttons that are used to open and close the accordion panel */
button.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    text-align: left;
    border: none;
    outline: none;
    transition: 0.4s;
}

/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
button.accordion.active, button.accordion:hover {
    background-color: #ddd;
}

/* Style the accordion panel. Note: hidden by default */

div.panel {
    padding: 0 18px;
    background-color: white;
    display: none;
    font-family: 굴림;
}

/* The "show" class is added to the accordion panel when the user clicks on one of the buttons. This will show the panel content */
div.panel.show {
    display: block !important;
}


</style>
<script type="text/javascript">
function readB(qnANum) {
	var url = "read";
	url += "?qnANum=" + qnANum;//변수의 인식
	url += "&col=${col}";  
	//data의 인식
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	
	location.href=url;
	
	
}
</script>

<body class="w3-container">
<%-- <jsp:include page="/menu/top.jsp" flush="false"/> --%>


<div class="left">
<div style=" font-size:15px; position: relative; display:block;">
<table border="1" cellspacing="0" cellpadding="0" align="left" width="200px"> 
   
        <ul>
        <h4 style="text-align: left">무엇을 도와드릴까요?</h4>
            <li><a href="">도움말</a></li>
            <li><a href=""><span class="lspn">Q&amp;A</span></a></li>
            <li><a href="">이메일 문의</a></li>
            <li><a href="">이력서 의견ㆍ제안사항 </a></li>
            <li><a href="">아이디ㆍ비밀번호 찾기</a></li>
<!--                                     <li class="last_line"><a href="">사이트맵 </a></li> -->
        </ul>
    
</table>
</div> 
</div>




<div class="aaa"  style="height:400px; width:1250px; margin-left:200px; position:absolute">
	<h2>자주찾는 FAQ</h2>


   <div id="css_tabs"  style="height:200px; width:1250px; margin:auto; border: 1px   solid  black ;" >
        <!-- 라디오 버튼 -->
        <input id="tab1" type="radio" name="tab" checked="checked" />
        <input id="tab2" type="radio" name="tab" />
        <input id="tab3" type="radio" name="tab" />

        <!-- 라벨 : 화면에 표시되는 탭 제목 -->
        <label style="border:1px solid black;" for="tab1">개인회원</label>
        <label style="border:1px solid black;"for="tab2">기업회원</label>
        <label style="border:1px solid black;"for="tab3">Tab 3</label>

        <!-- 탭 내용 : 탭 제목을 선택했을 때 표시되는 본문 -->
<!--      div style="border:1px; padding:0px 50px 0px 50px ;" -->
        <div style="border: 1px   solid  blue ;" class="tab1_content">
 		<ul>
	 		<li>회원가입·로그인</li>
	 		<li>이력서</li>
	 		<li>입사지원</li>
	 		<li>채용정보</li>
		</ul> 		
 	
        </div>
        <div style="border: 1px   solid  blue ;" class="tab2_content">
    	<ul>
	 		<li>회원가입·로그인</li>
	 		<li>채용공고</li>
	 		<li>인재정보</li>
	 		<li>채용관리</li>
	 		<li>기타 서비스</li>
	 		
		</ul> 		
        </div>
        <div style="border: 1px   solid  blue ;" class="tab3_content">
            Tab3 내용<br />
             내용3~~~
        </div>
        
        
    </div>



<!-- ============ -->
<button class="accordion">페이스북 로그인으로 잡코리아를 이용하고 있는데 탈퇴하면 어떻게 되나요?</button>
<div class="panel">
  <p>잡코리아 탈퇴 시, 해당 페이스북 아이디로 잡코리아를 이용하셨던 이력서, 지원내역 등 모든 정보가 삭제 됩니다. 

같은 페이스북 아이디로 다시 잡코리아를 이용하실 수 있지만 이전에 저장하셨던 정보들을 더이상 확인하실 수 없습니다.</p>
</div>

<button class="accordion">Section 2</button>
<div class="panel">
  <p>2.</p>
</div>

<button class="accordion">Section 3</button>
<div class="panel">
  <p>3.</p>
</div>
<button class="accordion">Section 4</button>
<div class="panel">
  <p>4.</p>
</div>
<button class="accordion">Section 5</button>
<div class="panel">
  <p>5.</p>
</div>

<!-- ========== -->

<script>

// ============
/* Toggle between adding and removing the "active" and "show" classes when the user clicks on one of the "Section" buttons. The "active" class is used to add a background color to the current button when its belonging panel is open. The "show" class is used to open the specific accordion panel */
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show");
    }
}
// ===============

</script>


<table width="680" border="0" cellspacing="0" cellpadding="0" align="center">
<tbody><tr><td height="50" align="center">
<table width="680" border="0" cellspacing="0" cellpadding="0">
<h2> 질문과 답변</h2>
${fn:substring(dto.regdate,0,10)}

<tbody><tr><td align="right">
<a href="${pageContext.request.contextPath}/qna/create">
<img src="http://www.saraminimage.co.kr/buttons/default/qnalist_write.gif" width="114" height="18" border="0" alt="Q&amp;A게시판에 글쓰기">
</a></td></tr>
<tr><td height="5"></td></tr>
<tr><td>

<div class="helpdesk-qna-list">
<table class="padding3" width="680" border="0" cellspacing="0" cellpadding="3">
<tbody>
<tr bgcolor="62B5DF"><td height="1" colspan="5" style="padding:0"></td></tr>
<tr>
<td width="50" height="25" align="center"><b>번호</b></td>
<td width="360" height="25" align="center"><b>주제</b></td>
<td width="120" height="25" align="center"><b>작성자</b></td>
<td width="80" height="25" align="center"><b>등록일시</b></td>
</tr>

<!--   <TR> -->
<!--       <th>번호</th> -->
<!--       <th width = "25%">제목</th> -->
<!--       <th>이름</th> -->
<!--       <th>등록일</th> -->

<!--     </TR> -->
  <c:choose>
  <c:when test="${empty list}">
  <tr>
	  <td colspan="8" align="center">등록된 글이 없습니다.</td>
	  </tr>
  </c:when>
  <c:otherwise>
  <c:forEach var="dto" items="${list}">
  <tr>
    <td>${dto.qnANum}</td>
    <td>
    <a href="javascript:readB('${dto.qnANum }')">${dto.title}</a>
     <c:if test="${uti:newImg(fn:substring(dto.regdate,0,10)) }">
     <img src="../images/new.gif">
     </c:if>
      </td>
    <td>${dto.name }</td>
    <td>${fn:substring(dto.regdate,0,10)}</td>
    </tr>
     
  </c:forEach>
  </c:otherwise>
  </c:choose>   


</tbody>
<DIV class="title">게시판 목록</DIV>
 <div class="search">
	<form action="./list" method="post">
		<select name="col">
			<option value="name"
			<c:if test="${col =='name' }">selected</c:if>
			>성명</option>
			<option value="title"
			<c:if test="${col =='title' }">selected</c:if>
			>제목</option>
			<option value="content"
			<c:if test="${col =='content' }">selected</c:if>
			>내용</option>
			<option value="total"
			<c:if test="${col =='total' }">selected</c:if>
			>전체출력</option>
		</select>
	<input type="text" name="word" value="${word }">
	<input type="submit" value="검색">
	</form>
 </div>


  

  
  <DIV class='bottom'>
  	${paging}<br>
  	    <input type='button' value='등록' onclick="location.href='create'">
  </DIV>






</table>
</div>

</td></tr>
<tr>
<td height="30" align="center">
<!-- 페이지  -->


<!-- |<font color="ff8400"> <b>1</b> </font> -->
<!-- |<a href="qna.php?default=0&amp;get_total_count=33406&amp;page=2"> -->
<!--  <b>2</b> </a>|<a href="qna.php?default=0&amp;get_total_count=33406&amp;page=3"> <b>3</b> -->
<!--   </a>|<a href="qna.php?default=0&amp;get_total_count=33406&amp;page=4"> <b>4</b> -->
<!--    </a>|<a href="qna.php?default=0&amp;get_total_count=33406&amp;page=5"> <b>5</b> -->
<!--     </a>|<a href="qna.php?default=0&amp;get_total_count=33406&amp;page=6"> <b>6</b> -->
<!--      </a>|<a href="qna.php?default=0&amp;get_total_count=33406&amp;page=7"> <b>7</b> -->
<!--       </a>|<a href="qna.php?default=0&amp;get_total_count=33406&amp;page=8"> <b>8</b> -->
<!--        </a>|<a href="qna.php?default=0&amp;get_total_count=33406&amp;page=9"> <b>9</b> -->
<!--         </a>|<a href="qna.php?default=0&amp;get_total_count=33406&amp;page=10"> <b>10</b> -->
<!--          </a>| <a href="qna.php?default=0&amp;get_total_count=33406&amp;page=11">다음  -->
<!--          <img src="http://www.saraminimage.co.kr/recruit/upjikjong/point_04.gif" width="5" height="7" border="0" align="absmiddle"> -->
<!--          </a></td></tr> -->
<!-- 페이지  -->

<tr><td align="right"><a href="${pageContext.request.contextPath}/qna/create">
<img src="http://www.saraminimage.co.kr/buttons/default/qnalist_write.gif" width="114" height="18" border="0" alt="Q&amp;A게시판에 글쓰기"></a></td></tr>
<tr><td>&nbsp;</td></tr>
<form name="helpdeskSearchForm" method="get" action="qna.php?default=0&amp;get_total_count=33406" onsubmit="return helpdeskSearchCheck(this);"></form>
<tr><td align="center"><b><font color="#0066CC">검색</font></b>
<input name="s_keyword" type="text" class="textareabg" size="20" value=""> &nbsp;<input type="image" src="http://www.saraminimage.co.kr/buttons/default/search001.gif" width="36" height="18" align="absmiddle" title="검색"></td></tr>

<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</tbody></table>
</td></tr>
<!-- <tr><td height="20">&nbsp;</td></tr> -->
<!-- <tr><td height="20"><p>&nbsp;</p></td></tr> -->
</tbody></table>


</div>
<!-- ================================= -->
<!-- <DIV class="title">게시판 목록</DIV> -->
<!--  <div class="search"> -->
<!-- 	<form action="./list" method="post"> -->
<!-- 		<select name="col"> -->
<!-- 			<option value="name" -->
<%-- 			<c:if test="${col =='name' }">selected</c:if> --%>
<!-- 			>성명</option> -->
<!-- 			<option value="title" -->
<%-- 			<c:if test="${col =='title' }">selected</c:if> --%>
<!-- 			>제목</option> -->
<!-- 			<option value="content" -->
<%-- 			<c:if test="${col =='content' }">selected</c:if> --%>
<!-- 			>내용</option> -->
<!-- 			<option value="total" -->
<%-- 			<c:if test="${col =='total' }">selected</c:if> --%>
<!-- 			>전체출력</option> -->
<!-- 		</select> -->
<%-- 	<input type="text" name="word" value="${word }"> --%>
<!-- 	<input type="submit" value="검색"> -->
<!-- 	</form> -->
<!--  </div> -->

<!--   <TABLE> -->
<!--     <TR> -->
<!--       <th>번호</th> -->
<!--       <th width = "25%">제목</th> -->
<!--       <th>이름</th> -->
<!--       <th>조회수</th> -->
<!--       <th>등록일</th> -->
<!-- <!--       <th>grpno</th> --> -->
<!-- <!--       <th>indent</th> --> -->
<!-- <!--       <th>ansnum</th>       --> -->
<!--     </TR> -->
<%--   <c:choose> --%>
<%--   <c:when test="${empty list}"> --%>
<!--   <tr> -->
<!-- 	  <td colspan="8" align="center">등록된 글이 없습니다.</td> -->
<!-- 	  </tr> -->
<%--   </c:when> --%>
<%--   <c:otherwise> --%>
<%--   <c:forEach var="dto" items="${list}"> --%>
<!--   <tr> -->
<%--     <td>${dto.qnANum}</td> --%>
<!--     <td> -->
<%--     <c:forEach begin="1" end="${dto.indent }" > --%>
<!--     &nbsp;&nbsp; -->
<%--     </c:forEach> --%>
<%--     <c:if test="${dto.indent >0 }"> --%>
<!--     [답변] -->
<%--     </c:if> --%>
<%--     <c:set var="rcount" value="${uti:rcount(dto.qnANum,rdao) }"/> --%>
<%--     <a href="javascript:read('${dto.qnANum }')">${dto.title }</a> --%>
<%--      <c:if test="${rcount>0 }"> --%>
<%--      <span style="color:red;">(${rcount})</span> --%>
<%--      </c:if> --%>
<%--      <c:if test="${uti:newImg(fn:substring(dto.wdate,0,10)) }"> --%>
<!--      <img src="../images/new.gif"> -->
<%--      </c:if> --%>
<!--       </td> -->
<%--     <td>${dto.wname }</td> --%>
<%--     <td>${dto.viewcnt }</td> --%>
<%--     <td>${fn:substring(dto.wdate,0,10)  }</td> --%>
<%--     <td>${dto.grpno }</td> --%>
<%--     <td>${dto.indent }</td> --%>
<%--     <td>${dto.ansnum }</td> --%>
<!--     </tr> -->
     
<%--   </c:forEach> --%>
<%--   </c:otherwise> --%>
<%--   </c:choose>    --%>
<!--   </TABLE> -->
  
<!--   <DIV class='bottom'> -->
<%--   	${paging}<br> --%>
<!--   	    <input type='button' value='등록' onclick="location.href='create'"> -->
<!--   </DIV> -->


<!-- ================================= -->


<style type="text/css">
p{padding:0; margin:0}
.layer_close{position:absolute; right:13px; top:10px;}
.layer_end_day{font-size:13px; font-weight:bold; color:#555}
.layer_main01{width:775px; position:absolute;  background:url(http://www.saraminimage.co.kr/event_2011/1124_contact/layer_main01.gif) no-repeat;}
.layer_main02{width:633px; position:absolute;  background:url(http://www.saraminimage.co.kr/event_2011/1124_contact/layer_main02.gif) no-repeat;}
.layer_main03{width:775px; position:absolute;  background:url(http://www.saraminimage.co.kr/event_2011/1124_contact/layer_join01.gif) no-repeat;}
</style>
<script type="text/javascript">
<!--
//-->
</script>
<!-- 레이어 - 인재정보 열람 상품 이벤트 -->
<!-- <div class="layer_main01" style="z-index:98; display:none" id="head-event-layer"> -->
<!--   <div class="layer_close"> -->
<!--     <img src="http://www.saraminimage.co.kr/event_2011/1124_contact/ico_close.gif" border="0" style="cursor:pointer" alt="닫기" onclick="return closeBanner(this)"> -->
<!--   </div> -->
<!--   <div style="text-align:center"> -->
<!--     <p style="padding:249px 0 21px 0; letter-spacing:1px;"> -->
<!--       <img src="http://www.saraminimage.co.kr/event_2011/1124_contact/btn_go_talent_contact900.gif" border="0" style="cursor:pointer" onclick="return applyHeadhuntEvent()" alt="지금 인재정보 열람 상품 900건 받기"> -->
<!--       <img src="http://www.saraminimage.co.kr/event_2011/1124_contact/btn_contact_no.gif" border="0" style="cursor:pointer" onclick="return closeBanner(this)" alt="나중에 받기"> -->
<!--     </p> -->
<!--   </div> -->
<!-- </div> -->
<!-- <!-- 레이어 - 인재정보 열람 상품 이벤트 --> -->

<!-- <!-- 레이어 - 인재정보 열람 상품 이벤트 회원가입레이어1 --> -->
<!-- <div class="layer_main03" style="z-index:98; display:none; top:55px;" id="head-event-registration-layer"> -->
<!--   <div class="layer_close"> -->
<!--     <img src="http://www.saraminimage.co.kr/event_2011/1124_contact/ico_close.gif" border="0" style="cursor:pointer" alt="닫기" onclick="return closeBanner(this)"> -->
<!--   </div> -->
<!--     <div style="text-align:center;"> -->
<!--      <p style="padding:279px 0 21px 0; letter-spacing:1px;"> -->
<!--        <img src="http://www.saraminimage.co.kr/event_2011/1124_contact/btn_go_talent_contact900.gif" border="0" style="cursor:pointer" onclick="return applyHeadhuntEvent()" alt="지금 인재정보 열람 상품 900건 받기"> -->
<!--        <img src="http://www.saraminimage.co.kr/event_2011/1124_contact/btn_contact_no2.gif" border="0" style="cursor:pointer" onclick="return goMainPage(this);" alt="나중에 받기"> -->
<!--      </p> -->
<!--     </div> -->
<!-- </div> -->
<!-- <!-- 레이어 - 인재정보 열람 상품 이벤트 회원가입레이어1 --> -->


<!-- <!-- 레이어 - 인재정보 열람 상품 이벤트 적용 완료--> -->
<!-- <div class="layer_main02" style="z-index:99; display:none" id="head-apply-ok-layer"> -->
<!--   <div class="layer_close"> -->
<!--     <img src="http://www.saraminimage.co.kr/event_2011/1124_contact/ico_close.gif" border="0" style="cursor:pointer" onclick="$('head-apply-ok-layer').hide();" alt="닫기"> -->
<!--   </div> -->
<!--   <div style="padding-top:127px; text-align:center"> -->
<!--     <p class="layer_end_day">(서비스 만료 예정일 : <span id="expiry_date"></span>)</p> -->
<!--     <p style="padding:30px 0 38px 0;"> -->
<!--                 <a href="/zf_user/talent/search-resume/total"> -->
<!--            <img src="http://www.saraminimage.co.kr/event_2011/1124_contact/btn_go_talent_info.gif" border="0" alt="인재정보 바로가기"></a> -->
<!--                   </p> -->
<!--   </div> -->
<!-- </div> -->
<!-- <!-- 레이어 - 인재정보 열람 상품 이벤트 적용 완료 --> -->


  </div>
  
    
  <div style="clear:both"></div>
</div>



</div>

</body>
</html>