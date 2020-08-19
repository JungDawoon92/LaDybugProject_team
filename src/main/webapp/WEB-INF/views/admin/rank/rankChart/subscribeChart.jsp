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
	<h1>누적 구독자 차트</h1>
	<div>
		<canvas id="subCanvas" style="height:30vw; width:50vw; margin: auto;"></canvas>
	</div>
	<br><br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>회원순위</th>
				<th>회원번호</th>
				<th>회원아이디</th>
				<th>회원닉네임</th>
				<th>가입일</th>
				<th>구독자</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="subChartTable">
			
		</tbody>
	</table>
	
	<!-- 페이징 -->
	<div id="paging" class="text-center">
		<jsp:include page="subscribeChartPaging.jsp"/>
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
				<div class="modal-body" id="cateChart">
					<canvas id="canvas" style="height:30vw; width:50vw; margin: auto;"></canvas>
				</div>
			</div>
		</div>
	</div>
	
	
</div>
</body>
<script>

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

var subChartLabels = [];
var subChartData = [];

var params = { offset : "${offset}" };

$.ajax({
	url: "getSubscribeChart.rk.ad",
	type: "POST",
	data : params,
	dataType : "JSON",
	success : function(result) {
		$.each(result, function(index, value) {
			subChartLabels.push(value.member_nickname);
			subChartData.push(value.member_sub_sum);
		
			var row="";
			row += "<tr><td>"+value.rank_no+"</td>";
			row += "<td>"+value.member_sq+"</td>";
			row += "<td>"+value.member_id+"</td>";
			row += "<td>"+value.member_nickname+"</td>";
			row += "<td>"+value.member_join+"</td>";
			row += "<td>"+value.member_sub_sum+"</td>";
			row += "<td><a type='button' class='btn btn-outline-danger btn-sm' data-toggle='modal' data-target='#cateModal' data-mem_id='"+value.member_id+"' href=''>선호카테고리</a></td></tr>";
			
			$("#subChartTable").append(row);
		});
		subChart();
	},
	error: function(request, status, error) {
		alert("status : " + status);
	}
});

function subChart() {
	var ctx = document.getElementById("subCanvas").getContext("2d");
	var color = Chart.helpers.color;
	var subChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: subChartLabels,
			datasets: [{
				label : '#data1',
				data:subChartData,
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
						labelString: '쉐프'
					},
					ticks: {
						beginAtZero:true
					}
				}],
				yAxes: [{
					scaleLabel:{
						display: true,
						labelString: '구독자'
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
				text: '쉐프 순위표'
			}
		}
	});
}

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