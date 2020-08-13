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

	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">매출액 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveIncomeSumChart.rk.ad">월별 종합 매출액 차트</a>
				<a class="dropdown-item" href="moveIncomeDetailChart.rk.ad">매출액 상세 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown">레시피 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveLikeChart.rk.ad">누적 레시피 차트</a>
				<a class="dropdown-item" href="moveMonthTopRecipeChart.rk.ad">월별 top 레시피 차트</a>
				<a class="dropdown-item" href="moveWeekTopRecipeChart.rk.ad">주별 top 레시피 차트</a>
				<a class="dropdown-item" href="moveDayTopRecipeChart.rk.ad">일별 top 레시피 차트</a>
				<a class="dropdown-item" href="moveCommentTopChart.rk.ad">이용후기 top 레시피 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown">구독자 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveSubChart.rk.ad">누적 쉐프 차트</a>
				<a class="dropdown-item" href="moveMonthTopChefChart.rk.ad">월별 top 쉐프 차트</a>
				<a class="dropdown-item" href="moveWeekTopChefChart.rk.ad">주별 top 쉐프 차트</a>
				<a class="dropdown-item" href="moveDayTopChefChart.rk.ad">일별 top 쉐프 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle active" href="" data-toggle="dropdown">식재료 판매량 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveSellIngredientChart.rk.ad">누적 식재료 판매량 차트</a>
				<a class="dropdown-item" href="moveMonthTopIngredientChart.rk.ad">월별 식재료 판매량 차트</a>
				<a class="dropdown-item" href="moveWeekTopIngredientChart.rk.ad">주별 식재료 판매량 차트</a>
				<a class="dropdown-item" href="moveDayTopIngredientChart.rk.ad">일별 식재료 판매량 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown">레시피 판매량 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveSellRecipeChart.rk.ad">누적 레시피 판매량 차트</a>
				<a class="dropdown-item" href="moveMonthTopSellRecipeChart.rk.ad">월별 레시피 판매량 차트</a>
				<a class="dropdown-item" href="moveWeekTopSellRecipeChart.rk.ad">주별 레시피 판매량 차트</a>
				<a class="dropdown-item" href="moveDayTopSellRecipeChart.rk.ad">일별 레시피 판매량 차트</a>
			</div>
		</li>
	</ul>
	<br>
	<h1>식재료 판매량 차트</h1>
	<div>
		<canvas id="ingreCanvas" style="height:30vw; width:50vw; margin: auto;"></canvas>
	</div>
	<br><br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>식재료 순위</th>
				<th>식재료 번호</th>
				<th>식재료명</th>
				<th>판매량</th>
				<th>등록일</th>
				<th>벤자민버튼</th>
			</tr>
		</thead>
		<tbody id="ingreChartTable">
			
		</tbody>
	</table>
	
	<!-- 페이징 -->
	<div id="paging" class="text-center">
		<jsp:include page="sellIngredientChartPaging.jsp"/>
	</div>
	
	<!-- 상세보기 모달창 -->
	<div class="modal fade" id="ingreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-left" id="exampleModalLabel"></h4>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
				</div>
				<div class="modal-body" id="recipeChart">
					<canvas id="canvas" style="height:30vw; width:50vw; margin: auto;"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
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

var ingreChartLabels = [];
var ingreChartData = [];

var params = { offset : "${offset}" };

$.ajax({
	url: "getSellIngredientChart.rk.ad",
	type: "POST",
	data : params,
	dataType : "JSON",
	success : function(result) {
		$.each(result, function(index, value) {
			ingreChartLabels.push((value.ingredient_nm).substring(0, 3) + "...");
			ingreChartData.push(value.ingredient_sell_sum);
		
			var row="";
			row += "<tr><td>"+value.rank_no+"</td>";
			row += "<td>"+value.ingredient_no+"</td>";
			row += "<td>"+value.ingredient_nm+"</td>";
			row += "<td>"+value.ingredient_sell_sum+"</td>";
			row += "<td>"+value.order_ymd+"</td>";
			row += "<td><a type='button' class='btn btn-outline-danger btn-sm' data-toggle='modal' data-target='#ingreModal' data-ingredient_no='"+value.ingredient_no+"' data-ingredient_nm='"+value.ingredient_nm+"' href=''>연관레시피</a></td></tr>";
			
			$("#ingreChartTable").append(row);
		});
		ingreChart();
	},
	error: function(request, status, error) {
		alert("status : " + status);
	}
});

