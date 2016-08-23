<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {

    	  var ans1 = ${sdto.ans1};
    	  var ans2 = ${sdto.ans2};
    	  var ans3 = ${sdto.ans3};
    	  var ans4 = ${sdto.ans4};
    	 
        var data = google.visualization.arrayToDataTable([
		  ['Content', 'Vote'],
		  ['${dto.content1}', ans1],
		  ['${dto.content2}', ans2],
		  ['${dto.content3}', ans3],
		  ['${dto.content4}', ans4]
		
// 		  [cd, abc],
			
//           ['Task', 'Hours per Day'],
//           ['Work',     11],
//           ['Eat',      2],
//           ['Commute',  2],
//           ['Watch TV', 2],
//           ['Sleep',    7]
         
        ]);

        var options = {
          title: '${dto.title}'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
</head>
<body>
    <div id="piechart" style="width:900px; height: 500px;"></div>
</body>
</html>