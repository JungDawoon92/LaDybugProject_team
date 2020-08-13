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

	<div class="float-right">
		<input type="text" id="datePicker" class="form-control" placeholder="날짜를 선택하세요">
	</div>
	
	<div class="clearfix"></div>
	<br>
	<h1>월별 TOP 식재료 판매량 차트</h1>
	<div id="topChart">
		<canvas id="topIngreCanvas" style="height:30vw; width:50vw; margin: auto;"></canvas>
	</div>
	<br><br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>식재료 번호</th>
				<th>식재료명</th>
				<th>판매량</th>
				<th>등록일</th>
				<th>벤자민버튼</th>
			</tr>
		</thead>
		<tbody id="ingreMonthChartTable">
			
		</tbody>
	</table>
	
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
	
	window.chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
		};
	
	monthCheck();
});


var topIngreChartLabels = [];
var topIngreChartData = [];


function monthCheck(date, title) {
	var targetTitle = title;
	var targetDate = date;
	
	if(targetDate == null) {
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() +1;
		var date = today.getDate();
		targetDate = year + "-" + month + "-" + date;
		targetTitle = year + "년 " + month + "월 TOP10 식재료";
	}
	
	var mt_params = { order_ymd : targetDate };
	
	TopIngreChartLabels = [];
	TopIngreChartData = [];
	$("#topChart").empty();
	$("#topChart").append("<canvas id='topIngreCanvas' style='height:30vw; width:50vw; margin: auto;'></canvas>");
	$("#ingreMonthChartTable").empty();
	
	$.ajax({
		url: "getMonthTopIngredientChart.rk.ad",
		type: "POST",
		data : mt_params,
		dataType : "JSON",
		success : function(result) {
			$.each(result, function(index, value) {
				TopIngreChartLabels.push((value.ingredient_nm).substring(0, 3) + "...");
				TopIngreChartData.push(value.ingredient_sell_sum);
			
				var row="";
				row += "<tr><td>"+value.ingredient_no+"</td>";
				row += "<td>"+value.ingredient_nm+"</td>";
				row += "<td>"+value.ingredient_sell_sum+"</td>";
				row += "<td>"+value.order_ymd+"</td>";
				row += "<td><a type='button' class='btn btn-outline-danger btn-sm' data-toggle='modal' data-target='#ingreModal' data-ingredient_no='"+value.ingredient_no+"' data-ingredient_nm='"+value.ingredient_nm+"' href=''>연관레시피</a></td></tr>";
				
				$("#ingreMonthChartTable").append(row);
			});
			topIngreChart(targetTitle);
		},
		error: function(request, status, error) {
			alert("status : " + status);
		}
	});
}

function topIngreChart(targetTitle) {
	var ctx = document.getElementById("topIngreCanvas").getContext("2d");
	var color = Chart.helpers.color;
	
	if(topIngreChart != null) {
		topIngreChart.destroy();
	}
	var topIngreChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: TopIngreChartLabels,
			datasets: [{
				label : '#data1',
				data:TopIngreChartData,
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
				position: 'Top',
			},
			title: {
				display: true,
				text: targetTitle
			}
		}
	});
}

$(function() {	
	$('#datePicker').datepicker({
		format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		title: "날짜선택",	//캘린더 상단에 보여주는 타이틀
		todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		language : "en"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	})//datepicker end
	.on("changeDate", function() {
		var date = $("#datePicker").val();
		var arr = date.split("-");
		var year = arr[0];
		var month = arr[1];
		var day = arr[2];
		var title = year + "년 " + month + "월 TOP10 식재료";
		monthCheck(date, title);
	});
});

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