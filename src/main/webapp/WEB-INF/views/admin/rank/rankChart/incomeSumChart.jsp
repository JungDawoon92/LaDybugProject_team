<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">

	<jsp:include page="/WEB-INF/include/adminNav.jsp" />
	<jsp:include page="/WEB-INF/include/chartNav.jsp" />

	
	<br>
	<h1>월별 종합 매출액 차트</h1>
	<div>
		<canvas id="incomeCanvas" style="height:30vw; width:50vw; margin:auto"></canvas>
	</div>
	<br><br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>월</th>
				<th>매출액</th>
				<th>월별레시피</th>
				<th>월별식재료</th>
				<th>월별회원</th>
			</tr>
		</thead>
		<tbody id="incomeSumChartTable">
			
		</tbody>
	</table>
	
	<!-- 상세보기 모달창 -->
	<div class="modal fade" id="cateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-left" id="exampleModalLabel"></h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
				</div>
				<div class="modal-body" id="cateChart">
					<canvas id="canvas" style="height:30vw; width:50vw; margin: auto;"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function () {
	$('.dropdown-toggle').dropdown();
});

window.chartColors = {
	red: 'rgb(255, 99, 132)',
	orange: 'rgb(255, 159, 64)',
	yellow: 'rgb(255, 205, 86)',
	green: 'rgb(75, 192, 192)',
	blue: 'rgb(54, 162, 235)',
	purple: 'rgb(153, 102, 255)',
	grey: 'rgb(201, 203, 207)'
	};
		
var incomeChartLabels = [];
var incomeChartData = [];

$.ajax({
	url : "getIncomeSumChart.rk.ad",
	type : "POST",
	dataType : "JSON",
	success : function(result) {
		$.each(result, function(index, value) {
			incomeChartLabels.push(value.month + "월");
			incomeChartData.push(value.income_sum);
			var row="";
			row += "<tr><td>"+value.month+" 월</td>";
			row += "<td>"+value.income_sum+" 원</td>";
			row += "<td><a type='button' class='btn btn-outline-danger btn-sm' data-toggle='modal' data-target='#cateModal' data-check='topRecipe' data-month='"+value.month+"' href=''>판매TOP레시피</a></td>";
			row += "<td><a type='button' class='btn btn-outline-danger btn-sm' data-toggle='modal' data-target='#cateModal' data-check='topIngre' data-month='"+value.month+"' href=''>판매TOP식재료</a></td>";
			row += "<td><a type='button' class='btn btn-outline-danger btn-sm' data-toggle='modal' data-target='#cateModal' data-check='topMember' data-month='"+value.month+"' href=''>구매TOP회원</a></td></tr>";
			
			$("#incomeSumChartTable").append(row);
			
		});
		incomeChart();
	},
	error: function(request, status, error) {
		alert("status : " + status);
	}
});

