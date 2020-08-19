<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="/shepe/resources/css/mypage.css" type="text/css">
	<link rel="stylesheet" href="/shepe/resources/css/member_join.css" type="text/css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>회원 탈퇴</title>
<style>
#incorrectPWD {
	font-size: 12pt;
}
</style>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			
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
			$("#delsubmit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
			
			$.ajax({
				url : "../passChk",
				type : "POST",
				dataType : "json",
				data : $("#delForm").serializeArray(),
				success: function(data){
					
					if(data==0){
						console.log("ajax 넘겨 받은 data 값: " + data);
						alert("패스워드가 틀렸습니다.");
						$("#incorrectPWD").text("비밀번호를 확인해주세요.");
						$("#incorrectPWD").css("color", "red");
						return;
					} else {
						var deleteConfirm = confirm("탈퇴 시 위 아이디로 회원 가입이 불가합니다. \n정말로 탈퇴하시겠습니까?");
						if(deleteConfirm == true) {
							console.log($("#delForm").attr("action"));
							$("#delForm").submit();
						} else if (deleteConfirm == false) {
							return false;
						}
						
					}
				}
			})
		});
	})
</script>
<body>
<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<section>
		<div class="container wrapper">
		<jsp:include page="/WEB-INF/include/myPageMenu.jsp" />
			<div class="row myinfocontents">
				<div class="myinfo col-md-9 col-md-offset-2" style="padding-top: 50px;">
						<h1>회원 탈퇴</h1>
						<h3 style="padding-top: 20px;">정말 Shepe에 탈퇴하시겠습니까?</h3>
						<form:form action="../memberDelete.do" id="delForm" method="post">
							<div class="form-group">
								<label class="control-label" for="userId">아이디</label> 
								<input class="form-control" type="text" id="userId" name="member_id" value="${member_id}" readonly="readonly" style="width: 350px"/>
							</div>
							<div class="form-group">
								<label class="control-label" for="userPass">패스워드</label>
								<input class="form-control" type="password" id="userPass" name="member_password" style="width: 350px"/>
								<div id="incorrectPWD"></div>
							</div>
							<div class="form-group" style="float: right;">
								<button class="btn btn-success" type="button" id="delsubmit" style="font-size: 15px;">회원탈퇴</button>
								<button class="cencle btn btn-danger" type="button" style="font-size: 15px;">취소</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
	</section>
</body>
</html>