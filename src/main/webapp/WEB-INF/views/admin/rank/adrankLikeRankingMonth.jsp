<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Month Like Ranking</title>
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
		<a href="getRankLikeRankingListToday.rk.ad" class="btn btn-outline-success btn-md" role="button">일간</a>
		<a href="getRankLikeRankingListWeek.rk.ad" class="btn btn-outline-success btn-md" role="button">주간</a>
		<a href="getRankLikeRankingListMonth.rk.ad" class="btn btn-outline-success btn-md active" role="button">월간</a>
		<a href="getRankLikeRankingList.rk.ad" class="btn btn-outline-success btn-md" role="button">누적</a>
	</div>
	
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item">
			<a class="nav-link active" id="likeList" href="getRankLikeRankingListToday.rk.ad">추천 레시피</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="subList" href="getRankSubscribeRankingListToday.rk.ad">쉐프</a>
		</li>
	</ul>
	<div class="clearfix"></div>
	<br>
	
	<div class="text-center">
		<h3>이달의 핫 레시피 TOP 12!</h3>
	</div>

	<div class="row" id="likeRankingListMonth">
	<c:forEach var="mtLikeList" items="${ monthLikeList }" varStatus="status">
		<div class="col-12 col-sm-6 col-lg-4">
			<div class="single-best-receipe-area mb-30">
				<a href='getTestRecipe.re.ad?recipe_no=${mtLikeList.recipe_no}'>
					<img src='${pageContext.request.contextPath}/resources/img/temp-img/${mtLikeList.recipe_complete_img}' alt='${mtLikeList.recipe_complete_img}' style='width:350px; height:300px;'>
				</a>
				<div class="receipe-content">
					<h5>No.${status.count} &nbsp;&nbsp;${ mtLikeList.recipe_nm }</h5>
					<i class="fa fa-thumbs-up font-italic" aria-hidden="true">${ mtLikeList.recipe_like_sum }</i>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>		
</div>
</body>
</html>