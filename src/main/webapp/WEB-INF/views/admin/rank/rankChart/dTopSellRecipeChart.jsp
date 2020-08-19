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
	<h1>일별 TOP10 판매 레시피 차트</h1>
	<div id="topChart">
		<canvas id="topSellRecipeCanvas" style="height:30vw; width:50vw; margin: auto;"></canvas>
	</div>
	<br><br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>레시피번호</th>
				<th>레시피명</th>
				<th>판매량</th>
				<th>등록일</th>
				<th>벤자민버튼</th>
			</tr>
		</thead>
		<tbody id="sellRecipeDayChartTable">
			
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


var topSellRecipeChartLabels = [];
var topSellRecipeChartData = [];
	
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
	
	var d_params = { order_ymd : targetDate };
	topSellRecipeChartLabels = [];
	topSellRecipeChartData = [];
	$("#topChart").empty();
	$("#topChart").append("<canvas id='topSellRecipeCanvas' style='height:30vw; width:50vw; margin: auto;'></canvas>");
	$("#sellRecipeDayChartTable").empty();
	
	$.ajax({
		url: "getDayTopSellRecipeChart.rk.ad",
		type: "POST",
		data: d_params,
		dataType: "JSON",
		success: function(result) {
			$.each(result, function(index, value){
				topSellRecipeChartLabels.push((value.recipe_nm).substring(0, 3) + "...");
				topSellRecipeChartData.push(value.recipe_sell_sum);
				
				var row = "";
				row += "<tr><td>"+value.recipe_no+"</td>";
				row += "<td>"+value.recipe_nm+"</td>";
				row += "<td>"+value.recipe_sell_sum+"</td>";
				row += "<td>"+value.order_ymd+"</td>";
				row += "<td><a type='button' class='btn btn-outline-danger btn-sm' data-toggle='modal' data-target='#cateModal' data-r_nm='"+value.recipe_nm+"' data-r_no='"+value.recipe_no+"' href=''>선호연령대</a></td></tr>";
				
				$("#sellRecipeDayChartTable").append(row);
			});	
			topSellRecipeChart(targetTitle);
		}
	});
}


function topSellRecipeChart(targetTitle) {
	
	var ctx = document.getElementById("topSellRecipeCanvas").getContext("2d");
	var color = Chart.helpers.color;

	if(topSellRecipeChart != null) {
		topSellRecipeChart.destroy();
	}
		
	var topSellRecipeChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : topSellRecipeChartLabels,
			datasets : [{
				label : '#data1',
				data : topSellRecipeChartData,
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
						labelString : '누적 판매량'
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
		var title = year + "년 " + month + "월 " + day + "일 TOP10 레시피";
		dayCheck(date, title);
	});
});//ready end

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