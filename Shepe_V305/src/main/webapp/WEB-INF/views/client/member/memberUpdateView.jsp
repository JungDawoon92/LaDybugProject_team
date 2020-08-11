<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="/shepe/resources/css/mypage.css" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <title>Shepe 회원 정보 수정</title>
<script>
$(document).ready(function() {
    $("#update-btn").click(function(){
    	alert("회원정보가 변경되었습니다.");
    })
   });
</script>
<script>
// 닉네임 유효성 검사(1 = 아이디 중복 / 0 != 아이디 중복)
$(document).ready(function() {
	$("#member_nickname").blur(function() {
		var member_nickname = $('#member_nickname').val();
		$.ajax({
			url : '../nickCheck?member_nickname='+ member_nickname,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
					// 1 : 닉네임이 중복되는 문구
					$("#nickname_check").text("이미 사용중인 닉네임입니다.");
					$("#nickname_check").css("color", "red");
					$("#update-btn").attr("disabled", true);
				} else {
					
					if (data == 0) {
						// 0 : 닉네임 길이 / 문자열 검사
						$("#nickname_check").text("사용가능한 닉네임입니다.");
						$("#nickname_check").css("color", "green");
						$("#update-btn").attr("disabled", false);
					} else if (member_nickname == "") {
						$('#nickname_check').text('닉네임을 입력해주세요.');
						$('#nickname_check').css('color', 'red');				
					}					
				}				  
				}, error : function() {
						console.log("실패");
				}
			});
		});
	});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<section>
		<div class="container wrapper">
			<div class="row myinfocontents">
				<div class="col-md-3"><jsp:include page="/WEB-INF/include/myPageMenu.jsp" /></div>
				<div class="myinfo col-md-9">
					<div class="board_header">
						<h1>회원 정보 변경</h1>
					</div>
					<form name="myinfo" action="../memberUpdate.do" method="post">
					<input name="member_id" type="hidden" value="${ member_id }">
						<table class="myinfoitem">
							<tr>
								<td>아이디</td>
								<td>${ member_id }</td>
							</tr>
							<tr>
								<td>이&nbsp;&nbsp;&nbsp;름</td>
								<td>${ member.member_nm }</td>
							</tr>
							<tr>
								<td>닉네임</td>
								<td><input type="text" name="member_nickname" id="member_nickname" maxlength="20" value="${ member.member_nickname }" required="required"></td>
								<td id="nickname_check"></td>
							</tr>
							<tr>
								<td>연락처</td>
								<td><input type="text" name="member_phone" id="member_phone" maxlength="13" value="${ member.member_phone }" required="required"></td>
								<td id="phone_check"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="member_email" id="email_Id" value="${ member.member_email }" required="required"></td>
							</tr>
							<tr>
								<td>도메인</td>
								<td>
								<input type="text" name="member_email_domain" id="email_Domain" value="${ member.member_email_domain }" required="required">
								<select style="width: 100px; margin-right: 10px; float: center;" name="selectEmail" id="selectEmail" >
									<option value="" selected>직접입력</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="kakao.com">kakao.com</option>
								</select>
								</td>
							</tr>
						</table>
						<div class="btn-group  pull-right">
							<button type="submit" id="update-btn" class="btn btn-primary" title="회원 정보 변경" alt="회원 정보 변경">변경</button>
							<button type="button" onclick="location.href='./myPage.do'" class="btn btn-danger" title="취소" alt="취소">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
<!-- 이메일 입력방식 : 직접입력 -->
<script type="text/javascript">
	//이메일 입력방식 선택 
	$('#selectEmail').change(function() {
		$("#selectEmail option:selected").each(function() {
			if ($(this).val() == '1') { //직접입력일 경우 
				$("#email_Domain").val(''); //값 초기화 
				$("#email_Domain").attr("readonly", false); //활성화 
			} else { //직접입력이 아닐경우 
				$("#email_Domain").val($(this).text()); //선택값 입력 
				$("#email_Domain").attr("readonly", true); //비활성화 
			}
		});
	});
	$(document).ready(function() {
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	// 휴대전화
	$('#member_phone').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(phoneJ.test($(this).val()));
			$("#phone_check").text('');
			$("#update-btn").attr("disabled", false);
		} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요.');
			$('#phone_check').css('color', 'red');
			$("#update-btn").attr("disabled", true);
		}
	});
 });
</script>
</body>
</html>