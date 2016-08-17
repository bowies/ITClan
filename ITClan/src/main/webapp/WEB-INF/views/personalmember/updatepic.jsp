<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table tr td {
	margin: 10px;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
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
<form action="./updatepic" method="post" 
onsubmit="return input(this)" enctype="multipart/form-data">
<input type="hidden" name="memberID" value="${memberID}">
<table style="margin: auto;">

<tr><td>
<img id="photo" src="../storage/resumeInfo_img/${oldfile}"  style="width: 170px; height: 170px;">
</td></tr>
<tr><td>
<input style="text-align: center; width: 77px; margin-top: 10px;" type="file" id="imgInp" name="pictureMF">
</td></tr>
<tr>
<td> <input type="submit" value="확인"></td>
</tr>
</table>
</form>
</body>
</html>