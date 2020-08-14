<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<style>
	.canvases {
		display: block;
		width: 500px;
		height: 250px;
	}
	.chart-container {
		margin-bottom: 40px;
		margin-right: 40px;
		margin-left: 40px; width: 501px;
	}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/include/adminNav.jsp"></jsp:include>
<jsp:include page="/WEB-INF/include/chartNav.jsp" />

	<div>
			<canvas id="boot_totalchart" style="height:30vw; width:50vw; margin: auto;"></canvas>
	</div>

<script>
var bootCnt_total = [];
var bootData_total = [];


$.getJSON("boot_totalchart", function(result) {
	$.each(result, function(index, value){
		bootCnt_total.push(value.faq_rc);
		bootData_total.push(value.faq_category);
	});
	boot_total();
});

function boot_total() {
	var ctx = document.getElementById('boot_totalchart');
	var myChart = new Chart(ctx, {
		type: 'horizontalBar',
		data: {
			labels: bootData_total,
			datasets: [{
				label: '봇 문의 대주제 순위(Total)',
				data: bootCnt_total,
				backgroundColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1.2
			}]
		},
		options: {
			responsive: false,
			scales: {
				xAxes: [{
		            barPercentage: 0.6
		        }],
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
	}
</script>

</body>
</html>