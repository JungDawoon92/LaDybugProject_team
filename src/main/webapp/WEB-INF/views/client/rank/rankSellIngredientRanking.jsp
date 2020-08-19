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
			<a class="nav-link" id="recipeList" href="getRankSellRecipeRankingList.rk">판매량 TOP 레시피</a>
		</li>
		<li class="nav-item">
			<a class="nav-link active" id="ingredientList" href="getRankSellIngredientRankingList.rk">판매량 TOP 식재료</a>
		</li>
	</ul>
	<div class="clearfix"></div>
	<br>
	
	<div class="text-center">
		<h3>핫 식재료 TOP 100!</h3>
	</div>
	
	<div class="row" id="ingredientRankingList">
		<c:forEach var="ingreList" items="${ ingreRankingList }" varStatus="status">
		<div class="col-12 col-sm-6 col-lg-4">
			<div class="single-small-receipe-area d-flex">
				<div class="receipe-thumb">
					<img src="${pageContext.request.contextPath}/resources/img/ingredient-img/${ ingreList.ingredient_thumbName }" alt="${ ingreList.ingredient_thumbName }" class='mr-3 mt-3 rounded-circle' style='width:60px; height:60px;'>
				</div>
				<div class="receipe-content">
					<span style="color: #f50920;">No.${ ingreList.rank_no }</span>
					<h5>${ ingreList.ingredient_nm }</h5>
					<i class="fa fa-fire font-italic" aria-hidden="true">${ ingreList.ingredient_sell_sum }</i>
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
			page++;
			var ingre_params = {pager : page}
			$.ajax({
				url: "getRankSellIngredientRankingListScrollAjax.rk",
				type: "POST",
				data: ingre_params,
				dataType: "JSON",
				success: function(result) {
					$.each(result, function(index, value) {
						var row = "";
						var profile = value.ingredient.thumbName;
						row += "<div class='col-12 col-sm-6 col-lg-4'>";
						row += "<div class='single-small-receipe-area d-flex'>";
						row += "<div class='receipe-thumb'>";
						row += "<a href='#'>";
						row += "<img src='${pageContext.request.contextPath}/resources/img/ingredient-img/"+profile+"' alt='"+profile+"' class='mr-3 mt-3 rounded-circle' style='width:60px; height:60px;'>";
						row += "</a></div><div class='receipe-content'>";
						row += "<span style='color: #f50920;'>No."+value.rank_no+"</span>";
						row += "<h5>"+value.ingredient_nm+"</h5>";
						row += "<i class='fa fa-user' aria-hidden='true'>"+value.ingredient_sell_sum+"</i>";
						row += "</div></div></div>";
						
						$("#ingredientRankingList").append(row);
					});
				},
				error: function(request, status, error) {
					alert("status :"+ status);
				}
			});
		}
	});
});
</script>
</html>