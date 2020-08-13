<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
			<a class="nav-link dropdown-toggle active" href="#" data-toggle="dropdown">매출액 차트</a>
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
	<br>
	
	<h1>매출액 상세 차트</h1>
	<form id="searchForm" onsubmit="return false"> 
		<div class="row justify-content-center align-items-center">
			<div class="col-xs-6 col-md-4">
				<div class="input-group">
					<select name="searchCondition">
						<option value="member_id">회원ID
					</select>
					<input type="text" class="form-control" placeholder="Search" name="searchKeyWord" onkeypress="javascript:if(event.keyCode==13){detailList()}"/>
					<div class="input-group-btn">
						<input type="button" onclick="detailList()" value="조회">
					</div>
				</div>
			</div>
		</div>
	</form>
	<br>
	<table class="table" id="memberDetail">
		
	</table>
	
	<!-- 그래프 영역 -->
	<div id="detailChart">
		<canvas id="detailCanvas" style="height:30vw; width:50vw; margin:auto"></canvas>
	</div>
	<br><br>
	
	
	<table class="table table-hover">
		<thead>
			<th>회원ID</th>
			<th>주문번호</th>
			<th>주문일자</th>
			<th>결제금액</th>
			<th>결제방법</th>
			<th></th>
		</thead>
		<tbody id="detailListTable">
		
		</tbody>
	</table>
	
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
	
var ChartLabels = [];
var ChartData = [];

function detailList() {
	ChartLabels = [];
	ChartData = [];
	$("#detailChart").empty();
	$("#detailChart").append("<canvas id='detailCanvas' style='height:30vw; width:50vw; margin: auto;'></canvas>");
	$("#detailListTable").empty();
	$("#memberDetail").empty();
	var params = $("#searchForm").serializeArray();
	$.ajax({
		url : "getIncomeDetailList.rk.ad",
		type : "POST",
		data : params,
		dataType : "JSON",
		success : function(result) {
			if(result.length == 0) {
				$("#memberDetail").append("<h1>조회 결과가 없습니다.</h1>");
			}
			var mem_id = result[0].member_id;
			var mem_join = result[0].member_join;
			var totalPrice = 0;
			$.each(result, function(index, value) {
				ChartLabels.push(value.order_ymd);
				ChartData.push(value.order_sum);
				
				var row = "";
				row += "<tr><td>"+value.member_id+"</td>";
				row += "<td>"+value.order_no+"</td>";
				row += "<td>"+value.order_ymd+"</td>";
				row += "<td>"+value.order_sum+" 원</td>";
				row += "<td>"+value.paytype+"</td></tr>";
				
				$("#detailListTable").append(row);
				totalPrice += value.order_sum;
			});
			
			var rowa = "";
			rowa += "<thead><th>회원 ID</th><th>가입일</th><th>총결제금액</th></thead>";
			rowa +="<tbody><tr><td>"+mem_id+"</td>";
			rowa +="<td>"+mem_join+"</td>";
			rowa +="<td>"+totalPrice+" 원</td></tr></tbody>";
			
			$("#memberDetail").append(rowa);
			detailChart();
		},
		error: function(request, status, error) {
			alert("status : " + status);
		}
	});
}
function detailChart() {
	var ctx = document.getElementById("detailCanvas").getContext("2d");
	var color = Chart.helpers.color;
	var detailChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ChartLabels,
			datasets: [{
				data: ChartData,
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
						labelString: '구매날짜'
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
				display: false,
				position: 'top',
			},
			title: {
				display: true,
				text: '상세 구매내역'
			}
		}
	});
}
</script>
</html>