<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr,th {
text-align: left;
width: 100px;
}
table{
margin: auto;
width: 960px;
}
</style>
<script type="text/javascript">
function input(f) {
	if(f.exArea[0].selectedIndex==0){
		alert("근무지역을 입력해주세요.");
		f.exArea[0].focus();
		return false;
	}
	
	if(f.exArea[1].value==""){
		alert("근무지역을 입력해주세요.");
		f.exArea[1].focus();
		return false;
	}
	
	if(f.exField.value==""){
		alert("지원분야를 입력해주세요.");
		f.exField.focus();
		return false;
	}
}
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">

	//경력사항
	$(document).ready(function() {
		$("#artadd").hide();
		$("#TB").hide();
		$("#newcomer").click(function() {
			$("#activity").hide();
			$("#artadd").hide();	
			$("#TB").hide();
		});
	});

	$(document).ready(function() {
		$("#career").click(function() {
			$("#artadd").show();
			$("#TB").show();

		});
	});
	//---------------------------------------//

	//학력사항
	
	$(document).ready(function() {
		$("#edhigh").click(function() {
			$("#school").show();
			$("#hilabel").show();
			$("#hith").show();
			$("#himajor").show();
			$("#grmajor").hide();
			$("#grlabel").hide();
			$("#grth").hide();
			$("#gPA").hide();
		});
	});

	$(document).ready(function() {
		$("#edgreat").click(function() {
			$("#school").show();
			$("#grlabel").show();
			$("#grth").show();
			$("#grmajor").show();
			$("#himajor").hide();
			$("#hilabel").hide();
			$("#hith").hide();
			$("#gPA").show();
			
		});
	});

	$(document).ready(function() {
		$("#edgreat2").click(function() {
			$("#school").show();
			$("#grlabel").show();
			$("#grth").show();
			$("#grmajor").show();
			$("#himajor").hide();
			$("#hilabel").hide();
			$("#hith").hide();
			$("#gPA").show();
			
		});
	});

	$(document).ready(function() {
		$("#edgreat3").click(function() {
			$("#school").show();
			$("#grlabel").show();
			$("#grth").show();
			$("#grmajor").show();
			$("#himajor").hide();
			$("#hilabel").hide();
			$("#hith").hide();
			$("#gPA").show();
		
		});
	});

	$(document).ready(function() {
		$("#edu").click(function() {
			$("#school").hide();
		
		});
	});

	$(document).ready(function() {
		$("#edu2").click(function() {
			$("#school").hide();
			
		});
	});
	
	if(${resumeinfodto.education.substring(0,2)=='대학' }){
		$(document).ready(function() {
			$("#school").show();
			$("#grlabel").show();
			$("#grth").show();
			$("#grmajor").show();
			$("#himajor").hide();
			$("#hilabel").hide();
			$("#hith").hide();
			$("#gPA").show();
		});
	}
		
	if(${resumeinfodto.education.substring(0,2)=='고등' }){
		$(document).ready(function() {
			$("#school").show();
			$("#hilabel").show();
			$("#hith").show();
			$("#himajor").show();
			$("#grmajor").hide();
			$("#grlabel").hide();
			$("#grth").hide();
			$("#gPA").hide();
		});
	}
	//---------------------------------------//