function ingreChart() {
	var ctx = document.getElementById("ingreCanvas").getContext("2d");
	var color = Chart.helpers.color;
	var ingreChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ingreChartLabels,
			datasets: [{
				label : '#data1',
				data:ingreChartData,
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
					ticks : {
						beginAtZero : true
					}
				}],
				yAxes: [{
					scaleLabel:{
						display: true,
						labelString: '판매량'
					},
					ticks : {
						beginAtZero : true
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
				text: '식재료 순위표'
			}
		}
	});
}

/* 모달 차트 */
$('#ingreModal').on('show.bs.modal', function(event) {
	var recipeChartLabels = [];
	var recipeChartData = [];
	var ingre_nm = $(event.relatedTarget).data('ingredient_nm');
	var ingre_no = $(event.relatedTarget).data('ingredient_no');
	var re_params = { ingredient_no : ingre_no};

	$("#recipeChart").empty();
	$("#recipeChart").append("<canvas id='canvas' style='height:30vw; width:50vw; margin: auto;'></canvas>");
	
	$.ajax({
		url: "getRecipeChart.rk.ad",
		type: "POST",
		data: re_params,
		dataType : "JSON",
		success : function(result) {
			$.each(result, function(index, value) {
				recipeChartLabels.push((value.recipe_nm).substring(0, 3) + "...");
				recipeChartData.push(value.ingredient_sell_sum);
			});
		},
		error: function(request, status, error) {
			alert("status : " + status);
		}
	});

	var modal = $(this);
	var canvas = modal.find('.modal-body canvas');
	modal.find('.modal-title').html('Ingredient_nm : '+ingre_nm);
	var ctx = canvas[0].getContext("2d");
	var color = Chart.helpers.color;
	var ageChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: recipeChartLabels,
			datasets: [{
				data:recipeChartData,
				backgroundColor : [
					color(window.chartColors.red).alpha(0.5).rgbString(),
					color(window.chartColors.orange).alpha(0.5).rgbString(),
					color(window.chartColors.yellow).alpha(0.5).rgbString(),
					color(window.chartColors.green).alpha(0.5).rgbString(),
					color(window.chartColors.blue).alpha(0.5).rgbString(),
					color(window.chartColors.purple).alpha(0.5).rgbString(),
					color(window.chartColors.grey).alpha(0.5).rgbString(),
					color(window.chartColors.blue).alpha(0.5).rgbString()
				],
				borderColor : [
					window.chartColors.red,
					window.chartColors.orange,
					window.chartColors.yellow,
					window.chartColors.green,
					window.chartColors.blue,
					window.chartColors.purple,
					window.chartColors.grey,
					window.chartColors.blue
				],
				borderWidth: 1
			}]
		},
		options : {
			scales : {
				xAxes : [{
					scaleLabel : {
						display : true,
						labelString : '레시피'
					},
					ticks : {
						beginAtZero : true
					}
				}],
				yAxes : [{
					scaleLabel : {
						display : true,
						labelString : '판매량'
					},
					ticks : {
						beginAtZero : true
					}
				}]
			},
			responsive : true,
			//maintainAspectRatio : false,
			animation : {
				duration : 500,
			},
			legend : {
				position : 'Top',
			},
			title : {
				display : true,
				text : '식재료 판매량'
			}
		}
	});
}).on('hidden.bs.modal', function(event) {
	var modal = $(this);
	var canvas = modal.find('.modal-body canvas');
	canvas.attr('width', '50vw').attr('height', '30vw');
	// destroy modal
	$(this).data('bs.modal', null);
});
</script>
</html>