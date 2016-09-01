<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!-- html5로 고쳐야 스케줄러가 돌아감-->
<meta charset="UTF-8"> 
<html>
<head>

<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
</head>
<body>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<tiles:insertAttribute name="body"></tiles:insertAttribute>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>