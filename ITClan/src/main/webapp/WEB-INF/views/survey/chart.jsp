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

        var data = google.visualization.arrayToDataTable([
                                                          
		  ['${dto.content1}', '${sdto.ans1}'],
          ['${dto.content2}', '${sdto.ans2}'],
          ['${dto.content3}', '${sdto.ans3}'],
          ['${dto.content4}', '${sdto.ans4}']
         
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