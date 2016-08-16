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
	if(f.pictureMF.value==''){
			alert("사진을 올려주세요.");
			f.pictureMF.focus();
			return false;
		}
	 
	if(f.disableGrade[0].checked==false && f.disableGrade[2].checked==false){
		alert("장애등급을 선택해주세요.");
		f.disableGrade[0].focus();
		return false;
	}
	
	if(f.disableGrade[0].checked==true && f.disableGrade[1].selectedIndex==0){
		alert("장애등급을 선택해주세요.");
		f.disableGrade[0].focus();
		return false;
	} 	
	
	if(f.military[0].checked==false && f.military[1].checked==false && f.military[2].checked==false){
		alert("병역사항을 선택해주세요.");
		f.military[0].focus();
		return false;
	}
	
	if(f.education[0].checked==false && f.education[1].checked==false &&
			f.education[2].checked==false && f.education[3].checked==false &&
			f.education[4].checked==false && f.education[5].checked==false){
		alert("학력사항을 선택해주세요.");
		f.education[0].focus();
		return false;
	}	
	
	if(f.employmentType[0].checked==false && f.employmentType[1].checked==false &&
			f.employmentType[2].checked==false && f.employmentType[3].checked==false &&
			f.employmentType[4].checked==false && f.employmentType[5].checked==false &&
			f.employmentType[6].checked==false){
		alert("고용형태를 선택해주세요.");
		f.employmentType[0].focus();
		return false;
	}

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


/*  var cnt=1;

function licenseCreate(){
	if(cnt<=4){
		alert(cnt)
		cnt+=1;
		var copyval = $(".license").find("#lidiv").clone();
		  
		copyval.find("#lidel").click(function(){
			alert("자격증을 삭제하시겠습니까?");
			  cnt-=1;
				alert(cnt)
			  $(this).closest("#lidiv").remove();
		});
		$("#TD").append(copyval);
	}else{
		alert("5개 이상을 추가할수없습니다.");
		return false;
	}
}
$(document).ready(function() {
	  $("#TDdel").click(function(){
		  alert("자격증을 삭제하시겠습니까?");
		  alert(cnt)
		  cnt-=1;
		  $(this).closest("#TDdiv").remove();
	  }); 
}); 


function externalactivityCreate(){
if(cnt<=4){
	cnt+=1;
	  var copyval = $(".activity").find("#actdiv").clone();
	  alert(cnt);
	  copyval.find("#actdel").click(function(){
		 if(cnt == 1){
			  alert("경력사항 항목은 최소 1개 이상 입력하셔야 합니다.");
		  }else {
			  alert("경력사항을 삭제하시겠습니까?");
			  cnt-=1;
			  $(this).closest("#actdiv").remove();
		  } 
	  });
	  $("#TB").append(copyval);
}else {
	alert("5개 이상을 추가할수없습니다.");
	return false;
	}
} 
$(document).ready(function() {
	  $("#TBdel").click(function(){
		   if(cnt == 1){	   
				  alert("경력사항 항목은 최소 1개 이상 입력하셔야 합니다.");
		  }else {
			  alert("경력사항을 삭제하시겠습니까?");
			  cnt-=1;
			  $(this).closest("#TBdiv").remove();
		  } 
	  }); 
}); */


