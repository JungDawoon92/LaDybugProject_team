<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
	<jsp:include page="/WEB-INF/include/Nav.jsp" />
	
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item">
			<a class="nav-link" id="likeList" href="getRankLikeRankingListToday.rk">좋아요 TOP 레시피</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="subList" href="getRankSubscribeRankingListToday.rk">구독자 TOP 쉐프</a>
		</li>
		<li class="nav-item">
			<a class="nav-link active" id="recipeList" href="getRankSellRecipeRankingList.rk">판매량 TOP 레시피</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="ingredientList" href="getRankSellIngredientRankingList.rk">판매량 TOP 식재료</a>
		</li>
	</ul>
	<div class="clearfix"></div>
	<br>
	
	<div class="text-center">
		<h3>레시피 판매량 TOP 100!</h3>
	</div>
	
	<div class="row" id="recipeRankingList">
	<c:forEach var="recipeList" items="${ recipeRankingList }" varStatus="status">
		<div class="col-12 col-sm-6 col-lg-4">
			<div class="single-best-receipe-area mb-30">
				<a href='getRecipe.re?recipe_no=${ recipeList.recipe_no }'>
					<img src="${pageContext.request.contextPath}/resources/img/recipe-com-img/${ recipeList.recipe_complete_img }" alt='${ recipeList.recipe_complete_img }' style='width:350px; height:300px;'>
				</a>
				<div class="receipe-content">
					<h5 id="rank_no" data-rank_no="${ recipeList.rank_no }">No.${ recipeList.rank_no }&nbsp;&nbsp;${ recipeList.recipe_nm }</h5>
					<i class="fa fa-fire font-italic" aria-hidden="true">${ recipeList.recipe_sell_sum }</i>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	var page = 1;
	
	$(window).scroll(function() {
		if($(document).height() - $(window).height() == $(window).scrollTop()) {
			console.log("스크롤 인식");
			page ++;
			var li_params = {pager : page}
			$.ajax({
				url: "getRankSellRecipeRankingListScrollAjax.rk",
				type: "POST",
				data: li_params,
				dataType: "JSON",
				success: function(result) {
					$.each(result, function(index, value){
						var row = "";
						row += "<div class='col-12 col-sm-6 col-lg-4'>";
						row += "<div class='single-best-receipe-area mb-30'>";
						row += "<a href='getRecipe.re?recipe_no="+value.recipe_no+"'>";
						row += "<img src='${pageContext.request.contextPath}/resources/img/recipe-com-img/"+value.recipe_complete_img+"' alt='"+value.recipe_complete_img+"'></a>";
						row += "<div class='receipe-content'>";
						row += "<h5>No."+value.rank_no+"&nbsp;&nbsp;"+value.recipe_nm+"</h5>";
						row += "<i class='fa fa-fire font-italic' aria-hidden='true'>"+value.recipe_sell_sum+"</i>";
						row += "</div></div><div>";
					
						$("#recipeRankingList").append(row);
					});
				},
				error: function(request, status, error) {
					alert("status : " + status);
				}
			});
		}
	});
});
</script>
</html>