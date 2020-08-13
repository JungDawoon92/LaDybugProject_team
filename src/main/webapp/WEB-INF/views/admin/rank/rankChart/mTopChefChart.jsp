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

	<div class="float-right">
		<input type="text" id="datePicker" class="form-control" placeholder="날짜를 선택하세요">
	</div>
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">매출액 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveIncomeSumChart.rk.ad">월별 종합 매출액 차트</a>
				<a class="dropdown-item" href="moveIncomeDetailChart.rk.ad">매출액 상세 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">레시피 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveLikeChart.rk.ad">누적 레시피 차트</a>
				<a class="dropdown-item" href="moveMonthTopRecipeChart.rk.ad">월별 top 레시피 차트</a>
				<a class="dropdown-item" href="moveWeekTopRecipeChart.rk.ad">주별 top 레시피 차트</a>
				<a class="dropdown-item" href="moveDayTopRecipeChart.rk.ad">일별 top 레시피 차트</a>
				<a class="dropdown-item" href="moveCommentTopChart.rk.ad">이용후기 top 레시피 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle active" href="" data-toggle="dropdown">구독자 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveSubChart.rk.ad">누적 쉐프 차트</a>
				<a class="dropdown-item" href="moveMonthTopChefChart.rk.ad">월별 top 쉐프 차트</a>
				<a class="dropdown-item" href="moveWeekTopChefChart.rk.ad">주별 top 쉐프 차트</a>
				<a class="dropdown-item" href="moveDayTopChefChart.rk.ad">일별 top 쉐프 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown">식재료 판매량 차트</a>
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
	<div class="clearfix"></div>
	<br>
	<h1>월별 TOP10 쉐프 차트</h1>
	<div id="topChart">
		<canvas id="topChefCanvas" style="height:30vw; width:50vw; margin: auto;"></canvas>
	</div>
	<br><br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>회원아이디</th>
				<th>회원닉네임</th>
				<th>가입일</th>
				<th>구독자</th>
				<th>선호카테고리</th>
			</tr>
		</thead>
		<tbody id="subMonthChartTable">
			
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
</body>
<script>
$(document).ready(function() {
	
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
	

var topChefChartLabels = [];
var topChefChartData = [];
	
function monthCheck(date, title) {
	var targetTitle = title;
	var targetDate = date;
	
	if(targetDate == null) {
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() +1;
		var date = today.getDate();
		targetDate = year + "-" + month + "-" + date;
		targetTitle = year + "년 " + month + "월 TOP10 쉐프";
	}
	
	var mt_params = { rank_ymd : targetDate };
	
	topChefChartLabels = [];
	topChefChartData = [];
	$("#topChart").empty();
	$("#topChart").append("<canvas id='topChefCanvas' style='height:30vw; width:50vw; margin: auto;'></canvas>");
	$("#subMonthChartTable").empty();
	
	$.ajax({
		url: "getMonthTopChefChart.rk.ad",
		type: "POST",
		data: mt_params,
		dataType: "JSON",
		success: function(result) {
			$.each(result, function(index, value){
				topChefChartLabels.push(value.member_nickname);
				topChefChartData.push(value.member_sub_sum);
				
				var row="";
				row += "<tr><td>"+value.member_sq+"</td>";
				row += "<td>"+value.member_id+"</td>";
				row += "<td>"+value.member_nickname+"</td>";
				row += "<td>"+value.member_join+"</td>";
				row += "<td>"+value.member_sub_sum+"</td>";
				row += "<td><a type='button' class='btn btn-outline-danger btn-sm' data-toggle='modal' data-target='#cateModal' data-mem_id='"+value.member_id+"' href=''>선호카테고리</a></td></tr>";
			
				$("#subMonthChartTable").append(row);
			});	
			topChefChart(targetTitle);
		}
	});
}


function topChefChart(targetTitle) {
	
	var ctx = document.getElementById("topChefCanvas").getContext("2d");
	var color = Chart.helpers.color;

	if(topChefChart != null) {
		topChefChart.destroy();
	}
		
	var topChefChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : topChefChartLabels,
			datasets : [{
				label : '#data1',
				data : topChefChartData,
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
				borderWidth : 1
			}]
		},
		options : {
			scales : {
				xAxes : [{
					scaleLabel : {
						display : true,
						labelString : '쉐프'
					},
					ticks : {
						beginAtZero : true
					}
				}],
				yAxes : [{
					scaleLabel : {
						display : true,
						labelString : '누적 구독자'
					},
					ticks : {
						beginAtZero : true
					}
				}]
			},
			responsive : false,
			//maintainAspectRatio : false,
			animation : {
				duration : 500,
			},
			legend : {
				position : 'Top',
			},
			title : {
				display : true,
				text : targetTitle
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
		var title = year + "년 " + month + "월 TOP10 쉐프";
		monthCheck(date, title);
	});
});//ready end

/* 모달 차트 */
$('#cateModal').on('show.bs.modal', function(event) {
	var cateChartLabels = [];
	var cateChartData = [];
	var mem_id = $(event.relatedTarget).data('mem_id');
	var cate_params = { member_id : mem_id };

	$("#cateChart").empty();
	$("#cateChart").append("<canvas id='canvas' style='height:30vw; width:50vw; margin: auto;'></canvas>");
	
	$.ajax({
		url: "getCategoryChart.rk.ad",
		type: "POST",
		data: cate_params,
		dataType : "JSON",
		success : function(result) {
			$.each(result, function(index, value) {
				cateChartLabels.push(value.recipe_category_kind);
				cateChartData.push(value.cate_count);
			});
		},
		error: function(request, status, error) {
			alert("status : " + status);
		}
	});

	var modal = $(this);
	var canvas = modal.find('.modal-body canvas');
	modal.find('.modal-title').html('ID : '+mem_id);
	var ctx = canvas[0].getContext("2d");
	var color = Chart.helpers.color;
	var cateChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: cateChartLabels,
			datasets: [{
				data:cateChartData,
				backgroundColor : [
					color(window.chartColors.red).alpha(0.5).rgbString(),
					color(window.chartColors.orange).alpha(0.5).rgbString(),
					color(window.chartColors.yellow).alpha(0.5).rgbString(),
					color(window.chartColors.green).alpha(0.5).rgbString(),
					color(window.chartColors.blue).alpha(0.5).rgbString()
				],
				borderColor : [
					window.chartColors.red,
					window.chartColors.orange,
					window.chartColors.yellow,
					window.chartColors.green,
					window.chartColors.blue
				],
				borderWidth: 1
			}]
		},
		options: {
			
			responsive: true,
			//maintainAspectRatio : false,
			animation:{ 
				duration: 500,
			}, 
			legend: {
				display: true,
				position: 'bottom',
			},
			title: {
				display: true,
				text: '회원의 선호카테고리'
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