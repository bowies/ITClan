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
/* tab */
#css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1),
#css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2),
#css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(3) ~ div:nth-of-type(3) {
    display:none
}
#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1),
#css_tabs input:nth-of-type(2):checked ~ div:nth-of-type(2),
#css_tabs input:nth-of-type(3):checked ~ div:nth-of-type(3) {
    display:block
}

/* The "show" class is added to the accordion panel when the user clicks on one of the buttons. This will show the panel content */
div.panel.show {
    display: block;
}

 div.panel 
 { 
 line-height: 30px; 
 margin:auto; 
 font-size:16px; 
 padding:5px; 
 background:#ffffff; 
 display: none;
/*  border:solid 1px #666;  */
/*  border-radius:3px;  */
 } 

/* accordion */
button.accordion {
    background-color: #ffffff;
    color: #444;
    cursor: pointer;
    padding: 8px;
    width: 100%;
    text-align: left;
    border: none;
    outline: none;
    transition: 0.4s;
}

/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
button.accordion.active, button.accordion:hover {
    background-color: #99d0f9;
}

#css_tabs > label {
    display:inline-block;
    font-variant:small-caps;
    font-size:.9em;
    padding:5px;
    text-align:center;
    width:20%;
    line-height:1.8em;
    font-weight:700;
    border-radius:3px 3px 0 0;
    background:#eee;
    color:#777;
    border:1px solid #ccc;
    border-width:1px 1px 0
}
#css_tabs > label:hover {
    cursor:pointer
}
#css_tabs label[for=tab1] {
    margin-left:1.5em
}

#css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs > label[for=tab1]:hover {
    background:#0080ff;
    color:#fff
}
#css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs > label[for=tab2]:hover {
    background:#0080ff;
    color:#fff
}
#css_tabs input:nth-of-type(3):checked ~ label:nth-of-type(3), #css_tabs > label[for=tab3]:hover {
    background:#0080ff;
    color:#fff
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

<body>


<div class="aaa" >
	<h2>자주찾는 FAQ</h2>


   <div id="css_tabs"  style="height:300px; width:900px; margin:auto; border: 1px   solid  black ;" >
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
        <div  class="tab1_content">
 		<ul>
	 		<li><button class="accordion">잡코리아를 탈퇴하면 어떻게 되나요?</button>
				<div class="panel">
				  <p>탈퇴 시, 해당 아이디로 사이트를 이용하셨던 이력서, 지원내역 등 모든 정보가 삭제 됩니다. </p>
				</div>
				
			</li>
	 		<li><button class="accordion">이력서 등록을 하고 싶은데 절차가 어떻게 되나요?</button>
				<div class="panel">
				  <p>회원가입 후  이력서를 등록하실 수 있습니다.  </p>
				</div>
				</li>
	 		<li>입사지원</li>
	 		<li>채용정보</li>
		</ul> 		
 	
        </div>
        <div class="tab2_content">
    	<ul>
	 	
	 		<li><button class="accordion">채용공고</button>
				<div class="panel">
				  <p>공고남겨주세요 </p>
				</div>
				
			</li>
	 			<li><button class="accordion">인재관련</button>
				<div class="panel">
				  <p>인재관련 궁금한점 남겨주세요 </p>
				</div>
				
			</li>
 			<li><button class="accordion">채용관련</button>
			<div class="panel">
			  <p>채용관련 궁금한점 남겨주세요 </p>
			</div>
				
			</li>
	 		<li>기타 서비스</li>
	 		
		</ul> 		
        </div>
        <div  class="tab3_content">
            Tab3 내용<br />
             내용3~~~
        </div>
        
        
    </div>





<script>
/* Toggle between adding and removing the "active" and "show" classes when the user clicks on one of the "Section" buttons. The "active" class is used to add a background color to the current button when its belonging panel is open. The "show" class is used to open the specific accordion panel */
var acc = document.getElementsByClassName("accordion");
var i;
for (i = 0; i < acc.length; i++) {
    acc[i].onclick = function(){
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show");
    }
}
</script>


<table width="900px" border="0" cellspacing="0" cellpadding="0" align="center">
<tbody><tr><td height="50" align="center">
<table width="900px" border="0" cellspacing="0" cellpadding="0">
<h2> Q & A</h2>
${fn:substring(dto.regdate,0,10)}

<tbody><tr><td align="right">
<a href="${pageContext.request.contextPath}/qna/create">
<img src="http://www.saraminimage.co.kr/buttons/default/qnalist_write.gif" width="150" height="23" border="0" alt="Q&amp;A게시판에 글쓰기">
</a></td></tr>
<tr><td height="5"></td></tr>
<tr><td>

<div class="helpdesk-qna-list">
<table class="padding3" width="900px" border="0" cellspacing="0" cellpadding="3">
<tbody>

<tr bgcolor="62B5DF"><td height="1" colspan="5" style="padding:0"></td></tr>
<tr>
<td width="50" height="25" align="center"><b>번호</b></td>
<td width="360" height="25" align="center"><b>주제</b></td>
<td width="120" height="25" align="center"><b>작성자</b></td>
<!-- 	(String)session.getAttribute("id") -->
<td width="80" height="25" align="center"><b>등록일시</b></td>
</tr>

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
<!--    <img src="../images/new.gif"> -->
   </c:if>
    </td>
  <td>${dto.name}</td>
  <td>${fn:substring(dto.regdate,0,10)}</td>
  </tr>
   
</c:forEach>
</c:otherwise>
</c:choose>   


</tbody>
<DIV class="title">Q & A 목록</DIV>
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

</table>
</div>

</td></tr>
<tr>
<td height="30" align="center">
  
  <DIV class='bottom'>
  	${paging}<br>
  </DIV>


<tr><td>&nbsp;</td></tr>
</tbody></table>
</td></tr>

</tbody></table>
</div>




  </div>
  
    
  <div style="clear:both"></div>
</div>



</div>

</body>
</html>