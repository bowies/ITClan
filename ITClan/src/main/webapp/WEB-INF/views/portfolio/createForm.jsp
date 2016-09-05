<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.multiColumn #ed {
    width:170px;
    height:230px;
    margin:0 2px;
    border:1px #ddd solid;
    float:left
}

.multiColumn #fd {
    width:270px;
    height:230px;
    margin:0 2px;
    border:1px #ddd solid;
    float:left
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">

function input(f){
	if(f.a.checked==false){
		alert("선택하십시오");
		return false;
	}
	
	if(f.a.checked==true && f.portfolioMF.value==""){	
		alert("파일이 없습니다.");
		return false;
	}
	
		var pomax = ${pomax}
		if(pomax>=5){
			alert("5개이상");
			window.self.close();
			return false;
	}
}	
	

$(function () {
    contentLayAutoWidth();
});

$(window).resize(function () {
    contentLayAutoWidth();
});

function contentLayAutoWidth() {
    $('.multiColumn > .pct').css("width", function (index) {
        var siblingsWidthSum = 0;
        var parentPadding = 1;
        var siblingsMargin = 50;
        var parentWidth = $(this).parent().innerWidth();
        $(this).siblings().each(function () {
            siblingsWidthSum = siblingsWidthSum + ($(this).outerWidth() + siblingsMargin);
        });
        index = parentWidth - siblingsWidthSum - parentPadding;
        return index;
    });
}

$(document).ready(function() {
		$("#portfolioFile").hide();
	$("#portfolio").click(function() {
		$("#portfolioFile").show();

	});
});	

</script>
</head>
<body>
<form action="./create" method="post"
		enctype="multipart/form-data" onsubmit="return input(this)">
		<input type="hidden" name="memberID" value="${memberID }">
<div class='multiColumn'>
<div id="fd">
	<div style="text-align: center; background-color: #D9E5FF; ">선택사항</div>
	<br>
	
    <div style="text-align: center;">
    <label style="margin-right: 20px;">
    <input type="radio" name="a" value="포트폴리오" id="portfolio">포트폴리오
    </label>
    </div>
       
    <br>
    <div>
    <label id="portfolioFile">
    <input style="margin-left:30px; width: 180px;" type="file" name="portfolioMF">
    </label>
    
    <label style="float: right;">
    <input type="image"src="../image/화살표.png" width="50">
    </label>
    </div>   
  	<br>

</div>

<div id="ed">
	<div style="text-align: center; margin-bottom: 7px; background-color: #D9E5FF; ">포트폴리오</div>
	<c:forEach var="portfoliodto" items="${portfoliolist }">
	<div style="text-align: center; margin-bottom: 10px;">${portfoliodto.portfolioName }</div>
	<hr>
	</c:forEach>
</div>
</div>
</form>
</body>
</html>