<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html> 
<html lang="ko">
<head>
<style type="text/css">
.menu-nav-wrap {
	background: #fff;
}

.menu-nav ul {
	position: relative;
    font-size: 0;
    border-bottom: 1px solid #111;
    border-top: 1px solid #111;
}

.menu-nav ul li {
	display: inline-block;
    width: 33.33333%;
    vertical-align: middle;
    white-space: nowrap;
    text-align: center;
    height: 45px;
    line-height: 45px;
}

.menu-nav ul li a {
    position: relative;
    display: block;
    font-size: 16px;
    color: #b6b6b6;
    text-decoration: none;
}

.menu-nav ul li a:hover{
	color: #ffffff;
    background-color: #40ba37;
    border-bottom: 3px solid #1c8314;	
}

.menu-nav ul .active {
	font-weight: 600;
    color: black;
}
</style>
</head>

<body>
	<div class="menu-nav-wrap">
		<div class="menu-nav">
			<ul>
				<c:if test="${ sessionScope.member_id != null }">
					<li><a id="paymentHistory" href="/shepe/myPage/orderHistory">구매내역</a></li>				
					<li><a id="memberInfo" href="/shepe/myPage/memberDetail.do">정보 수정</a></li>
					<li><a id="memberInfo" href="/shepe/getMyLikeList.rk">나의 활동내역</a></li>
				</c:if>
				<c:if test="${ sessionScope.member_id == null }">
					<li><a id="paymentHistory" href="/shepe/myPage/orderHistory">구매내역</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>