//---------------------------------------------------------------------------------------

	//장애등급
	$(document).ready(function() {
		$("#grade").hide();
		$("#disable").click(function() {
			$("#grade").show();
		});
		$("#normal").click(function() {
			$("#grade").hide();
		});
	});
	//---------------------------------------//

	
	
	//사진 보여주기
	$(document).ready(function() {
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function(e) {
					//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$('#photo').attr('src', e.target.result);
					//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
					//(아래 코드에서 읽어들인 dataURL형식)
				}
				reader.readAsDataURL(input.files[0]);
				//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}//readURL()--

		//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
		$("#imgInp").change(function() {
			//alert(this.value); //선택한 이미지 경로 표시
			readURL(this);
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
	//---------------------------------------//
</script>
</head>
<body>
	<form action="./nextcreate" method="post"
		enctype="multipart/form-data" onsubmit="return input(this)">
		 
		<input type="hidden" name="memberID" value="${personalmemberdto.memberID }">
		
		<div style="width: 960px; margin: auto;">
			<h1>회원정보</h1>
		</div>
		
		<table border="1">
			<tr>
				<td style="width: 80px;" align="center" rowspan="12">
				<img id="photo" src="../images/no_image.JPG" style="width: 170px; height: 170px;">
				<input style="text-align: center; width: 77px; margin-top: 10px;" type="file" id="imgInp" name="pictureMF">
				</td>
			</tr>
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
				<td>
				<input type="radio" id="disable" name="disableGrade" value="장애">장애 
				<select id="grade" name="disableGrade">
						<option value="----">----
						<option value="1등급">1등급
						<option value="2등급">2등급
						<option value="3등급">3등급
						<option value="4등급">4등급
						<option value="5등급">5등급
						<option value="6등급">6등급
				</select>
				<input style="margin-left: 15px" type="radio" id="normal" name="disableGrade" value="비장애">비장애
				</td>
			</tr>

			<tr>
				<th colspan="2">병역사항</th>
				<td>
				<input type="radio" value="군필" name="military">군필 
				<input style="margin-left: 15px" type="radio" value="면제" name="military">면제
				<input style="margin-left: 15px" type="radio" value="미필" name="military">미필
				</td>
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
			<h1>학력사항</h1>
		</div>
		
		<div style="text-align: center; margin: auto; background-color: #D9E5FF; border: 2px solid #2478FF; padding-bottom: 15px; padding-top: 15px; width: 960px;">
		<input type="radio" name="education" value="초등학교 졸업" id="edu">초등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="중학교 졸업" id="edu2">중학교
		<input style="margin-left: 40px;" type="radio" name="education" value="고등학교" id="edhigh">고등학교
		<input style="margin-left: 40px;" type="radio" name="education" value="대학(2,3년)" id="edgreat">대학(2,3년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학교(4년)" id="edgreat2">대학교(4년)
		<input style="margin-left: 40px;" type="radio" name="education" value="대학원" id="edgreat3">대학원

		</div>
		<div style="width: 960px; margin: auto;">
		<label style="float: right;">+최근 졸업으로 기제해주시기바랍니다.</label>
		</div>
		<br>
		
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
		
 		<br><br>
		<div style="width: 960px; margin: auto;">
			<h1>희망근무조건</h1>
			
			<table border="1">
				<tr>
					<th>고용형태</th>
					<td>
						<input type="radio" name="employmentType" value="정규직">정규직&nbsp;&nbsp;
						<input type="radio" name="employmentType" value="계약직">계약직&nbsp;&nbsp; 
						<input type="radio" name="employmentType" value="병역특례">병역특례&nbsp;&nbsp; 
						<input type="radio" name="employmentType" value="프리랜서">프리랜서&nbsp;&nbsp; 
						<input type="radio" name="employmentType" value="헤드헌팅">헤드헌팅&nbsp;&nbsp; 
						<input type="radio" name="employmentType" value="파견대행">파견대행&nbsp;&nbsp; 
						<input type="radio" name="employmentType" value="인턴직">인턴직&nbsp;&nbsp;
					</td>
				</tr>

 				<tr>
					<th>희망연봉</th>
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
							<option value="4000만원이상">4000만원이상</option>
					</select>
					</td>
				</tr>

				<tr>
					<th>희망근무지</th>
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
							<option value="제주 ">제주</option>
						</select>
						<input type="text" name="exArea" placeholder="상세지역">
					</td>
				</tr>
				<tr>

				<tr>
					<th>지원분야</th>
					<td>
						<input type="text" name="exField">
					</td>
				</tr>
			</table> 
		</div>

		<br><br>
		<div style="text-align: center;">
			<input type="submit" value="전송">
		</div>
	</form> 
</body>
</html>