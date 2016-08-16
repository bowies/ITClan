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

<script src="http://code.jquery.com/jquery-1.5.1.min.js"></script>

<script>
function input(f) {
	if(f.disableGrade.cheked==false){
		alert("장애등급을 선택해주세요.");
		f.disableGrade.focus();
		return false;
	}
	
	if(f.military.cheked==false){
		alert("병역사항을 선택해주세요.");
		f.military.focus();
		return false;
	}
	
	if(f.education.selectedIndex==0){
		alert("학력사항을 선택해주세요.");
		f.education.focus();
		return false;
	}
	
	if(f.career.cheked==false){
		alert("경력사항을 선택해주세요.");
		f.career.focus();
		return false;
	}
	
	if(f.disableGrade.cheked==false){
		alert("고용형태를 선택해주세요.");
		f.disableGrade.focus();
		return false;
	}
	
	if(f.exArea.value==""){
		alert("근무지역을 입력해주세요.");
		f.exArea.focus();
		return false;
	}
	
	if(f.exField.value==""){
		alert("근무분야를 입력해주세요.");
		f.exField.focus();
		return false;
	}
}

function licenseCreate(limax){
	if(limax>=5){
		alert("5개 이상");
		return false;
	}else {	
	
	var url = "../license/create";
	wr = window.open(url,"자격증","width=500,height=400"); 
    wr.moveTo((window.screen.width-500)/2, (window.screen.height - 400)/2);// x, y 
    
	}
}

// $('#form_submit').click(function(){
// 	   $.ajax({
// 	        type: 'post',
// 	        url: 'process.php',
// 	        success: function(data){
// 	            alert(data);
// 	        }
// 	   });
// 	    return false; //<- 이 문장으로 새로고침(reload)이 방지됨
// 	});



function externalactivityCreate(exmax){
	if(exmax>=5){
		alert("5개 이상");
		return false;
	}else{
	var url = "../externalactivity/create";
	wr = window.open(url,"자격증","width=500,height=400"); 
    wr.moveTo((window.screen.width-500)/2, (window.screen.height - 400)/2);// x, y 
	}
}
// $(window).load(function(){
// 	 $(".tableadd").click(function(){
// 	  var copyval = $(".clonemodel").find("tbody").clone();
// 	  copyval.find(".tabledel").click(function(){
// 	   $(this).closest("tbody").remove();
// 	  });
// 	  $(".TB").append(copyval);
// 	 }); 
// 	 $(".tabledel").click(function(){
// 	  $(this).closest("tbody").remove();
// 	 });
// 	});
	
/* function downFile(biograph){
	var url = "../download";
	url = url + "?dir=../storage";
	url = url + "&biograph="+biograph;
	 
	location.href=url;
	}

function downFile(portfolio){
	var url = "../download";
	url = url + "?dir=../storage";
	url = url + "&portfolio="+portfolio;
	 
	location.href=url;
	} */
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
	


// 	==================================================
	$(document).ready(function() {
		$("#grade").hide();
		$("#disable").click(function() {
			$("#grade").show();
		});
		$("#normal").click(function () {
			$("#grade").hide();
		});
	});

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
</script>

