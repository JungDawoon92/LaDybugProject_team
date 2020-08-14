<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<body>
<jsp:include page="/WEB-INF/include/adminNav.jsp"></jsp:include>
<jsp:include page="/WEB-INF/include/chartNav.jsp" />
<div class="container">

<div class="d-flex justify-content-around mb-3">
	<div class="chart-container p-2">
		<canvas id="birthCanvas" style="height:30vw; width:33vw; margin: auto;"></canvas>
	</div>
	<div class="chart-container p-2">
		<canvas id="loginCanvas" style="height:30vw; width:33vw; margin: auto;"></canvas>
	</div>
</div>
<div class="ageContainer">
	<div>
		<canvas id="ageCanvas" style="height:30vw; width:33vw; margin: auto;"></canvas>
	</div>
</div>
</div>
</body>
<script>
window.chartColors = {
	red: 'rgb(255, 99, 132)',
	orange: 'rgb(255, 159, 64)',
	yellow: 'rgb(255, 205, 86)',
	green: 'rgb(75, 192, 192)',
	blue: 'rgb(54, 162, 235)',
	purple: 'rgb(153, 102, 255)',
	grey: 'rgb(201, 203, 207)'
	};
	
var birthLabels = [];
var birthData = [];


$.getJSON("birthGraph", function(result) {
	$.each(result, function(index, value){
		birthLabels.push(value.member_join);
		birthData.push(value.dayByMemberCnt);
	});
	birthChart();
});

function birthChart() {
	var ctx = document.getElementById("birthCanvas").getContext("2d");
	var color = Chart.helpers.color;
	var birthChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: birthLabels,
			datasets: [{
				label:'회원 수',
				data:birthData,
				borderColor: window.chartColors.red,
				borderWidth: 1
			}]
		},
		options: {
			scales: {
				xAxes: [{
					scaleLabel: {
						display: true,
						labelString: '가입 일자'
					}
				}],
				yAxes: [{
					scaleLabel:{
						display: true,
						labelString: '회원 수'
					},
					ticks: {
						beginAtZero:true
					}
				}]
			},
			responsive: false,
			//maintainAspectRatio : false,
			animation:{ 
				duration: 500,
			}, 
			legend: {
				position: 'top',
			},
			title: {
				display: true,
				text: '회원가입 일자별 그래프'
			}
		}
	});
}
</script>

<script>
window.chartColors = {
	red: 'rgb(255, 99, 132)',
	orange: 'rgb(255, 159, 64)',
	yellow: 'rgb(255, 205, 86)',
	green: 'rgb(75, 192, 192)',
	blue: 'rgb(54, 162, 235)',
	purple: 'rgb(153, 102, 255)',
	grey: 'rgb(201, 203, 207)'
	};
	
var loginCntLabels = [];
var loginCntData = [];


$.getJSON("loginGraph", function(result) {
	$.each(result, function(index, value){
		loginCntLabels.push(value.login_member_date);
		loginCntData.push(value.login_member_cnt);
	});
	loginChart();
});

function loginChart() {
	var ctx = document.getElementById("loginCanvas").getContext("2d");
	var color = Chart.helpers.color;
	var birthChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: loginCntLabels,
			datasets: [{
				label:'로그인 횟수',
				data:loginCntData,
				borderColor: window.chartColors.black,
		       	backgroundColor: [		       		
		       		color(window.chartColors.green).alpha(0.5).rgbString(),     		
	             ],
				borderWidth: 1
			}]
		},
		options: {
			scales: {
				xAxes: [{
					scaleLabel: {
						display: true,
						labelString: '접속 일자'
					}
				}],
				yAxes: [{
					scaleLabel:{
						display: true,
						labelString: '로그인 횟수'
					},
					ticks: {
						beginAtZero:true
					}
				}]
			},
			responsive: false,
			//maintainAspectRatio : false,
			animation:{ 
				duration: 500,
			}, 
			legend: {
				position: 'top',
			},
			title: {
				display: true,
				text: '날짜별 로그인 횟수 그래프'
			}
		}
	});
}
</script>

<script>
window.chartColors = {
	red: 'rgb(255, 99, 132)',
	orange: 'rgb(255, 159, 64)',
	yellow: 'rgb(255, 205, 86)',
	green: 'rgb(75, 192, 192)',
	blue: 'rgb(54, 162, 235)',
	purple: 'rgb(153, 102, 255)',
	grey: 'rgb(201, 203, 207)'
	};
	
var ageData = [];


$.getJSON("ageGraph", function(result) {
	$.each(result, function(index, value){
		ageData.push(value.age_10, value.age_20, value.age_30, value.age_40, value.age_50, value.age_60);
	});
	ageChart();
});

function ageChart() {
	var ctx = document.getElementById("ageCanvas").getContext("2d");
	var color = Chart.helpers.color;
	var ageChart = new Chart(ctx, {
		type: 'polarArea',
		data: {
			labels: [
					'10대',
	       			'20대',
	       			'30대',
	       			'40대',
	       			'50대',
	       			'60대'
	       			],
			datasets: [{
				label:'연령별 회원수',
				data:ageData,
		       	backgroundColor: [
		       		color(window.chartColors.red).alpha(0.5).rgbString(),
		       		color(window.chartColors.orange).alpha(0.5).rgbString(),
		       		color(window.chartColors.yellow).alpha(0.5).rgbString(),
		       		color(window.chartColors.green).alpha(0.5).rgbString(),
		       		color(window.chartColors.blue).alpha(0.5).rgbString(),
		       		color(window.chartColors.grey).alpha(0.5).rgbString(),
	             ],
				borderWidth: 1
			}]
		},
		options:{
			title: {
				display: true,
				text: '연령별 회원수'
			}
		}
	});
}

</script>
</html>