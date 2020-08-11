<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
<head>
  <title>Shepe World</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/shepe/resources/css/member_join.css" type="text/css">
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
// 아이디 유효성 검사(1 = 아이디 중복 / 0 != 아이디 중복)
$(document).ready(function() {
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,20}$/;
	
	$("#member_id").blur(function() {
		// id = "id_reg" / name = "memberId"
		var member_id = $('#member_id').val();
		$.ajax({
			url : 'idCheck?memberId='+ member_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("이미 사용중인 아이디입니다.");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				} else {
					
					if (idJ.test(member_id)) {
						// 0 : 아이디 길이 / 문자열 검사
						console.log(idJ.test($('#member_id').val()));
						$("#id_check").text("사용가능한 아이디입니다.");
						$("#id_check").css("color", "green");
						$("#reg_submit").attr("disabled", false);
					} else if(member_id == "") {
						$('#id_check').text('아이디를 입력해주세요.');
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);				
					} else {
						$('#id_check').text("아이디는 소문자(영문), 숫자 4~20자리만 가능합니다.");
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);
					}
					
				}				  
				}, error : function() {
						console.log("실패");
				}
			});
		});
	});
</script>
<script>
// 닉네임 유효성 검사(1 = 아이디 중복 / 0 != 아이디 중복)
$(document).ready(function() {
	$("#member_nickname").blur(function() {
		var member_nickname = $('#member_nickname').val();
		$.ajax({
			url : 'nickCheck?member_nickname='+ member_nickname,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
					// 1 : 닉네임이 중복되는 문구
					$("#nickname_check").text("사용중인 닉네임입니다.");
					$("#nickname_check").css("color", "red");
					$("#update-btn").attr("disabled", true);
				} else {
					
					if (member_nickname == "") {
						// 0 : 닉네임 길이 / 문자열 검사
						$('#nickname_check').text('닉네임을 입력해주세요.');
						$('#nickname_check').css('color', 'red');						
					} else if (data == 0) {
						$("#nickname_check").text("사용가능한 닉네임입니다.");
						$("#nickname_check").css("color", "green");
						$("#update-btn").attr("disabled", false);
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
<body class="body_wrapper">
<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<section class="wrapper">
		<div class="signup-form ">
			<form:form id="userinfo" name="userInfo" action="registerMember.do" method="post">
				<h2>SHEPE 회원가입</h2>
				<p class="join_info_p">회원가입 정보를 입력해주세요.</p>
				<div class="form-group ">
					<div class="row">
						<div class="col-md-12" >아이디
							<input type="text" id="member_id" class="form-control" name="member_id" placeholder="ID" minlength="4" maxlength="20" required="required" autofocus="autofocus" >
							<div class="check_font" id="id_check"></div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-xs-12 col-md-12">
							비밀번호<input type="password" class="form-control" id="member_pw" name="member_password" placeholder="비밀번호 8글자 이상" minlength="8" required="required">
							<div class="check_font" id="pw_check"></div>
						</div>
						

						<div class="col-xs-12 col-md-12">
							비밀번호 확인 <input type="password" class="form-control" id="member_pw2" name="confirm_password" placeholder="비밀번호 확인" minlength="8" required="required">
							<div class="check_font" id="pw2_check"></div>
						</div>						
					</div>
					
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-md-6">
							이름<input type="text" class="form-control" id="MEMBER-NM"
							name="member_nm" placeholder="이름" minlength="2" maxlength="10" required="required">
							<div class="check_font" id="name_check"></div>
						</div>						
						<div class="col-md-6">
							닉네임 <input type="text" class="form-control" id="member_nickname"
							minlength="2" maxlength="20" name="member_nickname" placeholder="닉네임 설정" required="required">
						</div>
						<div class="check_font" id="nickname_check"></div>
					</div>
					<div class="check_font" id="name_check"></div>
				</div>				
				<div class="form-group">
					휴대전화 <input type="text" class="form-control" id="member_phone" maxlength="20"
						name="member_phone" placeholder="연락처" required="required">
						<div class="check_font" id="phone_check"></div>						
				</div>				
				<div class="form-group">
					<div class="row">
						<div class="col-xs-6">
							E-mail
							<input type="text" name="member_email" id="email_Id" class="form-control" required>
						</div>
						<br>
						<div class="col-xs-1">@</div>
						<div class="col-xs-5">
							<input type="text" name="member_email_domain" id="email_Domain" class="form-control" required>
							<select style="width: 100px; margin-right: 10px; float: right;" name="selectEmail" id="selectEmail" >
								<option value="" selected>직접입력</option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="kakao.com">kakao.com</option>
							</select>
						</div>
						<div class="col-md-12">
							생년월일 <input type="date" id="member_birth" class="form-control" name="member_birth" required="required">
							<div class="check_font" id="birth_check"></div>							
						</div>
					</div>
				</div>
				<div class="form-group"><p></p>
					<button type="submit" id="reg_submit" class="btn btn-primary btn-lg">가입</button>	
				</div>
			</form:form>
			<div class="hint-text">
				<p class="end_p">
					<a href="login.do">로그인 하러가기</a>&nbsp;&nbsp; / &nbsp;&nbsp;<a href="index.jsp">HOME</a>
				</p>
			</div>
		</div>
	</section>
</body>
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
</script>
<script type="text/javascript">
$(document).ready(function() {
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,20}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,10}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
		// 비밀번호 유효성 검사
		// 1-1 정규식 체크.
		
		$('#member_pw').blur(function() {
			if (pwJ.test($('#member_pw').val())) {
				console.log('true');
				$('#pw_check').text('');
			} else {
				console.log('false');
				$('#pw_check').text('영문/숫자/특수문자 조합으로 8~20 자리 입력하세요.');
				$('#pw_check').css('color', 'red');
			}
		})

		
		// 1-2 패스워드 일치 확인
		$('#member_pw2').blur(function() {
			if ($('#member_pw').val() != $(this).val()) {
				$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
				$('#pw2_check').css('color', 'red');
			} else {
				$('#pw2_check').text('');
			}
		})
		// 이름에 특수문자 들어가지 않도록 설정
		$("#MEMBER-NM").blur(function() {
			if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#name_check").text('');
			} else {
				$('#name_check').text('이름을 확인해주세요');
				$('#name_check').css('color', 'red');
			}
		});
		// 휴대전화
		$('#member_phone').blur(function(){
			if(phoneJ.test($(this).val())){
				console.log(phoneJ.test($(this).val()));
				$("#phone_check").text('');
			} else {
				$('#phone_check').text('휴대폰번호를 확인해주세요.');
				$('#phone_check').css('color', 'red');
			}
		});
		// 생년월일	birthJ 유효성 검사
		var birthJ = false;
		$('#member_birth').blur(function(){
			var dateStr = $(this).val();
			var userbirth = new Date(form.member_birth.value);
		    var today = new Date(); // 날짜 변수 선언
		    
		    if (dateStr.length <=10) {
			    if (userbirth > today) {
			    	$('#birth_check').text('생년월일을 확인해주세요.');
					$('#birth_check').css('color', 'red');
					birthJ = false;
					$("#reg_submit").attr("disabled", true);
			    } else {				    
			    	$('#birth_check').text('');
			    	$("#reg_submit").attr("disabled", false);
					birthJ = true;
				}//end of if
				
				} else {
					//1.입력된 생년월일이 8자 초과할때 :  auth:false
					$('#birth_check').text('생년월일을 확인해주세요.');
					$('#birth_check').css('color', 'red');
				}
		});
				
		//가입하기 실행 버튼 유효성 검사!
		var inval_Arr = new Array(4).fill(false);
		$('#reg_submit').click(function(){
			// 비밀번호가 같은 경우 && 비밀번호 정규식
			if (($('#member_pw').val() == ($('#member_pw2').val()))
					&& pwJ.test($('#member_pw').val())) {
				inval_Arr[0] = true;
				console.log('벌스 유효성:' + birthJ);
			} else {
				inval_Arr[0] = false;
			}
			// 이름 정규식
			if (nameJ.test($('#MEMBER-NM').val())) {
				inval_Arr[1] = true;	
			} else {
				inval_Arr[1] = false;
			}
			// 휴대폰번호 정규식
			if (phoneJ.test($('#member_phone').val())) {
				console.log(phoneJ.test($('#member_phone').val()));
				inval_Arr[2] = true;
			} else {
				inval_Arr[2] = false;
			}
			// 생년월일 정규식
			if (birthJ) {
				inval_Arr[3] = true;
			} else {
				inval_Arr[3] = true;
			}
			
			var validAll = true;
			for(var i = 0; i < inval_Arr.length; i++){
				
				if(inval_Arr[i] == false){
					validAll = false;
				}
			}
			
			if(validAll){ // 유효성 모두 통과
				
				alert('인증 이메일을 확인해주세요.');
				
			} else {
				
				alert('입력한 정보들을 다시 한번 확인해주세요 :)')
				$("#reg_submit").attr("disabled", true);
			 		
			}
		})
});	
</script>
</html>