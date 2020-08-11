<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Today Subscribe Ranking</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/rank.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">

	<jsp:include page="/WEB-INF/include/adminNav.jsp" />

	<div class="pull-right">
		<a href="getRankSubscribeRankingListToday.rk.ad" class="btn btn-outline-success btn-md active" role="button">일간</a>
		<a href="getRankSubscribeRankingListWeek.rk.ad" class="btn btn-outline-success btn-md" role="button">주간</a>
		<a href="getRankSubscribeRankingListMonth.rk.ad" class="btn btn-outline-success btn-md" role="button">월간</a>
		<a href="getRankSubscribeRankingList.rk.ad" class="btn btn-outline-success btn-md" role="button">누적</a>
	</div>
	
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item">
			<a class="nav-link" id="likeList" href="getRankLikeRankingListToday.rk.ad">추천레시피</a>
		</li>
		<li class="nav-item">
			<a class="nav-link active" id="subList" href="getRankSubscribeRankingListToday.rk.ad">쉐프</a>
		</li>
	</ul>
	<div class="clearfix"></div>
	<br>
	
	<div class="text-center">
		<h3>오늘의 핫 쉐프 TOP 15!</h3>
	</div>
	
	<div class="row" id="subRankingListToday">
		<c:forEach var="toSubList" items="${ todaySubList }" varStatus="status">
		<div class="col-12 col-sm-6 col-lg-4">
			<div class="single-small-receipe-area d-flex">
				<div class="receipe-thumb">
					<a href='getChefRecipeList.re.ad?member_id=${ toSubList.member_id }'>
						<img src="${pageContext.request.contextPath}/resources/img/profileImg/${toSubList.member_img}" alt="${toSubList.member_img}" class='mr-3 mt-3 rounded-circle' style='width:60px; height:60px;'>
					</a>
				</div>
				<div class="receipe-content">
					<span style="color: #f50920;">No.${ status.count }</span>
					<h5>${ toSubList.member_nickname }</h5>
					<i class="fa fa-user" aria-hidden="true">${ toSubList.member_sub_sum }</i>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>
</body>
</html>