<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!-- html5로 고쳐야 스케줄러가 돌아감-->
<html>
<head>
<meta charset="UTF-8"> 
<title><tiles:getAsString name="title"/></title>새로운 이벤트
<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
</head>
<body>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>