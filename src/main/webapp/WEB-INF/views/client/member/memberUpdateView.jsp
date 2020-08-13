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
<link rel="stylesheet" href="/shepe/resources/css/member-info.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<title>회원 정보 수정</title>
<script>
$(document).ready(function() {
    $("#update-btn").click(function(){
    	var result = confirm("회원정보를 변경하시겠습니까?");
    	if (result) {
    		$("#myinfo").submit();
    		alert("회원 정보를 변경하였습니다.");
    	} else {
    		location.reload();
    	}
    })
   });
</script>
<script>
// 닉네임 유효성 검사(1 = 아이디 중복 / 0 != 아이디 중복)
$(document).ready(function() {
	$("#member_nickname").blur(function() {
		var member_nickname = $('#member_nickname').val();
		console.log(member_nickname);
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
<style type="text/css">
#pw-Btn {
    background: #222;
    border-color: #222;
    color: white;
}
#drop-btn {
	text-decoration: underline; text-decoration: none; border: black solid; border-width: 0 0 2px 0;
}
.row {
	justify-content: center;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<section>
		<div class="container wrapper">
		  <jsp:include page="/WEB-INF/include/myPageMenu.jsp" />
			<div class="row">
		        <div class="col-md-10 col-md-offset-1">
		            <div class="contact-form">
		                <h1>회원 정보 변경</h1>    
		                <form id="myinfo" action="memberUpdate.do" method="post">
		                    <div class="row">
		                        <div class="col-sm-4">
		                            <div class="form-group">
									<label class="control-label" for="userId">아이디</label> 
									<input class="form-control" type="text" id="userId" name="member_id" value="${member_id}" readonly="readonly"/>
		                            </div>
		                        </div>                
		                        <div class="col-sm-4">
		                            <div class="form-group">
									<label class="control-label" for="userName">이  름</label> 
									<input class="form-control" type="text" id="userName" name="member_nm" value="${member.member_nm}" readonly="readonly"/>
		                            </div>
		                        </div>
				                <div class="col-sm-4">
				                    <div class="form-group">
									<label class="control-label" for="userEmail">비밀번호</label>
									<button type="button" id="pw-Btn" class="form-control" onclick="location.href='./changePWD.do'">비밀번호 변경</button>
								    </div>
								</div>
		                        <div class="col-sm-6"> 
		                            <div class="form-group">                         	
		                        	<label class="control-label" for="userNickName">닉네임</label>
									<input class="form-control" type="text" name="member_nickname" id="member_nickname" maxlength="20" value="${ member.member_nickname }" required="required">
									<div id="nickname_check"></div>							
		                          	</div>
		                        </div>
		                        <div class="col-sm-6"> 
		                            <div class="form-group">                         	
		                            <label for="userPhone">연락처</label>
									<input class="form-control" type="text" name="member_phone" id="member_phone" maxlength="13" value="${ member.member_phone }" required="required">
		                            <div id="phone_check"></div>
		                            </div>
		                         </div>
		                      	 <div class="col-sm-6"> 
		                            <div class="form-group">                         	
		                        	<label class="control-label" for="userEmail">이메일</label>
									<input class="form-control" type="text" name="member_email" id="email_Id" value="${ member.member_email }" required="required">
		                          	</div>
		                        </div>
		                        <div class="col-sm-6"> 
		                            <div class="form-group">                         	
		                            <label class="control-label" for="userDomain">도메인</label>
									<input class="form-control" type="text" name="member_email_domain" id="email_Domain" value="${ member.member_email_domain }" required="required">
		                            </div>
		                        </div>
		                        <div class="col-sm-12">
		                          	<div class="form-group" style="float: right;">
									<select name="selectEmail" id="selectEmail" >	
		                                <option value="" selected>직접입력</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="kakao.com">kakao.com</option>
									</select>
		                            </div>
		                         </div>
		                        </div>
		                    <button type="button" id="update-btn" class="btn btn-primary" style="float: right;"><i class="fa fa-paper-plane" ></i> 변경하기</button>
		                	<p>더이상 SHEPE를 이용하고 싶지 않다면 &nbsp; <a id="drop-btn" href="memberDeleteView">회원 탈퇴 바로가기</a></p>		             
		                </form>                
		            </div>
		        </div>
    		</div>
		</div>
	</section>
<!-- 이메일 입력방식 : 직접입력 -->
<script type="text/javascript">
	$(document).ready(function () {
		$("#memberInfo").css('color', 'black');
	})
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