</script>
</head>
<body>
	<form action="./nextupdate" method="post"
		 onsubmit="return input(this)">
		<input type="hidden" name="picture" value="${resumeinfodto.picture }">
		<input type="hidden" name="memberID" value="${memberID }">
		
		<div style="width: 960px; margin: auto;">
			<h1>회원정보</h1>
		</div>
		
		<table border="1">

			<tr>
				<th colspan="2">이름</th>
				<td>${personalmemberdto.name }&nbsp;
					${2016-(personalmemberdto.birth.substring(0,2)+1900) }세
					/ ${personalmemberdto.memberID}</td>
			</tr>

			<tr>
				<th colspan="2">생년월일</th>
				<td colspan="3">
				${personalmemberdto.birth.substring(0,2)+1900}년
				${personalmemberdto.birth.substring(2,4) }월
				${personalmemberdto.birth.substring(4,6) }일
				</td>
			</tr>

			<tr>
				<th colspan="2">장애등급</th>
				<c:choose>
				<c:when test="${resumeinfodto.disableGrade.substring(0,2)=='장애' && resumeinfodto.disableGrade.substring(3,4)=='1'}">
				<td>
				<input type="radio" id="disable" name="disableGrade" value="장애" checked="checked">장애 
				<select id="grade" name="disableGrade">
						<option value="----">----
						<option value="1등급" selected="selected">1등급
						<option value="2등급">2등급
						<option value="3등급">3등급
						<option value="4등급">4등급
						<option value="5등급">5등급
						<option value="6등급">6등급
				</select>
				<input style="margin-left: 15px" type="radio" id="normal" name="disableGrade" value="비장애">비장애
				</td>
				</c:when>
				<c:when test="${resumeinfodto.disableGrade.substring(0,2)=='장애' && resumeinfodto.disableGrade.substring(3,4)=='2'}">
				<td>
				<input type="radio" id="disable" name="disableGrade" value="장애" checked="checked">장애 
				<select id="grade" name="disableGrade">
						<option value="----">----
						<option value="1등급">1등급
						<option value="2등급" selected="selected">2등급
						<option value="3등급">3등급
						<option value="4등급">4등급
						<option value="5등급">5등급
						<option value="6등급">6등급
				</select>
				<input style="margin-left: 15px" type="radio" id="normal" name="disableGrade" value="비장애">비장애
				</td>				
				</c:when>
				<c:when test="${resumeinfodto.disableGrade.substring(0,2)=='장애' && resumeinfodto.disableGrade.substring(3,4)=='3'}">
				<td>
				<input type="radio" id="disable" name="disableGrade" value="장애" checked="checked">장애 
				<select id="grade" name="disableGrade">
						<option value="----">----
						<option value="1등급">1등급
						<option value="2등급">2등급
						<option value="3등급" selected="selected">3등급
						<option value="4등급">4등급
						<option value="5등급">5등급
						<option value="6등급">6등급
				</select>
				<input style="margin-left: 15px" type="radio" id="normal" name="disableGrade" value="비장애" checked="checked">비장애
				</td>			
				</c:when>
				<c:when test="${resumeinfodto.disableGrade.substring(0,2)=='장애' && resumeinfodto.disableGrade.substring(3,4)=='4'}">
				<td>
				<input type="radio" id="disable" name="disableGrade" value="장애" checked="checked">장애 
				<select id="grade" name="disableGrade">
						<option value="----">----
						<option value="1등급">1등급
						<option value="2등급">2등급
						<option value="3등급">3등급
						<option value="4등급" selected="selected">4등급
						<option value="5등급">5등급
						<option value="6등급">6등급
				</select>
				<input style="margin-left: 15px" type="radio" id="normal" name="disableGrade" value="비장애">비장애
				</td>					
				</c:when>
				<c:when test="${resumeinfodto.disableGrade.substring(0,2)=='장애' && resumeinfodto.disableGrade.substring(3,4)=='5'}">
				<td>
				<input type="radio" id="disable" name="disableGrade" value="장애" checked="checked">장애 
				<select id="grade" name="disableGrade">
						<option value="----">----
						<option value="1등급">1등급
						<option value="2등급">2등급
						<option value="3등급">3등급
						<option value="4등급">4등급
						<option value="5등급" selected="selected">5등급
						<option value="6등급">6등급
				</select>
				<input style="margin-left: 15px" type="radio" id="normal" name="disableGrade" value="비장애" checked="checked">비장애
				</td>				
				</c:when>
				<c:when test="${resumeinfodto.disableGrade.substring(0,2)=='장애' && resumeinfodto.disableGrade.substring(3,4)=='6'}">
				<td>
				<input type="radio" id="disable" name="disableGrade" value="장애" checked="checked">장애 
				<select id="grade" name="disableGrade">
						<option value="----">----
						<option value="1등급">1등급
						<option value="2등급">2등급
						<option value="3등급">3등급
						<option value="4등급">4등급
						<option value="5등급">5등급
						<option value="6등급" selected="selected">6등급
				</select>
				<input style="margin-left: 15px" type="radio" id="normal" name="disableGrade" value="비장애">비장애
				</td>					
				</c:when>
				<c:otherwise>
				<td>
				<input type="radio" id="disable" name="disableGrade" value="장애">장애 
				<select id="grade" name="disableGrade" style="display: none;">
						<option value="----">----
						<option value="1등급">1등급
						<option value="2등급">2등급
						<option value="3등급">3등급
						<option value="4등급">4등급
						<option value="5등급">5등급
						<option value="6등급">6등급
				</select>
				<input style="margin-left: 15px" type="radio" id="normal" name="disableGrade" value="비장애" checked="checked">비장애
				</td>
				</c:otherwise>
				</c:choose>

			</tr>

			<tr>
				<th colspan="2">병역사항</th>
				<c:choose>
				<c:when test="${resumeinfodto.military.substring(0,2)=='군필' }">
				<td>
				<input type="radio" value="군필" name="military" checked="checked">군필 
				<input style="margin-left: 15px" type="radio" value="면제" name="military">면제
				<input style="margin-left: 15px" type="radio" value="미필" name="military">미필
				</td>
				</c:when>
				<c:when test="${resumeinfodto.military.substring(0,2)=='면제' }">			
				<td>
				<input type="radio" value="군필" name="military">군필 
				<input style="margin-left: 15px" type="radio" value="면제" name="military" checked="checked">면제
				<input style="margin-left: 15px" type="radio" value="미필" name="military">미필
				</td>
				</c:when>
				<c:otherwise>
				<td>
				<input type="radio" value="군필" name="military">군필 
				<input style="margin-left: 15px" type="radio" value="면제" name="military">면제
				<input style="margin-left: 15px" type="radio" value="미필" name="military" checked="checked">미필
				</td>
				</c:otherwise>
				</c:choose>

			</tr>

			<tr>
				<th rowspan="3">연락처</th>
			</tr>

			<tr>
				<th>휴대폰</th>
				<td>${personalmemberdto.phone }</td>
			</tr>

			<tr>
				<th>이메일</th>
				<td>${personalmemberdto.email }
				</td>
			</tr>


			<tr>
				<th rowspan="3" colspan="2">주소</th>
			</tr>
			<tr>
				<td colspan="3">${personalmemberdto.address }</td>
			</tr>
			<tr>
				<td colspan="3">${personalmemberdto.address2 }</td>
			</tr>

		</table>
		
		<br><br>
		<div style="width: 960px; margin: auto;">
			<h1>학력사항
				<label style="font-size: small;">(${resumeinfodto.education })</label>
			</h1>
		</div>
		
		<div style="text-align: center; margin: auto; background-color: #D9E5FF; border: 2px solid #2478FF; padding-bottom: 15px; padding-top: 15px; width: 960px;">
	 	<c:choose>
		<c:when test="${resumeinfodto.education.substring(0,2)=='초등' }">
		<input type="radio" name="education" value="초등학교 졸업" id="edu" checked="checked">초등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="중학교 졸업" id="edu2">중학교
		<input style="margin-left: 40px;" type="radio" name="education" value="고등학교" id="edhigh">고등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="대학(2,3년)" id="edgreat">대학(2,3년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학교(4년)" id="edgreat2">대학교(4년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학원" id="edgreat3">대학원		
		</c:when>
		<c:when test="${resumeinfodto.education.substring(0,2)=='중학' }">
		<input type="radio" name="education" value="초등학교 졸업" id="edu">초등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="중학교 졸업" id="edu2" checked="checked">중학교
		<input style="margin-left: 40px;" type="radio" name="education" value="고등학교" id="edhigh">고등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="대학(2,3년)" id="edgreat">대학(2,3년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학교(4년)" id="edgreat2">대학교(4년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학원" id="edgreat3">대학원	
		</c:when>
		<c:when test="${resumeinfodto.education.substring(0,2)=='고등' }">
		<input type="radio" name="education" value="초등학교 졸업" id="edu">초등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="중학교 졸업" id="edu2">중학교
		<input style="margin-left: 40px;" type="radio" name="education" value="고등학교" id="edhigh" checked="checked">고등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="대학(2,3년)" id="edgreat">대학(2,3년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학교(4년)" id="edgreat2">대학교(4년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학원" id="edgreat3">대학원		
		</c:when>
		<c:when test="${resumeinfodto.education.substring(0,3)=='대학교' }">
		<input type="radio" name="education" value="초등학교 졸업" id="edu">초등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="중학교 졸업" id="edu2">중학교
		<input style="margin-left: 40px;" type="radio" name="education" value="고등학교" id="edhigh">고등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="대학(2,3년)" id="edgreat">대학(2,3년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학교(4년)" id="edgreat2" checked="checked">대학교(4년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학원" id="edgreat3">대학원
		</c:when>
		<c:when test="${resumeinfodto.education.substring(0,3)=='대학원' }">
		<input style="margin-left: 40px;" type="radio" name="education" value="중학교 졸업" id="edu2">중학교
		<input style="margin-left: 40px;" type="radio" name="education" value="고등학교" id="edhigh">고등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="대학(2,3년)" id="edgreat">대학(2,3년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학교(4년)" id="edgreat2">대학교(4년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학원" id="edgreat3" checked="checked">대학원		
		</c:when>
		<c:otherwise>
		<input type="radio" name="education" value="초등학교 졸업" id="edu">초등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="중학교 졸업" id="edu2">중학교
		<input style="margin-left: 40px;" type="radio" name="education" value="고등학교" id="edhigh">고등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="대학(2,3년)" id="edgreat" checked="checked">대학(2,3년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학교(4년)" id="edgreat2">대학교(4년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학원" id="edgreat3">대학원
		</c:otherwise>
		</c:choose>


		</div>
		<div style="width: 960px; margin: auto;">
		<label style="float: right;">+최근 졸업으로 기제해주시기바랍니다.</label>
		</div>
		<br>
		
		<c:choose>
			<c:when test="${resumeinfodto.termTime.substring(0,1)==','}">
		<div id="school" style="display: none;">
		<div style="width: 960px; margin: auto;">
			<label id="hilabel" style="display: none;">=고등학교</label>
			<label id="grlabel" style="display: none;">=대학·대학교·대학원</label>
		</div>
		<table border="1" style="border-collapse: collapse;">
			<tr style="background-color: #D9E5FF;">
				<th id="hith" style="text-align: left ; display: none;" colspan="2">
				고등학교
				</th>
				<th id="grth" style="text-align: left ; display: none;" colspan="2">
				 대학·대학교·대학원
				</th>	
			</tr>
			
			<tr>
				<th style="text-align: center; background-color: #D9E5FF;">학교명</th>
				<td><input type="text" name="schoolName" placeholder="학교명을입력하세요." style="width: 340px;">
				</td>
			</tr>
			
			<tr>
				<th style="text-align: center; background-color: #D9E5FF;">재학기간</th>
				<td>
				<input type="text" name="termTime" placeholder="0000" style="width: 45px;"> .
				<input type="text" name="termTime" placeholder="00" style="width: 25px;">
				<select name="termTime">
					<option value="입학">입학</option>
					<option value="편입">편입</option>
				</select>
				~
				<input type="text" name="termTime" placeholder="0000" style="width: 45px;"> .
				<input type="text" name="termTime" placeholder="00" style="width: 25px;">
				<select name="termTime">
					<option value="졸업">졸업</option>
					<option value="졸업예정">졸업예정</option>
					<option value="휴학">휴학</option>
					<option value="중퇴">중퇴</option>
					<option value="수료">수료</option>
				</select>	
				</td>
			</tr>
			
			<tr>
				<th style="text-align: center; background-color: #D9E5FF;">전공</th>
				<td id="himajor">
				<select name="major">
					<option value="">계열선택</option>
					<option value="문과계열">문과계열</option>
					<option value="이과계열">이과계열</option>
					<option value="전문(실업)계열">전문(실업)계열</option>
					<option value="예체능계열">예체능계열</option>
				</select>
				</td>
				<td id="grmajor">
				<input type="text" name="major">학과
				</td>
			<tr id="gPA" style="display: none;">
				<th style="text-align: center; background-color: #D9E5FF;">학점</th>
				<td><input type="text" name="gPA" placeholder="학점" style="width: 40px;"> / 
				<select name="gPA">
					<option value="4.5">4.5</option>
					<option value="4.3">4.3</option>
					<option value="4.0">4.0</option>
					<option value="100">100</option>
				</select>
				
				</td>		
			</tr>
		</table>
		</div>
			</c:when>
		<c:otherwise>
			<div id="school" style="display: none;">
		<div style="width: 960px; margin: auto;">
			<label id="hilabel" style="display: none;">=고등학교</label>
			<label id="grlabel" style="display: none;">=대학·대학교·대학원</label>
		</div>
		<table border="1" style="border-collapse: collapse;">
			<tr style="background-color: #D9E5FF;">
				<th id="hith" style="text-align: left ; display: none;" colspan="2">
				고등학교
				</th>
				<th id="grth" style="text-align: left ; display: none;" colspan="2">
				 대학·대학교·대학원
				</th>	
			</tr>
			
			<tr>
				<th style="text-align: center; background-color: #D9E5FF;">학교명</th>
				<td><input type="text" name="schoolName" value="${resumeinfodto.schoolName}" style="width: 340px;">
				</td>
			</tr>
			
			<tr>
				<th style="text-align: center; background-color: #D9E5FF;">재학기간</th>
				<td>
				<input type="text" name="termTime" value="${resumeinfodto.termTime.substring(0,4)}" style="width: 45px;"> .
				<input type="text" name="termTime" value="${resumeinfodto.termTime.substring(5,7)}" style="width: 25px;">
				<c:choose>
					<c:when test="${resumeinfodto.termTime.substring(8,10)=='입학'}">
						<select name="termTime">
						<option value="입학" selected="selected">입학</option>
						<option value="편입">편입</option>
						</select>
					</c:when>
					<c:when test="${resumeinfodto.termTime.substring(8,10)=='편입'}">
						<select name="termTime">
						<option value="입학">입학</option>
						<option value="편입" selected="selected">편입</option>
						</select>					
					</c:when>
				</c:choose>
				~
				<input type="text" name="termTime" value="${resumeinfodto.termTime.substring(11,15)}" style="width: 45px;"> .
				<input type="text" name="termTime" value="${resumeinfodto.termTime.substring(16,18)}" style="width: 25px;">
	 			<c:choose>
					<c:when test="${resumeinfodto.termTime.substring(termTimelast-2,termTimelast)=='졸업'}">
						<select name="termTime">
						<option value="졸업" selected="selected">졸업</option>
						<option value="졸업예정">졸업예정</option>
						<option value="휴학">휴학</option>
						<option value="중퇴">중퇴</option>
						<option value="수료">수료</option>
						</select>
					</c:when>
					<c:when test="${resumeinfodto.termTime.substring(termTimelast-2,termTimelast)=='예정'}">
						<select name="termTime">
						<option value="졸업">졸업</option>
						<option value="졸업예정" selected="selected">졸업예정</option>
						<option value="휴학">휴학</option>
						<option value="중퇴">중퇴</option>
						<option value="수료">수료</option>
						</select>					
					</c:when>
					<c:when test="${resumeinfodto.termTime.substring(termTimelast-2,termTimelast)=='휴학'}">
						<select name="termTime">
						<option value="졸업">졸업</option>
						<option value="졸업예정">졸업예정</option>
						<option value="휴학" selected="selected">휴학</option>
						<option value="중퇴">중퇴</option>
						<option value="수료">수료</option>
						</select>						
					</c:when>
					<c:when test="${resumeinfodto.termTime.substring(termTimelast-2,termTimelast)=='중퇴'}">
						<select name="termTime">
						<option value="졸업">졸업</option>
						<option value="졸업예정">졸업예정</option>
						<option value="휴학">휴학</option>
						<option value="중퇴" selected="selected">중퇴</option>
						<option value="수료">수료</option>
						</select>	
					</c:when>
					<c:when test="${resumeinfodto.termTime.substring(termTimelast-2,termTimelast)=='수료'}">
						<select name="termTime">
						<option value="졸업">졸업</option>
						<option value="졸업예정">졸업예정</option>
						<option value="휴학">휴학</option>
						<option value="중퇴">중퇴</option>
						<option value="수료" selected="selected">수료</option>
						</select>					
					</c:when>
				</c:choose>
				</td>
			</tr>
			
			<tr>
				<th style="text-align: center; background-color: #D9E5FF;">전공</th>
				<td id="himajor">
				<c:choose>
					<c:when test="${resumeinfodto.major.substring(0,2)=='문과'}">
						<select name="major">
						<option value="">계열선택</option>
						<option value="문과계열" selected="selected">문과계열</option>
						<option value="이과계열">이과계열</option>
						<option value="전문(실업)계열">전문(실업)계열</option>
						<option value="예체능계열">예체능계열</option>
						</select>					
					</c:when>
					<c:when test="${resumeinfodto.major.substring(0,2)=='이과'}">
						<select name="major">
						<option value="">계열선택</option>
						<option value="문과계열">문과계열</option>
						<option value="이과계열" selected="selected">이과계열</option>
						<option value="전문(실업)계열">전문(실업)계열</option>
						<option value="예체능계열">예체능계열</option>
						</select>					
					</c:when>
					<c:when test="${resumeinfodto.major.substring(0,2)=='전문'}">
						<select name="major">
						<option value="">계열선택</option>
						<option value="문과계열">문과계열</option>
						<option value="이과계열">이과계열</option>
						<option value="전문(실업)계열" selected="selected">전문(실업)계열</option>
						<option value="예체능계열">예체능계열</option>
						</select>
					</c:when>
					<c:when test="${resumeinfodto.major.substring(0,2)=='예체'}">
						<select name="major">
						<option value="">계열선택</option>
						<option value="문과계열">문과계열</option>
						<option value="이과계열">이과계열</option>
						<option value="전문(실업)계열">전문(실업)계열</option>
						<option value="예체능계열" selected="selected">예체능계열</option>
						</select>					
					</c:when>
					<c:otherwise>
						<select name="major">
						<option value="">계열선택</option>
						<option value="문과계열">문과계열</option>
						<option value="이과계열">이과계열</option>
						<option value="전문(실업)계열">전문(실업)계열</option>
						<option value="예체능계열">예체능계열</option>
						</select>
					</c:otherwise>
				</c:choose>
				</td>
				<c:choose>
					<c:when test="${resumeinfodto.major.substring(0,1)==',' }">
						<td id="grmajor">
						<input type="text" name="major" value="${resumeinfodto.major.substring(1) }">학과
						</td>
					</c:when>
					<c:otherwise>
						<td id="grmajor">
						<input type="text" name="major" value="${resumeinfodto.major }">학과
						</td>
					</c:otherwise>
				</c:choose>

			<tr id="gPA">
				<th style="text-align: center; background-color: #D9E5FF;">학점</th>
				<td><input type="text" name="gPA" value="${resumeinfodto.GPA.substring(0,GPAlast-4)}" style="width: 40px;"> / 
				<c:choose>
					<c:when test="${resumeinfodto.GPA.substring(GPAlast-3,GPAlast)=='4.5'}">
						<select name="gPA">
						<option value="4.5" selected="selected">4.5</option>
						<option value="4.3">4.3</option>
						<option value="4.0">4.0</option>
						<option value="100">100</option>
						</select>
					</c:when>
					<c:when test="${resumeinfodto.GPA.substring(GPAlast-3,GPAlast)=='4.3'}">
						<select name="gPA">
						<option value="4.5">4.5</option>
						<option value="4.3" selected="selected">4.3</option>
						<option value="4.0">4.0</option>
						<option value="100">100</option>
						</select>					
					</c:when> 
					<c:when test="${resumeinfodto.GPA.substring(GPAlast-3,GPAlast)=='4.0'}">
						<select name="gPA">
						<option value="4.5">4.5</option>
						<option value="4.3">4.3</option>
						<option value="4.0" selected="selected">4.0</option>
						<option value="100">100</option>
						</select>					
					</c:when>
					<c:when test="${resumeinfodto.GPA.substring(GPAlast-3,GPAlast)=='100'}">
						<select name="gPA">
						<option value="4.5">4.5</option>
						<option value="4.3">4.3</option>
						<option value="4.0">4.0</option>
						<option value="100" selected="selected">100</option>
						</select>					
					</c:when>
					<c:otherwise>
						<select name="gPA">
						<option value="4.5">4.5</option>
						<option value="4.3">4.3</option>
						<option value="4.0">4.0</option>
						<option value="100" selected="selected">100</option>
					</c:otherwise>
				</c:choose>
				
				</td>		
			</tr>
		</table>
		</div>
			</c:otherwise>
		</c:choose>
		
 		<br><br>
		<div style="width: 960px; margin: auto;">
			<h1>희망근무조건</h1>
			
			<table border="1">
				<tr>
					<th>고용형태</th>
					<c:choose>
						<c:when test="${resumeinfodto.employmentType.substring(0,2)=='정규'}">
							<td>
								<input type="radio" name="employmentType" value="정규직" checked="checked">정규직&nbsp;&nbsp;
								<input type="radio" name="employmentType" value="계약직">계약직&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="병역특례">병역특례&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="프리랜서">프리랜서&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="헤드헌팅">헤드헌팅&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="파견대행">파견대행&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="인턴직">인턴직&nbsp;&nbsp;
							</td>						
						</c:when>
						<c:when test="${resumeinfodto.employmentType.substring(0,2)=='계약'}">
							<td>
								<input type="radio" name="employmentType" value="정규직">정규직&nbsp;&nbsp;
								<input type="radio" name="employmentType" value="계약직" checked="checked">계약직&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="병역특례">병역특례&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="프리랜서">프리랜서&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="헤드헌팅">헤드헌팅&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="파견대행">파견대행&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="인턴직">인턴직&nbsp;&nbsp;
							</td>						
						</c:when>
						<c:when test="${resumeinfodto.employmentType.substring(0,2)=='병역'}">
							<td>
								<input type="radio" name="employmentType" value="정규직">정규직&nbsp;&nbsp;
								<input type="radio" name="employmentType" value="계약직">계약직&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="병역특례" checked="checked">병역특례&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="프리랜서">프리랜서&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="헤드헌팅">헤드헌팅&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="파견대행">파견대행&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="인턴직">인턴직&nbsp;&nbsp;
							</td>						
						</c:when>
						<c:when test="${resumeinfodto.employmentType.substring(0,2)=='프리'}">
							<td>
								<input type="radio" name="employmentType" value="정규직">정규직&nbsp;&nbsp;
								<input type="radio" name="employmentType" value="계약직">계약직&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="병역특례">병역특례&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="프리랜서" checked="checked">프리랜서&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="헤드헌팅">헤드헌팅&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="파견대행">파견대행&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="인턴직">인턴직&nbsp;&nbsp;
							</td>						
						</c:when>
						<c:when test="${resumeinfodto.employmentType.substring(0,2)=='헤드'}">
							<td>
								<input type="radio" name="employmentType" value="정규직">정규직&nbsp;&nbsp;
								<input type="radio" name="employmentType" value="계약직">계약직&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="병역특례">병역특례&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="프리랜서">프리랜서&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="헤드헌팅" checked="checked">헤드헌팅&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="파견대행">파견대행&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="인턴직">인턴직&nbsp;&nbsp;
							</td>						
						</c:when>
						<c:when test="${resumeinfodto.employmentType.substring(0,2)=='파견'}">
							<td>
								<input type="radio" name="employmentType" value="정규직">정규직&nbsp;&nbsp;
								<input type="radio" name="employmentType" value="계약직">계약직&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="병역특례">병역특례&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="프리랜서">프리랜서&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="헤드헌팅">헤드헌팅&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="파견대행" checked="checked">파견대행&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="인턴직">인턴직&nbsp;&nbsp;
							</td>							
						</c:when>
						<c:when test="${resumeinfodto.employmentType.substring(0,2)=='인턴'}">
							<td>
								<input type="radio" name="employmentType" value="정규직">정규직&nbsp;&nbsp;
								<input type="radio" name="employmentType" value="계약직">계약직&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="병역특례">병역특례&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="프리랜서">프리랜서&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="헤드헌팅">헤드헌팅&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="파견대행">파견대행&nbsp;&nbsp; 
								<input type="radio" name="employmentType" value="인턴직" checked="checked">인턴직&nbsp;&nbsp;
							</td>						
						</c:when>
					</c:choose>
				</tr>

 				<tr>
					<th>희망연봉</th>
					<c:choose>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='14'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하" selected="selected">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,4)=='1400'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원" selected="selected">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='16'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원" selected="selected">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='18'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원" selected="selected">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='20'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원" selected="selected">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='22'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원" selected="selected">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='24'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원" selected="selected">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='26'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원" selected="selected">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='28'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원" selected="selected">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='30'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원" selected="selected">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='32'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원" selected="selected">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='34'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원" selected="selected">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>	
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='36'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원" selected="selected">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='38'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원" selected="selected">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:when test="${resumeinfodto.exSalary.substring(0,2)=='40'}">
						<td>
						<select name="exSalary">
								<option value="면접후 결정">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상" selected="selected">4000만원이상</option>
						</select>
						</td>
						</c:when>
						<c:otherwise>
						<td>
						<select name="exSalary">
								<option value="면접후 결정" selected="selected">면접후 결정</option>
								<option value="1400이하">1400이하</option>
								<option value="1400~1600만원">1400~1600만원</option>
								<option value="1600~1800만원">1600~1800만원</option>
								<option value="1800~2000만원">1800~2000만원</option>
								<option value="2000~2200만원">2000~2200만원</option>
								<option value="2200~2400만원">2200~2400만원</option>
								<option value="2400~2600만원">2400~2600만원</option>
								<option value="2600~2800만원">2600~2800만원</option>
								<option value="2800~3000만원">2800~3000만원</option>
								<option value="3000~3200만원">3000~3200만원</option>
								<option value="3200~3400만원">3200~3400만원</option>
								<option value="3400~3600만원">3400~3600만원</option>
								<option value="3600~3800만원">3600~3800만원</option>
								<option value="3800~4000만원">3800~4000만원</option>
								<option value="4000만원이상">4000만원이상</option>
						</select>
						</td>						
						</c:otherwise>																																																																																			
					</c:choose>
				</tr>

				<tr>
					<th>희망근무지</th>
 					<c:choose>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='서울'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 " selected="selected">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='경기'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 " selected="selected">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='인천'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 " selected="selected">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='부산'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 " selected="selected">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='대구'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 " selected="selected">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='대전'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전" selected="selected">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='광주'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 " selected="selected">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='세종'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 " selected="selected">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='울산'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 " selected="selected">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='강원'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 " selected="selected">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='경남'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 " selected="selected">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='경북'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 " selected="selected">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='전남'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 " selected="selected">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='전북'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 " selected="selected">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='충남'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 " selected="selected">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='충북'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 " selected="selected">충북</option>
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						<c:when test="${resumeinfodto.exArea.substring(0,2)=='제주'}">
					<td>
						<select name="exArea">
							<option value="선택">선택</option>
							<option value="서울 ">서울</option>
							<option value="경기 ">경기</option>
							<option value="인천 ">인천</option>
							<option value="부산 ">부산</option>
							<option value="대구 ">대구</option>
							<option value="대전 ">대전</option>
							<option value="광주 ">광주</option>
							<option value="세종 ">세종</option>
							<option value="울산 ">울산</option>
							<option value="강원 ">강원</option>
							<option value="경남 ">경남</option>
							<option value="경북 ">경북</option>
							<option value="전남 ">전남</option>
							<option value="전북 ">전북</option>
							<option value="충남 ">충남</option>
							<option value="충북 ">충북</option>
							<option value="제주 " selected="selected">제주</option>
						</select>
						<input type="text" name="exArea" value="${resumeinfodto.exArea.substring(4,6)}">
					</td>						
						</c:when>
						
					</c:choose>

				</tr>
				<tr>

				<tr>
					<th>지원분야</th>
					<td>
						<input type="text" name="exField" value="${resumeinfodto.exField}">
					</td>
				</tr>
			</table> 
		</div>
		<br><br>
		<div style="text-align: center;">
			<input type="submit" value="다음단계">
		</div>
	</form> 
</body>
</html>