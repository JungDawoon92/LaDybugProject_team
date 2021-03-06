<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Lady bug</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<style>
body {
	position: relative;
}

ul.nav-pills {
	top: 250px;
	position: fixed;
}

div.col-8 div {
	height: 400px;
	vertical-align: middle;
}

.mx-auto {
	display: none;
}
</style>

<script>
function submitcheck(i){
	var submitche = "#" + "add" + i;
	$(submitche).fadeIn(100);
	var formsubmit = "#" + "bootsubject" + i;
	
	var formData = $(formsubmit).serialize();
	
        $.ajax({
            cache : false,
            url : "qaBoot",
            type : 'POST', 
            data : formData
        });
        return false;
}


</script>

</head>
<jsp:include page="/WEB-INF/include/adminNav.jsp"></jsp:include>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="1">
	
	<div class="container">
		<div class="row">
			<nav class="col-sm-3 col-4" id="myScrollspy">
				<ul class="nav nav-pills flex-column">
					<li class="nav-item"><a class="nav-link active"
						href="#section1">인사말</a></li>
					<li class="nav-item"><a class="nav-link" href="#section2">버튼수</a>
					</li>


					<li class="nav-item"><a class="nav-link" href="#section3">BootContent</a>
					</li>

				</ul>
			</nav>

			<div class="col-sm-9 col-8">
				<br>
				<h1>Message Boot</h1>
				<hr />
				<br>


				<div id="section1" class="mx-auto" style="width: 500px">
					<h2>인사말을 작성해 주세요.</h2>
					<div class="form-group">
						<label for="uname">Comment:</label> <input type="text"
							class="form-control" id="startBoot" placeholder="인사" name="startBoot"
							required minlength="3" maxlength="40"> <br>
							<font id="add11" class="text-success" style="display: none;">등록되었습니다.</font>
						<button id="button1" type="submit"
							class="btn btn-primary float-right"
							onclick="location.href='#section2'">Submit</button>
					</div>
				</div>


				<div id="section2" class="mx-auto" style="width: 500px">
					<h2>버튼 갯수를 선택 해주세요.</h2>
					<br>
					<div class="number">
						<button id="decreaseQuantity" type="button"
							class="btn btn-outline-primary">
							<i class='fas fa-angle-left' style='font-size: 20px'></i>
						</button>
						<span id="numberUpDown">1</span>
						<button id="increaseQuantity" type="button"
							class="btn btn-outline-primary">
							<i class='fas fa-angle-right' style='font-size: 20px'></i>
						</button>
						<button id="button2" type="submit"
							class="btn btn-primary float-right"
							onclick="location.href='#section3'">Submit</button><br>
							<font id="add12" class="text-success" style="display: none;">등록되었습니다.</font>
					</div>
				</div>

				<div id="section3" class="mx-auto" style="width: 500px">
					<h2>답변을 만들어 주세요.</h2>
					<div id="bootWriteList"></div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#section1').fadeIn(1000);
		});

		$(function() {
			$('#button1').click(function() {
				
		  		var startBootContent = $("#startBoot").val();
		  		
				$.ajax({
	  				type: "POST",
	  				url: "startBoot",
	  				data: {
	  					startBootContent: encodeURIComponent(startBootContent)
	  				}
		    });
				
				$('#add11').fadeIn(100);
				$('#section2').fadeIn(2000);
			});

			$('#button2').click(function() {
				var selctNum = $('#numberUpDown').text();
				var selectNumP = parseInt(selctNum, 10);
				
				$.ajax({
	  				type: "POST",
	  				url: "selectCountBoot",
	  				data: {
	  					selectNum: encodeURIComponent(selctNum)
	  				}
				});
				
				$('#add12').fadeIn(100);
				$('#section3').fadeIn(2000);
				$('#bootWriteList').empty();
				
				for(var i=0; i<selectNumP; i++) {
					
					$('#bootWriteList').append(
							'<form method="post" id=' + 'bootsubject' + i +'' +
							' name="Replyform'+ i + '">' +
							'<input type="hidden" name="boot_choice" value="'+ i +'">' +
							'<label>버튼이름</label>' + 
							'<input class="form-control" type="text" name="boot_question">'+
			  				'<label>봇 답변</label>' +
			  				'<textarea class="form-control" rows="3" name="boot_answer"></textarea>' +
			  				'<small class="form-text text-muted">위의 버튼을 누르면 사용자가 받는 답변입니다.</small>'+
			  				'<button type="button" class="btn btn-primary float-right" onclick="submitcheck('+ i +');">Submit</button>' +
			  				'<br><font id="add'+ i +'" class="text-success" style="display: none;">등록되었습니다.</font>'+
			  				'<br><br><hr>'+
			  				'</form>'
			  				);
				}
			});
		});

		$(function() {
			$('#decreaseQuantity').click(function(e) {
				e.preventDefault();
				var stat = $('#numberUpDown').text();
				var num = parseInt(stat, 10);
				num--;
				if (num <= 0) {
					alert('더이상 줄일수 없습니다.');
					num = 1;
				}
				$('#numberUpDown').text(num);
			});
			$('#increaseQuantity').click(function(e) {
				e.preventDefault();
				var stat = $('#numberUpDown').text();
				var num = parseInt(stat, 10);
				num++;

				if (num > 4) {
					alert('더이상 늘릴수 없습니다.');
					num = 4;
				}
				$('#numberUpDown').text(num);
			});
		});
	</script>
</body>
</html>
