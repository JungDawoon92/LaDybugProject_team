<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe Chart Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- chart -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.bundle.min.js"></script>
<script type="text/javascript" charset="utf-8" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script src="<c:url value ="/resources/js/chartjs-plugin-labels.js" />"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/adminNav.jsp" />
	<jsp:include page="/WEB-INF/include/chartNav.jsp" />
	
<div class="container">

	<div style="text-align:center; margin-top: 20px;">
		<canvas id="likeCanvas" style="height: 450px; width: 450px; display: inline-block;"></canvas>

		<canvas id="ingCanvas" style="height: 450px; width: 450px; display: inline-block; maigin-left: 20px; maigin-right: 20px;"></canvas>

		<canvas id="howCanvas" style="height: 450px; width: 450px; display: inline-block;"></canvas>
	</div>
</div>
</body>
<!-- 종류별 -->
<script>
	window.chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};
		
	var likeChartLabels = [];
	var likeChartData = [];

	$.ajax({
		url : "adminRecipeChart.adre",
		type : "POST",
		dataType : "JSON",
		success : function(result) {
			$.each(result, function(index, value) {
				likeChartLabels.push(value.recipe_category_kind);
				likeChartData.push(value.category_cnt);
			});
			likeChart();
		},
		error: function(request, status, error) {
			alert("status : " + status);
		}
	});

	function likeChart() {
		var ctx = document.getElementById("likeCanvas").getContext("2d");
		var color = Chart.helpers.color;
		var likeChart = new Chart(ctx, {
			type: 'pie',
			data: {
				labels: likeChartLabels,
				datasets: [{
					label:'레시피 수',
					data:likeChartData,
					backgroundColor : [ 
						color(window.chartColors.red).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.orange).alpha(0.5).rgbString(),
						color(window.chartColors.yellow).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.purple).alpha(0.5).rgbString(),
						color(window.chartColors.grey).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.red).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
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
						window.chartColors.blue,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
						window.chartColors.purple,
						window.chartColors.grey,
						window.chartColors.blue,
						window.chartColors.red,
						window.chartColors.blue,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
						window.chartColors.purple,
						window.chartColors.grey,
						window.chartColors.blue
					],
					borderWidth: 1,
				}]
			},
			options: {
				responsive: false,
				maintainAspectRatio : false,
				animation:{ 
					duration: 500,
				}, 
				legend: {
					display: true,
					position: 'top',
				},
				title: {
					display: true,
					text: '종류별 레시피 수'
				},
				pieceLabel: {
					mode:"label",
					position:"outside",
					fontSize: 11,
					fontStyle: 'bold'
				}
			}
		});
	}
</script>

<!-- 식재료별 -->
<script>
	window.chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};
		
	var ingChartLabels = [];
	var ingChartData = [];

	$.ajax({
		url : "adminRecipeChartIng.adre",
		type : "POST",
		dataType : "JSON",
		success : function(result) {
			$.each(result, function(index, value) {
				ingChartLabels.push(value.recipe_category_ing);
				ingChartData.push(value.categoryIng_cnt);
			});
			ingChart();
		},
		error: function(request, status, error) {
			alert("status : " + status);
		}
	});

	function ingChart() {
		var ctx = document.getElementById("ingCanvas").getContext("2d");
		var color = Chart.helpers.color;
		var ingChart = new Chart(ctx, {
			type: 'pie',
			data: {
				labels: ingChartLabels,
				datasets: [{
					label:'레시피 수',
					data:ingChartData,
					backgroundColor : [ 
						color(window.chartColors.red).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.orange).alpha(0.5).rgbString(),
						color(window.chartColors.yellow).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.purple).alpha(0.5).rgbString(),
						color(window.chartColors.grey).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.red).alpha(0.5).rgbString(),
						color(window.chartColors.yellow).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString()
					],
					borderColor : [
						window.chartColors.red,
						window.chartColors.blue,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
						window.chartColors.purple,
						window.chartColors.grey,
						window.chartColors.blue,
						window.chartColors.red,
						window.chartColors.yellow,
						window.chartColors.green
					],
					borderWidth: 1,
				}]
			},
			options: {
				responsive: false,
				maintainAspectRatio : false,
				animation:{ 
					duration: 500,
				}, 
				legend: {
					display: true,
					position: 'top',
				},
				title: {
					display: true,
					text: '식재료 별 레시피 수'
				},
				pieceLabel: {
					mode:"label",
					position:"outside",
					fontSize: 11,
					fontStyle: 'bold'
				}
			}
		});
	}
</script>

<!-- 방법 별 -->
<script>
	window.chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};
		
	var howChartLabels = [];
	var howChartData = [];

	$.ajax({
		url : "adminRecipeChartHow.adre",
		type : "POST",
		dataType : "JSON",
		success : function(result) {
			$.each(result, function(index, value) {
				howChartLabels.push(value.recipe_category_how);
				howChartData.push(value.categoryHow_cnt);
			});
			howChart();
		},
		error: function(request, status, error) {
			alert("status : " + status);
		}
	});

	function howChart() {
		var ctx = document.getElementById("howCanvas").getContext("2d");
		var color = Chart.helpers.color;
		var howChart = new Chart(ctx, {
			type: 'pie',
			data: {
				labels: howChartLabels,
				datasets: [{
					label:'레시피 수',
					data:howChartData,
					backgroundColor : [ 
						color(window.chartColors.red).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.orange).alpha(0.5).rgbString(),
						color(window.chartColors.yellow).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.purple).alpha(0.5).rgbString(),
						color(window.chartColors.grey).alpha(0.5).rgbString(),
						color(window.chartColors.blue).alpha(0.5).rgbString(),
						color(window.chartColors.red).alpha(0.5).rgbString(),
						color(window.chartColors.yellow).alpha(0.5).rgbString(),
						color(window.chartColors.green).alpha(0.5).rgbString()
					],
					borderColor : [
						window.chartColors.red,
						window.chartColors.blue,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
						window.chartColors.purple,
						window.chartColors.grey,
						window.chartColors.blue,
						window.chartColors.red,
						window.chartColors.yellow,
						window.chartColors.green
					],
					borderWidth: 1,
				}]
			},
			options: {
				responsive: false,
				maintainAspectRatio : false,
				animation:{ 
					duration: 500,
				}, 
				legend: {
					display: true,
					position: 'top',
				},
				title: {
					display: true,
					text: '방법 별 레시피 수'
				},
				pieceLabel: {
					mode:"label",
					position:"outside",
					fontSize: 11,
					fontStyle: 'bold'
				}
			}
		});
	}
</script>

</html>