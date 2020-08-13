<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">
<link rel="stylesheet" href="/shepe/resources/css/mypage.css" type="text/css">
    
<!------ Include the above in your HEAD tag ---------->
<style>
body{margin-top:20px;}
.fa-fw {width: 2em;}
.sidemenu{
	width : 200px;
	padding-right : 20px;
	margin-bottom : 30px;
}
.nav-pills>li.active>a{
background-color : #3d3d5c;
font-size : 18px;
font-weight : bold;
}
.nav-pills>li.active>a:hover{
background-color: #ffd633;
}
.sidemenu>li>a{
	color: #3d3d5c;
    padding-left: 0px;
    font-weight : bold;
    font-size : 15px;
    
}
</style>
<meta charset="utf-8">
</head>
<body>
<c:if test="${ member_id != null }">
	<ul id="mypagecontents" class="sidemenu nav nav-pills nav-stacked">
		<li class="active"><a href="./myPage.do"><i class="fa fa-home fa-fw"></i>마이 페이지</a></li>
        <li><a href="/shepe/myPage.do" title="구매내역 보기" ><i class="fas fa-krw fa-fw"></i>구매내역 보기</a></li>
        <li><a href="/shepe/myPage/memberDetail.do" title="회원 상세 정보"><i class="fas fa-address-card fa-fw"></i>회원 상세 정보</a></li>
        <li><a href="/shepe/myPage/changePWD.do" title="비밀번호 변경" ><i class="fas fa-user-lock fa-fw" ></i>비밀번호 변경</a></li>
        <li><a href="/shepe/myPage/memberDeleteView" title="회원탈퇴" ><i class="fas fa-user-times fa-fw"></i>회원 탈퇴</a></li>
    </ul>
</c:if>
<c:if test="${ kname != null || nname != null }">
  <ul id="mypagecontents" class="sidemenu nav nav-pills nav-stacked">
	<li class="active"><a href="myPage.do"><i class="fa fa-home fa-fw"></i>마이 페이지</a></li>
    <li><a href="cartList" title="장바구니" ><i class="fas fa-shopping-cart fa-fw"></i>장바구니</a></li>
    <li><a href="/shepe/myPage.do" title="구매내역 보기" ><i class="fas fa-krw fa-fw"></i>구매내역 보기</a></li>
  </ul>
</c:if>
</body>
</html>