<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<html>
<head>

<meta charset="UTF-8">
<title>GOLD★STAR</title>
<script type="text/javascript">
function offer() {
	var url = "offer";
	
	location.href = url;
}
</script>
<style>
body{background-image: url('./image/back (2).jpg')}

</style>
</head>
<body>


<div>
<a href = "javascript:offer()" target="_self">
<img src="./image/offer.jpg" style="position: absolute; top: 150px; left: 200px; width: 400px;">

</a>

</div>









<div>
<a href = "./hunting" target="_self">
<img src="./image/hunting.jpg"  style="position: absolute; top: 150px; left: 700px; width: 400px;">
</a>
 </div>

</body>
</html>