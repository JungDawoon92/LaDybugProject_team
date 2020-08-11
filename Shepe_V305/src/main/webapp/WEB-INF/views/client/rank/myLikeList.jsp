<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>My Like List</title>
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
	
	<!-- <div class="pull-right">
		<a href="getRankLikeRankingListToday.rk" class="btn btn-outline-success btn-md" role="button">일간</a>
		<a href="getRankLikeRankingListWeek.rk" class="btn btn-outline-success btn-md" role="button">주간</a>
		<a href="getRankLikeRankingListMonth.rk" class="btn btn-outline-success btn-md" role="button">월간</a>
		<a href="getRankLikeRankingList.rk" class="btn btn-outline-success btn-md active" role="button">누적</a>
	</div> -->
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item">
			<a class="nav-link" id="recipeList" href="#">작성한 레시피</a>
		</li>
		<li class="nav-item">
			<a class="nav-link active" id="likeList" href="getMyLikeList.rk">추천중인 레시피</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="subList" href="getMyChefList.rk">구독중인 쉐프</a>
		</li>
	</ul>
	<div class="clearfix"></div>
	<br>
	
	<div class="text-center">
		<h3>추천중인 레시피</h3>
		<br>
	</div>

	<div class="row" id="myLikeList">
	<c:forEach var="myList" items="${ myLikeList }" varStatus="status">
		<div class="col-12 col-sm-6 col-lg-4" id="${myList.recipe_no}">
			<div class="single-best-receipe-area mb-30">
				<a href='getTestRecipe.re?recipe_no=${ myList.recipe_no }'>
					<img src="${pageContext.request.contextPath}/resources/img/temp-img/${ myList.recipe_complete_img }" alt='${ myList.recipe_complete_img }' style='width:350px; height:300px;'>
				</a>
				<div class="receipe-content">
					<h5>${ myList.recipe_nm }</h5>
					<i class="fa fa-thumbs-up font-italic" aria-hidden="true">${ myList.recipe_like_sum }</i>
					<button type="button" class="btn btn-outline-primary btn-sm" onclick="checkDelete('${myList.recipe_no}')">
						<span><i class="fa fa-minus" aria-hidden="true">추천취소</i></span>
					</button>
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
				url: "getMyLikeListScrollAjax.rk",
				type: "POST",
				data: li_params,
				dataType: "JSON",
				success: function(result) {
					$.each(result, function(index, value){
						var row = "";
						row += "<div class='col-12 col-sm-6 col-lg-4' id='"+value.recipe_no+"'>";
						row += "<div class='single-best-receipe-area mb-30'>";
						row += "<a href='getTestRecipe.re?recipe_no="+value.recipe_no+"'>";
						row += "<img src='${pageContext.request.contextPath}/resources/img/temp-img/"+value.recipe_complete_img+"' alt='"+value.recipe_complete_img+"'></a>";
						row += "<div class='receipe-content'>";
						row += "<h5>"+value.recipe_nm+"</h5>";
						row += "<i class='fa fa-thumbs-up font-italic' aria-hidden='true'>"+value.recipe_like_sum+"</i>";
						row += "<button type='button' class='btn btn-outline-primary btn-sm' onclick='checkDelete("+value.recipe_no+")'>";
						row += "<span><i class='fa fa-minus' aria-hidden='true'>추천취소</i></span>";
						row += "</button></div></div><div>";
					
						$("#myLikeList").append(row);
					});
				},
				error: function(request, status, error) {
					alert("status : " + status);
				}
			});
		}
	});
});

function checkDelete(recipe_no) {
	if(confirm("추천을 취소하시겠습니까?") == false) {
		return false;
	} else {
		delLike(recipe_no);
	}
}

function delLike(recipe_no) {
	var r_no = recipe_no;
	var mem_like_id = "${memberInfo.member_id}";
	var params = {
		recipe_no : r_no,
		member_like_id : mem_like_id
	}
	$.ajax({
		url: "deleteRankLikeAjax.rk",
		type: "POST",
		data: params,
		success: function(result) {
			alert("추천취소 완료");
			$("#"+recipe_no).remove();
			
		},
		error: function(request, status, error) {
			alert("status : " + status)
		}
	});
}
</script>
</html>