</head>
<body>
	<form action="./create" method="post"
		 enctype="multipart/form-data" onsubmit="return input(this)">
	
		<input type="hidden" name="memberID" value="${personalmemberdto.memberID }">
		
		<div style="width: 960px; margin: auto;">
			<h1>회원정보</h1>
		</div>
		
		<table border="1">
		
			<tr>
				<td style="width: 80px;" align="center" rowspan="12">
				<img id="photo" src="../images/no_image.JPG" style="width: 170px; height: 170px;">
				
				<input style="text-align: center; width: 77px;" type="file" id="imgInp" name="pictureMF">
				</td>
			</tr>
			<tr>
				<th colspan="2">이름</th>
				<td>${personalmemberdto.name }&nbsp;
					${2016-(birth.substring(0,2)+1900) }
					/ ${personalmemberdto.memberID}</td>
			</tr>

			<tr>
				<th colspan="2">생년월일</th>
				<td colspan="3">
				${birth.substring(0,2)+1900 }년
				${birth.substring(2,4) }월
				${birth.substring(4,6) }일
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
				<input style="margin-left: 20px" type="radio" id="normal" name="disableGrade" value="비장애">비장애
				</td>
			</tr>

			<tr>
				<th colspan="2">병역사항</th>
				<td>
				<input type="radio" value="군필" name="military">군필 
				<input style="margin-left: 15px" type="radio" value="미필" name="military">미필
				<input style="margin-left: 15px" type="radio" value="면제" name="military">면제</td>
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
				<td>${personalmemberdto.email }</td>
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
			<b>최종학력 *</b>
			<select name="education">
				<option value="학력선택">학력선택</option>
				<option value="초등학교">초등학교</option>
				<option value="중학교">중학교</option>
				<option value="고등학교">고등학교</option>
				<option value="대학(2,3년)">대학(2,3)</option>
				<option value="대학교">대학교(4년)</option>
				<option value="대학원">대학원</option>
				
			</select>
			<select name="education">
				<option value="상태선택">상태선택</option>
				<option value="졸업">졸업</option>
				<option value="졸업">졸업예정</option>
				<option value="중퇴">중퇴</option>
				<option value="수료">수료</option>
			</select>
		</div>
		
		<br><br>
		<div style="width: 960px; margin: auto;">
			<h1>경력사항</h1>
		</div>
		
		<div style="text-align: center; margin: auto; background-color: #D9E5FF; border: 2px solid #2478FF; padding-bottom: 15px; padding-top: 15px; width: 960px;">
			<b>경력사항 *</b>
			<input type="radio" name="career" value="신입">신입
			<input type="radio" name="career" value="경력">경력
		</div>
		
		<br><br>
		<div style="width: 960px; margin: auto;">
			<h1>자격증
			<label style="font-size: small;">(최대 5개 입력)</label>
			</h1>
			<tbody>
			
			
			<input type="button" value="+추가" class="tableadd" onclick="licenseCreate('${limax}')"><br><br>
 			<c:forEach var="licensedto" items="${licenselist }">
			<input type="hidden" name="licenseNum" value="${licensedto.licenseNum }">
			<input type="hidden" name="memberID" value="${licenselistdto.memberID }">
			<div style=" margin: auto; background-color: #D9E5FF; border: 2px solid #2478FF; padding-bottom: 15px; padding-top: 15px; width: 960px;">
			<div>
			<label>자격증</label>
			<label style="float: right;"> 
			<input type="button" value="-삭제" class="tabledel" data-onclick-set="N" onclick="location.href='../license/delete'">
			</label>
			</div>
			<hr>
			
			<div>
			<label>자격증명</label>
			<label>
			${licensedto.qualification }
			</label>
			</div>
			<hr>
			
			<div>
			<label>취득일자</label>
			<label>
			${licensedto.takeDate }
			</label>
			</div>
			</div>
			<br>
			</c:forEach>
			
			</tbody>
		</div>
		
		<br><br>
		<div style="width: 960px; margin: auto;">
			<h1>대외활동
			<label style="font-size: small;">(최대 5개 입력)</label>
			</h1>
			
			<input type="button" value="+추가" onclick="externalactivityCreate('${exmax}')"><br><br>
			
 			<c:forEach var="externalactivitydto" items="${externalactivitylist }">
			<input type="hidden" name="actNum" value="${externalactivitydto.actNum }">
			<input type="hidden" name="memberID" value="${externalactivitydto.memberID }">
			<div style=" margin: auto; background-color: #D9E5FF; border: 2px solid #2478FF; padding-bottom: 15px; padding-top: 15px; width: 960px;">
			<div>
			<label>대외활동</label>
			<label style="float: right;"> 
			<input type="button" value="-삭제" onclick="location.href='../externalactivity/delete'">
			</label>
			</div>
			<hr>
			
			<div>
			<label>활동구분</label>
			<label>
			${externalactivitydto.actSector }
			</label>
			</div>
			<hr>
			
			<div>
			<label>활동기간</label>
			<label>
			${externalactivitydto.actPeriod }
			</label>
			</div>
			<hr>
			
			<div>
			<label>활동내용</label>
			<label>
			${externalactivitydto.actContent }
			</label>
			</div>
			</div>
			<br>
			</c:forEach>
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
							<option>1400이하</option>
							<option>1400~1600만원</option>
							<option>1600~1800만원</option>
							<option>1800~2000만원</option>
							<option>2000~2200만원</option>
							<option>2200~2400만원</option>
							<option>2400~2600만원</option>
							<option>2600~2800만원</option>
							<option>2800~3000만원</option>
							<option>3000~3200만원</option>
							<option>3200~3400만원</option>
							<option>3400~3600만원</option>
							<option>3600~3800만원</option>
							<option>3800~4000만원</option>
							<option>4000만원이상</option>
					</select>
					</td>
				</tr>

				<tr>
					<th>희망근무지</th>
					<td>
						<input type="text" name="exArea" placeholder="지역">
						<input type="text" name="exArea" placeholder="상세지역">
					</td>
				</tr>

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