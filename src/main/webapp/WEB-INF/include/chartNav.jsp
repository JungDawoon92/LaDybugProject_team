<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/shepe/resources/admin.css/bootstrap.min.css">
</head>
<body>
<div class="container">  
<ul id="ChartButton1" class="nav nav-tabs" role="tablist">
		<li class="nav-item dropdown">
			<a id="1" class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">매출액 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveIncomeSumChart.rk.ad">월별 종합 매출액 차트</a>
				<a class="dropdown-item" href="moveIncomeDetailChart.rk.ad">매출액 상세 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a id="2" class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">레시피 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveLikeChart.rk.ad">누적 레시피 차트</a>
				<a class="dropdown-item" href="moveMonthTopRecipeChart.rk.ad">월별 top 레시피 차트</a>
				<a class="dropdown-item" href="moveWeekTopRecipeChart.rk.ad">주별 top 레시피 차트</a>
				<a class="dropdown-item" href="moveDayTopRecipeChart.rk.ad">일별 top 레시피 차트</a>
				<a class="dropdown-item" href="moveCommentTopChart.rk.ad">이용후기 top 레시피 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a id="3" class="nav-link dropdown-toggle" href="" data-toggle="dropdown">구독자 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveSubChart.rk.ad">누적 쉐프 차트</a>
				<a class="dropdown-item" href="moveMonthTopChefChart.rk.ad">월별 top 쉐프 차트</a>
				<a class="dropdown-item" href="moveWeekTopChefChart.rk.ad">주별 top 쉐프 차트</a>
				<a class="dropdown-item" href="moveDayTopChefChart.rk.ad">일별 top 쉐프 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a id="4" class="nav-link dropdown-toggle" href="" data-toggle="dropdown">식재료 판매량 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveSellIngredientChart.rk.ad">누적 식재료 판매량 차트</a>
				<a class="dropdown-item" href="moveMonthTopIngredientChart.rk.ad">월별 식재료 판매량 차트</a>
				<a class="dropdown-item" href="moveWeekTopIngredientChart.rk.ad">주별 식재료 판매량 차트</a>
				<a class="dropdown-item" href="moveDayTopIngredientChart.rk.ad">일별 식재료 판매량 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a id="5" class="nav-link dropdown-toggle" href="" data-toggle="dropdown">레시피 판매량 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="moveSellRecipeChart.rk.ad">누적 레시피 판매량 차트</a>
				<a class="dropdown-item" href="moveMonthTopSellRecipeChart.rk.ad">월별 레시피 판매량 차트</a>
				<a class="dropdown-item" href="moveWeekTopSellRecipeChart.rk.ad">주별 레시피 판매량 차트</a>
				<a class="dropdown-item" href="moveDayTopSellRecipeChart.rk.ad">일별 레시피 판매량 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a id="6" class="nav-link dropdown-toggle" href="" data-toggle="dropdown">식재료 카테고리별 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="ingredientChart.co">레시피 카테고리별 차트</a>
			</div>
		</li>
		
		<li class="nav-item dropdown">
			<a id="7" class="nav-link dropdown-toggle" href="" data-toggle="dropdown">레시피 카테고리별 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="adminRecipeChartView.adre">레시피 카테고리별 차트</a>
			</div>
		</li>
		
		<li class="nav-item dropdown">
			<a id="8" class="nav-link dropdown-toggle" href="" data-toggle="dropdown">회원 통계 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="memberGraph.ad">회원 통계 차트</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a id="9" class="nav-link dropdown-toggle" href="" data-toggle="dropdown">봇 통계 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="bootChart">봇 통계 차트 url</a>
			</div>
		</li>
		<li class="nav-item dropdown">
			<a id="10" class="nav-link dropdown-toggle" href="" data-toggle="dropdown">검색량 차트</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="searchChart">검색량 차트</a>
			</div>
		</li>
	</ul>
</div>
<script>
  $(".nav-item > .nav-link").click(function(){
	var choice1 ="0";
    choice1 = this.id;   
    sessionStorage.removeItem("choiceChart");
	sessionStorage.setItem("choiceChart", choice1);
	});
</script>

<script>
window.onload = function() {
	var choiceChart = sessionStorage.getItem("choiceChart");
	$("#"+choiceChart).addClass("active");
};
</script>

</body>
</html>