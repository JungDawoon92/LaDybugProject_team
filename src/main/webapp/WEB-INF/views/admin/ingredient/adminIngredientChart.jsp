<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="<c:url value ="/resources/js/ingredient/chartjs-plugin-labels.js"/>"></script>
<style type="text/css">
#tableHead th {
	text-align: center;
	background-color: orange;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/include/adminNav.jsp" />
<div class="container">
	<h5>&lt식재료 카테고리별 유입차트&gt</h5>
	<div>
		<canvas id="categCanvas" style="height:30vw; width:50vw; margin:auto"></canvas>
	</div><br><br><br>
	<table id="chartList" class="table table-bordered" style="text-align:center">
		<thead id ="tableHead">
			<tr>
				<th width="150">MEAT</th>
				<th width="150">BEEF</th>
				<th width="150">CHICKEN</th>
				<th width="150">SEAFOOD</th>
				<th width="150">VEGETABLE</th>
				<th width="150">FRUIT</th>
				<th width="150">NUTS</th>
				<th width="150">ETC</th>
			</tr>
		</thead>
		<tbody id="chartData">
		</tbody> 
	</table><br><br><br>
	<div>
	<h5>&lt식재료 카테고리별 평균 가격&gt</h5>
		<canvas id="categCanvas2" style="height:30vw; width:50vw; margin:auto"></canvas>
	</div><br><br><br>
	<table id="avgPriceTable" class="table table-bordered" style="text-align:center">
		<thead id ="tableHead">
			<tr>
				<th width="150">MEAT</th>
				<th width="150">BEEF</th>
				<th width="150">CHICKEN</th>
				<th width="150">SEAFOOD</th>
				<th width="150">VEGETABLE</th>
				<th width="150">FRUIT</th>
				<th width="150">NUTS</th>
				<th width="150">ETC</th>
			</tr>
		</thead>
		<tbody id="priceData">
		</tbody> 
	</table><br><br><br>
</div>
</body>
<script type="text/javascript">
window.chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)',
		yao: 'rgb(153,255,204)',
		yao2: 'rgb(051,255,255)'
	};
var ingredient_categ=[];
var ingredient_countCateg=[];

$.ajax({
	url : "adminIngredientChart.co",
	type : "POST",
	dataType : "JSON",
	success : function(result) {
		$.each(result, function(index, value) {
			ingredient_categ.push(value.ingredient_categ);
			ingredient_countCateg.push(value.ingredient_cntCateg);
		});
		ingredientChart();
		chartData();
	},
	error: function(request, status, error) {
		alert("status : " + status);
	}
});

function ingredientChart() {
	var ctx = document.getElementById("categCanvas").getContext("2d");
	var color = Chart.helpers.color;
	var ingredientChart = new Chart(ctx, {
		type : 'bar',
		data : {
			labels : ingredient_categ,
			datasets : [{
				data:ingredient_countCateg,
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
						display:true,
						labelString: '식재료 카테고리'
					},
					ticks: {
						beginAtZero:true
					}
				}],
				yAxes: [{
					scaleLabel:{
						display:true,
						labelString:'식재료 등록 수'
					},
					ticks: {
						beginAtZero:true
					}
				}]
			},
			responsice: false,
			animation: {
				duration: 500,
			},
			legend: {
				display:false,
				position:'top',
			},
			title: {
				display:true,
				text:'식재료 카테고리별 유입 차트'
			}
		}
	});
}


function chartData() {
	var chartArray = new Array();
	var row="";
	row +="<tr>";
	for(var i=0; i<ingredient_countCateg.length; i++) {
		chartArray[i] = ingredient_countCateg[i];
		row += "<td>"+chartArray[i]+"개</td>";
	}
	row +="</tr>";
	$("#chartData").append(row);
};

var ingredient_avgprice=[];
$.ajax({
	url : "adminIngredientAvgChart.co",
	type : "POST",
	dataType : "JSON",
	success : function(data) {
		$.each(data, function(index, value) {
			ingredient_avgprice.push(value.avgPrice);
		});
		avgChart();
		avgChartTable();
	},
	error: function(request, status, error) {
		alert("status : " + status);
	}
});

function avgChart() {
	var ctx = document.getElementById("categCanvas2").getContext("2d");
	var color = Chart.helpers.color;
	var avgChart = new Chart(ctx, {
		type : 'doughnut',
		data : {
			labels : ingredient_categ,
			datasets : [{
				data: ingredient_avgprice, 
				backgroundColor : [ 
					color(window.chartColors.red).alpha(0.5).rgbString(),
					color(window.chartColors.blue).alpha(0.5).rgbString(),
					color(window.chartColors.yao2).alpha(0.5).rgbString(),
					color(window.chartColors.green).alpha(0.5).rgbString(),
					color(window.chartColors.purple).alpha(0.5).rgbString(),
					color(window.chartColors.yellow).alpha(0.5).rgbString(),
					color(window.chartColors.orange).alpha(0.5).rgbString(),
					color(window.chartColors.yao).alpha(0.5).rgbString(),
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
			title: {
				display: true,
				text:'식재료 카테고리별 평균 가격 비교'
			},
			responsice: true,
			animation: {
				animateScale: true,
				animateRotate: true
			},
			legend: {
				display:true,
				position:'top',
			},
		},
		
	});
}

function avgChartTable() {
	var priceArray = new Array();
	var row="";
	row +="<tr>";
	for(var i=0; i<ingredient_avgprice.length; i++) {
		priceArray[i] = ingredient_avgprice[i];
		var price = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(priceArray[i]);
		row += "<td>"+price+"원</td>";
	}
	row +="</tr>";
	$("#priceData").append(row);
}
</script>
</html>