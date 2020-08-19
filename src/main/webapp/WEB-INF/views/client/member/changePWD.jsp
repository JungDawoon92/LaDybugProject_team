<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Patua+One">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="/shepe/resources/css/mypage.css" type="text/css">
	<link rel="stylesheet" href="/shepe/resources/css/member_join.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<title>회원 비밀번호 변경</title>
<style>
#incorrectPWD {
	font-size: 12pt;
}
</style>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 비밀번호 정규식
			var pwJ = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,20}$/;
			
			// 비밀번호 유효성 검사
			$('#member_pw').blur(function() {
				if (pwJ.test($('#member_pw').val())) {
					console.log('true');
					$('#pw_check').text('');
				} else {
					console.log('false');
					$('#pw_check').text('영문, 숫자, 특수문자의 조합으로 8~20 자리 입력하세요.');
					$('#pw_check').css('color', 'red');
				}
			})			
			
			// 1-2 패스워드 일치 확인
			$('#member_pw2').blur(function() {
				if ($('#member_pw').val() != $(this).val()) {
					$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
					$('#pw2_check').css('color', 'red');
					$('#changeSubmit').attr("disabled", true);
				} else if ( $('#userPass').val() == $('#member_pw').val() ) {
					$('#pw_check').text('기존 비밀번호와 다른 비밀번호를 입력하세요.');
					$('#pw_check').css('color', 'red');
					$('#changeSubmit').attr("disabled", true);
				} else {
					$('#pw2_check').text('');
					$('#changeSubmit').attr("disabled", false);
				}
			})
			
			// 취소
			$(".cencle").on("click", function(){
				var result = confirm("취소하시겠습니까?");
				if (result){
					location.href = "./memberDetail.do";	
				} else {
					location.reload();
				}
				
						    
			})
			// 회원 탈퇴 버튼 클릭 시
			$("#changeSubmit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$('#changeSubmit').attr("disabled", true);
					$("#userPass").focus();
					return false;
				} else if($("#member_pw").val()=="") {
					alert("비밀번호를 입력해주세요.");
					$("#member_pw").focus();
					$('#changeSubmit').attr("disabled", true);
					return false;
				} else if($("#member_pw2").val()=="") {
					alert("비밀번호를 입력해주세요.");
					$("#member_pw2").focus();
					$('#changeSubmit').attr("disabled", true);
					return false;
				}
			
			$.ajax({
				url : "../passChk",
				type : "POST",
				dataType : "json",
				data : $("#changeForm").serializeArray(),
				success: function(data){
					
					if(data == false){
						console.log("ajax 넘겨 받은 data 값: " + data);
						alert("패스워드가 틀렸습니다.");
						$("#incorrectPWD").text("패스워드를 다시 입력해주세요.");
						$("#incorrectPWD").css("color", "red");
						return;
					} else {
						if(confirm("비밀번호를 변경하시겠습니까?")) {
							$('#changeSubmit').attr("disabled", false);							
							$("#changeForm").submit();
							alert('비밀번호를 변경 하였습니다. 재로그인 부탁드립니다.');
						} else {
							return false;
						}
						
					}
				}
			})
		});
		
	});
</script>
<style>
.row {
	justify-content: center;
}
</style>
<body>
<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<section>	
		<div class="container wrapper">
		  <jsp:include page="/WEB-INF/include/myPageMenu.jsp" />	
			<div class="row myinfocontents">
				<div class="myinfo col-md-9 col-md-offset-2" style="padding-top: 50px;">
					<div class="contact-form">
						<h3>비밀번호 변경</h3>
						<form action="updatePWD.do" method="post" id="changeForm">
							<input name="member_id" type="hidden" value="${ member_id }">
							<input name="member_email" type="hidden" value="${ member.member_email }">
							<input name="member_email_domain" type="hidden" value="${ member.member_email_domain }">								
								<div class="form-group">
								<label class="control-label" for="userPass" style="padding-top: 20px;">패스워드</label>
									<input class="form-control" type="password" id="userPass" name="member_password" required="required" style="width: 350px"/>	
									<div class="incorrectPWD">
										<c:if test="${msg == false}"> 비밀번호가 맞지 않습니다. </c:if>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label" for="userName">변경할 패스워드</label>
									<input class="form-control" type="password" id="member_pw" name="confirm_password" minlength="8" required="required" style="width: 350px"/>
									<div class="check_font" id="pw_check"></div>
								</div>					
								<div class="form-group">
									<label class="control-label" for="userId">재확인</label> 
									<input class="form-control" type="password" id="member_pw2" name="confirm_password" minlength="8" required="required" style="width: 350px"/>
								</div>
								<div id="pw2_check"></div>
								<div class="form-group" style="float: right;">
									<button class="btn btn-success" type="submit" id="changeSubmit" style="font-size: 15px;">변경하기</button>
									<button class="cencle btn btn-danger" type="button" style="font-size: 15px;">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>