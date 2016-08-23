<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 16px; 
} 
</style> 
 <script type="text/JavaScript">

 function inputcheck(frm){
	 var chk_radio1 = document.getElementsByName('resumeNum');
	 var chk_radio2 = document.getElementsByName('portfolioNum');
    var count=0;
	var	fcnt = 0;
     for(var i=0;i<chk_radio1.length;i++){
         if(chk_radio1[i].checked==true){
             count++;
         }
     }
     if(count<=0){
         alert("자소서를 선택 주세요.");
         return false;
     }
	for(var j=0; j<chk_radio2.length;j++){
		if(chk_radio2[j].checked==true){
			fcnt ++;
		}
	}
     if(fcnt<=0){
    	 alert("포트폴리오를 선택해 주세요");
    	 return false;
     }
    
 }
 function resumeInput(){
	 var url = "../resumeinfo/create";
		url += "?memberID=${memberID}"
		open(url,"_blank");
		self.close();
 }

 </script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">등록</DIV>
 
<FORM name='frm' method='POST' action='./create'  onsubmit="return inputcheck(this)">
<input type="hidden" name = "offerNum" value="${param.offerNum}">
<input type="hidden" name = "memberID" value="${param.memberID}">
 <TABLE class='table'>
     
<c:choose>
<c:when test="${cnt>0}">
    <tr>
    <td align="center" colspan="2">
    이미지원하였습니다.
    </td>
    </tr>
 </c:when>
<c:otherwise>
<c:choose>
<c:when test="${pmcnt ==0 }">
<tr>
<td align="center" colspan="2">
이력서 등록이 되어있지 않습니다.<br>
이력서를 등록하십시오<br>
<input type="button" onclick="javascript:resumeInput(this)" value="resume 등록">

</td>
</tr>
</c:when>
<c:otherwise>
<tr>
      <TH colspan="2">지원하시겠습니까?</TH>
</tr>
<tr>
<td>
<c:forEach items="${reList}" var="redto">
<input type="radio" name="resumeNum" value="${redto.resumeNum}">${redto.resumeName }<br>
</c:forEach>
</td>
<td>
<c:forEach items="${pfList }" var="pfdto">
<input type="radio" name="portfolioNum" value="${pfdto.portfolioNum}">${pfdto.portfolioName }<br>
</c:forEach>
</td>
</tr>
<tr>
<td colspan="2">
  <input type='submit' value='등록'>
   <input type='button' value='취소' onclick="window.close();">
</td>
</tr>
</c:otherwise>
</c:choose>
</c:otherwise>
</c:choose>
 </table>


</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 