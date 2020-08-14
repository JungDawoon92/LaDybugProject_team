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
<div class="container">
<div class="d-flex justify-content-around mb-3">
<div class="chart-container p-2">
	<canvas id="search_total" class="canvases" width="500" height="250"></canvas>
</div>
<div class="chart-container p-2">
	<canvas id="search_month" class="canvases" width="500" height="250" ></canvas>
</div>
</div>
<div class="d-flex justify-content-around mb-3">
<div class="chart-container p-2">
	<canvas id="search_day" class="canvases" width="500" height="250"></canvas>
</div>
<div class="chart-container p-2">
	<canvas id="search_week_searchAmount" class="canvases" width="500" height="250"></canvas>
</div>
</div>	

</div>

<script>


var SearchCnt_total = [];
var SearchData_total = [];


$.getJSON("search_total", function(result) {
	$.each(result, function(index, value){
		SearchCnt_total.push(value.search_data_cnt);
		SearchData_total.push(value.search_data);
	});
	search_total();
});

var SearchCnt_month = [];
var SearchData_month = [];

$.getJSON("search_month", function(result) {
	$.each(result, function(index, value){
		SearchCnt_month.push(value.search_data_cnt);
		SearchData_month.push(value.search_data);
	});
	search_month();
});

var SearchCnt_day = [];
var SearchData_day = [];

$.getJSON("search_day", function(result) {
	$.each(result, function(index, value){
		SearchCnt_day.push(value.search_data_cnt);
		SearchData_day.push(value.search_data);
	});
	search_day();
});

var searchAmountCnt = [];
var searchSevenDay = [];

$.getJSON("search_week_searchAmount", function(result) {
	$.each(result, function(index, value){
		searchAmountCnt.push(value.search_data_cnt);
		searchSevenDay.push(value.search_data);
	});
	search_week_searchAmount();
});


function search_total() {
	var ctx = document.getElementById('search_total');
	var myChart = new Chart(ctx, {
		type: 'horizontalBar',
		data: {
			labels: SearchData_total,
			datasets: [{
				label: '사이트 검색어 순위(Total)',
				data: SearchCnt_total,
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
	
	
	
	
	
	
function search_month() {
	var ctx = document.getElementById('search_month');
	var myChart = new Chart(ctx, {
		type: 'horizontalBar',
		data: {
			labels: SearchData_month,
			datasets: [{
				label: '사이트 검색어 순위(Month)',
				data: SearchCnt_month,
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
	
	
function search_day() {
	var ctx = document.getElementById('search_day');
	var myChart = new Chart(ctx, {
		type: 'horizontalBar',
		data: {
			labels: SearchData_day,
			datasets: [{
				label: '사이트 검색어 순위(Day)',
				data: SearchCnt_day,
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
	
	
	
function search_week_searchAmount() {
	var ctx = document.getElementById('search_week_searchAmount');

	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: searchSevenDay,
			datasets: [{
				label: '검색량(Day)',
				data: searchAmountCnt,
				borderColor:'rgba(255, 99, 132, 1)',

				borderWidth: 1.2,
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