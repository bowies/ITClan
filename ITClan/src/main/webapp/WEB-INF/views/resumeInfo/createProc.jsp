<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
학교명 :
${resumeinfodto.schoolName }
</div>
<div>
전공
${resumeinfodto.major }
</div>
<div>
학점
${resumeinfodto.GPA }
</div>
<div>
아이디
${resumeinfodto.memberID }
</div>
<div>
경력
${resumeinfodto.education }
</div>
<div>
학력
${resumeinfodto.career }
</div>
<div>
고용형태
${resumeinfodto.employmentType }
</div>
<div>
월급
${resumeinfodto.exSalary }
</div>
<div>
장애등급
${resumeinfodto.disableGrade }
</div>

<div>
사진
${resumeinfodto.picture }
</div>
<div>
근무지
${resumeinfodto.exArea }
</div>
<div>
지원분야
${resumeinfodto.exField }
</div>
<div>
병역
${resumeinfodto.military }
</div>
<div>
재학기간
${resumeinfodto.termTime }
</div>
<div>
자격증명
${licensedto.qualification }
</div>
<div>
자격증 딴 기간
${licensedto.takeDate }
</div>
<table>
<c:forEach var="externalactivitydto" items="${externalactivitylist }">
<tr style="text-align: center;">
<td>
${externalactivitydto.actPeriod }
</td>
<td>
${externalactivitydto.actContent }
</td>
<td>
${externalactivitydto.actSector }
</td>
</tr>
</c:forEach>
</table>
</body>
</html>