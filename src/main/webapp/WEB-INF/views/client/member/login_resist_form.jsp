<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome Shepe! 환영합니다!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/shepe/resources/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
        <div class="container">
				<div>
					<form action="login.do" method="post">
					        <div class="login-container animated fadeInDown bootstrap snippets">
					            <div class="loginbox bg-white">
					                <div class="loginbox-title">로그인</div>
					                <div class="loginbox-social">
					                    <div class="social-title ">Connect with Your Social Accounts</div>
					                    <div class="social-buttons">
					                        <a href="${kakao_url}" class="button-kakao">
					                            <i><img width="50" src="/shepe/resources/img/login_img/kakao.png"/></i>
					                        </a>
					                        <a href="${naver_url}" class="button-naver">
					                            <i><img width="50" src="/shepe/resources/img/login_img/naver.png"/></i>
					                        </a>
					                        <a href="#" class="button-google">
					                            <i><img width="55" src="/shepe/resources/img/login_img/google.png"/></i>
					                        </a>
					                    </div>
					                </div>
					                <div class="loginbox-or">
					                    <div class="or-line"></div>
					                    <div class="or">OR</div>
					                </div>
					                <div class="loginbox-textbox">
					                    <input type="text" id="member_id" name="member_id" class="form-control" placeholder="User ID" required>
					                </div>
					                <div class="loginbox-textbox">
					                    <input type="password" id="member_password" name="member_password" class="form-control" placeholder="Password" required>
					                </div>
					                <div class="pw_incorrect" style="text-align: center;">
			                    	<c:choose>
			                    		<c:when test="${authorize_msg == false}">이메일 인증을 확인해주세요. </c:when>
										<c:when test="${drop_member == false}">탈퇴한 회원입니다. 회원가입 부탁드립니다.</c:when>
			                    		<c:when test="${fail_first == false}">아이디 / 비밀번호를 확인해주세요.<br> 5회 실패 시 로그인 불가 (1/5)</c:when>
			                    		<c:when test="${fail_second == false}">아이디 / 비밀번호를 확인해주세요.<br> 5회 실패 시 로그인 불가 (2/5)</c:when>
			                    		<c:when test="${fail_third == false}">아이디 / 비밀번호를 확인해주세요.<br> 5회 실패 시 로그인 불가 (3/5)</c:when>
			                    		<c:when test="${fail_fourth == false}">아이디 / 비밀번호를 확인해주세요.<br> 5회 실패 시 로그인 불가 (4/5)</c:when>
										<c:when test="${account_lock == false}">5회 이상 비밀번호 불일치로 인해<br> 비밀번호 찾기 서비스를 이용바랍니다.</c:when>
			                    	</c:choose>												
									</div>
					                <div class="loginbox-forgot">
					                    <a href="forgetInfo.do">Forgot ID or Password?</a>
					                </div>
					                <div class="loginbox-submit">
					                    <input type="submit" class="btn btn-primary btn-block" value="Login">
					                </div>
					                <div class="loginbox-signup">
					                    <a href="joinOption.do">Sign Up</a>
					                </div>
					            </div>
					        </div>
					</form>
				</div>
	</div>
</body>
</html>