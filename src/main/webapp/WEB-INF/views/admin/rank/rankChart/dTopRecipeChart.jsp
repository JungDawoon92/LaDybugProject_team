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
			<a class="nav-link dropdown-toggle active" href="#" data-toggle="dropdown">레시피 차트</a>
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
	<h1>일별 TOP10 레시피 차트</h1>
	<div id="topChart">
		<canvas id="topRecipeCanvas" style="height:30vw; width:50vw; margin: auto;"></canvas>
	</div>
	<br><br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>레시피번호</th>
				<th>레시피제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>좋아요</th>
				<th>선호연령대</th>
			</tr>
		</thead>
		<tbody id="likeDayChartTable">
			
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
				<div class="modal-body" id="agesChart">
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
	
	dayCheck();
});


var topRecipeChartLabels = [];
var topRecipeChartData = [];
	
function dayCheck(date, title) {
	var targetTitle = title;
	var targetDate = date;
	
	if(targetDate == null) {
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() +1;
		var date = today.getDate();
		
		targetDate = year + "-" + month + "-" + date;
		targetTitle = year + "년 " + month + "월 " + date + "일 TOP10 레시피";
	}
	
	var day_params = { rank_ymd : targetDate };
	topRecipeChartLabels = [];
	topRecipeChartData = [];
	$("#topChart").empty();
	$("#topChart").append("<canvas id='topRecipeCanvas' style='height:30vw; width:50vw; margin: auto;'></canvas>");
	$("#likeDayChartTable").empty();
	
	$.ajax({
		url: "getDayTopRecipeChart.rk.ad",
		type: "POST",
		data: day_params,
		dataType: "JSON",
		success: function(result) {
			$.each(result, function(index, value){
				topRecipeChartLabels.push((value.recipe_nm).substring(0, 3)+"...");
				topRecipeChartData.push(value.recipe_like_sum);
				
				var row = "";
				row += "<tr><td>"+value.recipe_no+"</td>";
				row += "<td>"+value.recipe_nm+"</td>";
				row += "<td>"+value.member_id+"</td>";
				row += "<td>"+value.recipe_ymd+"</td>";
				row += "<td>"+value.recipe_like_sum+"</td>";
				row += "<td><a type='button' class='btn btn-outline-danger btn-sm' data-toggle='modal' data-target='#cateModal' data-r_no='"+value.recipe_no+"' href=''>선호연령대</a></td></tr>";
				
				$("#likeDayChartTable").append(row);
			});	
			topRecipeChart(targetTitle);
		}
	});
}


function topRecipeChart(targetTitle) {
	
	var ctx = document.getElementById("topRecipeCanvas").getContext("2d");
	var color = Chart.helpers.color;

	if(topRecipeChart != null) {
		topRecipeChart.destroy();
	}
		
	var topRecipeChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : topRecipeChartLabels,
			datasets : [{
				label : '#data1',
				data : topRecipeChartData,
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
						labelString : '레시피'
					},
					ticks : {
						beginAtZero : true
					}
				}],
				yAxes : [{
					scaleLabel : {
						display : true,
						labelString : '누적 좋아요'
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
		calendarWeeks : true, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
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
		var title = year + "년 " + month + "월 " + day + "일 TOP10 레시피";
		dayCheck(date, title);
	});
});//ready end

/* 모달 차트 */
$('#cateModal').on('show.bs.modal', function(event) {
	var ageChartLabels = [];
	var ageChartData = [];
	var r_no = $(event.relatedTarget).data('r_no');
	var age_params = { recipe_no : r_no};
	
	$("#agesChart").empty();
	$("#agesChart").append("<canvas id='canvas' style='height:30vw; width:50vw; margin: auto;'></canvas>");

	$.ajax({
		url: "getAgesChart.rk.ad",
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
	modal.find('.modal-title').html('Recipe_no : '+r_no);
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