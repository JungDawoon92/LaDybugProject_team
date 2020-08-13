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
	<h1>레시피 판매량 차트</h1>
	<div>
		<canvas id="recipeCanvas" style="height:30vw; width:50vw; margin: auto;"></canvas>
	</div>
	<br><br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>판매량 순위</th>
				<th>레시피 번호</th>
				<th>레시피명</th>
				<th>판매량</th>
				<th>등록일</th>
				<th>벤자민버튼</th>
			</tr>
		</thead>
		<tbody id="recipeChartTable">
			
		</tbody>
	</table>
	
	<!-- 페이징 -->
	<div id="paging" class="text-center">
		<jsp:include page="sellRecipeChartPaging.jsp"/>
	</div>
	
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
				<div class="modal-body" id="agesChart">
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

var recipeChartLabels = [];
var recipeChartData = [];

var params = { offset : "${offset}" };

$.ajax({
	url: "getSellRecipeChart.rk.ad",
	type: "POST",
	data : params,
	dataType : "JSON",
	success : function(result) {
		$.each(result, function(index, value) {
			recipeChartLabels.push((value.recipe_nm).substring(0, 3) + "...");
			recipeChartData.push(value.recipe_sell_sum);
		
			var row="";
			row += "<tr><td>"+value.rank_no+"</td>";
			row += "<td>"+value.recipe_no+"</td>";
			row += "<td>"+value.recipe_nm+"</td>";
			row += "<td>"+value.recipe_sell_sum+"</td>";
			row += "<td>"+value.order_ymd+"</td>";
			row += "<td><a type='button' class='btn btn-outline-danger btn-sm' data-toggle='modal' data-target='#cateModal' data-r_nm='"+value.recipe_nm+"' data-r_no='"+value.recipe_no+"' href=''>선호연령대</a></td></tr>";
			
			$("#recipeChartTable").append(row);
		});
		recipeChart();
	},
	error: function(request, status, error) {
		alert("status : " + status);
	}
});

function recipeChart() {
	var ctx = document.getElementById("recipeCanvas").getContext("2d");
	var color = Chart.helpers.color;
	var recipeChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: recipeChartLabels,
			datasets: [{
				label : '#data1',
				data:recipeChartData,
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
						labelString: '판매량'
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
				text: '레시피 판매량 순위표'
			}
		}
	});
}

/* 모달 차트 */
$('#cateModal').on('show.bs.modal', function(event) {
	var ageChartLabels = [];
	var ageChartData = [];
	var r_nm = $(event.relatedTarget).data('r_nm');
	var r_no = $(event.relatedTarget).data('r_no');
	var age_params = { recipe_no : r_no};

	$("#agesChart").empty();
	$("#agesChart").append("<canvas id='canvas' style='height:30vw; width:50vw; margin: auto;'></canvas>");
	
	$.ajax({
		url: "getSellRecipeCategoryChart.rk.ad",
		type: "POST",
		data: age_params,
		dataType : "JSON",
		success : function(result) {
			$.each(result, function(index, value) {
				ageChartLabels.push(value.AGES);
				ageChartData.push(value.member_count);
			});
		},
		error: function(request, status, error) {
			alert("status : " + status);
		}
	});

	var modal = $(this);
	var canvas = modal.find('.modal-body canvas');
	modal.find('.modal-title').html('Recipe_nm : '+r_nm);
	var ctx = canvas[0].getContext("2d");
	var color = Chart.helpers.color;
	var ageChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ageChartLabels,
			datasets: [{
				data:ageChartData,
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
						labelString : '연령대'
					},
					ticks : {
						beginAtZero : true
					}
				}],
				yAxes : [{
					scaleLabel : {
						display : true,
						labelString : '회원수'
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
				text : '회원의 연령대'
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