function incomeChart() {
	var ctx = document.getElementById("incomeCanvas").getContext("2d");
	var color = Chart.helpers.color;
	var likeChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: incomeChartLabels,
			datasets: [{
				label: '매출액',
				data: incomeChartData,
				backgroundColor : color(window.chartColors.green).alpha(0.5).rgbString(),
				borderColor : window.chartColors.green,
				borderWidth: 1
			}]
		},
		options: {
			scales: {
				xAxes: [{
					scaleLabel: {
						display: true,
						labelString: '월별'
					},
					ticks: {
						beginAtZero:true
					}
				}],
				yAxes: [{
					scaleLabel:{
						display: true,
						labelString: '매출액'
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
				display: true,
				position: 'top',
			},
			title: {
				display: true,
				text: '월별 매출액'
			}
		}
	});
}
/* 모달 차트 */
$('#cateModal').on('show.bs.modal', function(event) {
	var cateChartLabels = [];
	var cateChartData = [];
	var check = $(event.relatedTarget).data('check');
	var mt = $(event.relatedTarget).data('month');
	$("#cateChart").empty();
	$("#cateChart").append("<canvas id='canvas' style='height:30vw; width:50vw; margin: auto;'></canvas>");
	
	
	if(check == 'topRecipe') {
		$.ajax({
			url: "getMonthTopRecipeIncomeChart.rk.ad",
			type: "POST",
			data: {month : mt},
			dataType : "JSON",
			success : function(result) {
				$.each(result, function(index, value) {
					cateChartLabels.push((value.recipe_nm).substring(0,3)+"...");
					cateChartData.push(value.recipe_income);
				});
			},
			error: function(request, status, error) {
				alert("status : " + status);
			}
		});

		var modal = $(this);
		var canvas = modal.find('.modal-body canvas');
		modal.find('.modal-title').html('판매 TOP 레시피');
		var ctx = canvas[0].getContext("2d");
		var color = Chart.helpers.color;
		var cateChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: cateChartLabels,
				datasets: [{
					label: '판매량',
					data:cateChartData,
					backgroundColor : [
						color(window.chartColors.red).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString()
					],
					borderColor : [
						window.chartColors.red,
						window.chartColors.blue,
						window.chartColors.blue,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green
					],
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					xAxes: [{
						scaleLabel: {
							display: true,
							labelString: '레시피'
						},
						ticks: {
							beginAtZero:true
						}
					}],
					yAxes: [{
						scaleLabel:{
							display: true,
							labelString: '매출액'
						},
						ticks: {
							beginAtZero:true
						}
					}]
				},
				responsive: true,
				//maintainAspectRatio : false,
				animation:{ 
					duration: 500,
				}, 
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '판매 TOP 레시피'
				}
			}
		});
		
	}else if(check == 'topIngre') {
		$.ajax({
			url: "getMonthTopIngredientIncomeChart.rk.ad",
			type: "POST",
			data: {month : mt},
			dataType : "JSON",
			success : function(result) {
				$.each(result, function(index, value) {
					cateChartLabels.push((value.ingredient_nm).substring(0, 3) + "...");
					cateChartData.push(value.ingredient_income);
				});
			},
			error: function(request, status, error) {
				alert("status : " + status);
			}
		});

		var modal = $(this);
		var canvas = modal.find('.modal-body canvas');
		modal.find('.modal-title').html('판매 TOP 식재료');
		var ctx = canvas[0].getContext("2d");
		var color = Chart.helpers.color;
		var cateChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: cateChartLabels,
				datasets: [{
					label: '판매량',
					data:cateChartData,
					backgroundColor : [
						color(window.chartColors.red).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString()
					],
					borderColor : [
						window.chartColors.red,
						window.chartColors.blue,
						window.chartColors.blue,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green
					],
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					xAxes: [{
						scaleLabel: {
							display: true,
							labelString: '식재료'
						},
						ticks: {
							beginAtZero:true
						}
					}],
					yAxes: [{
						scaleLabel:{
							display: true,
							labelString: '매출액'
						},
						ticks: {
							beginAtZero:true
						}
					}]
				},
				responsive: true,
				//maintainAspectRatio : false,
				animation:{ 
					duration: 500,
				}, 
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '판매 TOP 식재료'
				}
			}
		});
		
	}else if(check == 'topMember') {
		$.ajax({
			url: "getMonthTopMemberChart.rk.ad",
			type: "POST",
			data: {month : mt},
			dataType : "JSON",
			success : function(result) {
				$.each(result, function(index, value) {
					cateChartLabels.push(value.member_id);
					cateChartData.push(value.income_sum);
				});
			},
			error: function(request, status, error) {
				alert("status : " + status);
			}
		});
	
		var modal = $(this);
		var canvas = modal.find('.modal-body canvas');
		modal.find('.modal-title').html('구매 TOP 회원');
		var ctx = canvas[0].getContext("2d");
		var color = Chart.helpers.color;
		var cateChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: cateChartLabels,
				datasets: [{
					label: '매출액',
					data:cateChartData,
					backgroundColor : [
						color(window.chartColors.red).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString()
					],
					borderColor : [
						window.chartColors.red,
						window.chartColors.blue,
						window.chartColors.blue,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green,
						window.chartColors.green
					],
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					xAxes: [{
						scaleLabel: {
							display: true,
							labelString: '회원'
						},
						ticks: {
							beginAtZero:true
						}
					}],
					yAxes: [{
						scaleLabel:{
							display: true,
							labelString: '매출액'
						},
						ticks: {
							beginAtZero:true
						}
					}]
				},
				responsive: true,
				//maintainAspectRatio : false,
				animation:{ 
					duration: 500,
				}, 
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '구매 TOP회원'
				}
			}
		});
	}
	
}).on('hidden.bs.modal', function(event) {
	var modal = $(this);
	var canvas = modal.find('.modal-body canvas');
	canvas.attr('width', '50vw').attr('height', '30vw');
	// destroy modal
	$(this).data('bs.modal', null);
});
</script>
</body>
</html>