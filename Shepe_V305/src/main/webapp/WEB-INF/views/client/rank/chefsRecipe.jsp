<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>Chefs Recipe</title>
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
	<div>
		<%-- <h4>${ subCheck.member_id } 님의 레시피입니다. --%>
		<h4>${ chef_id } 님의 레시피입니다.
			<c:if test="${ memberInfo.member_id ne chef_id }">
				<jsp:include page="../comment/rankSubscribe.jsp" />	
			</c:if>
		</h4>
	</div>
	<div class="row" id="chefsList">
	<c:forEach var="chefsList" items="${ chefRecipeList }" varStatus="status">
		<div class="col-12 col-sm-6 col-lg-4">
			<div class="single-best-receipe-area mb-30">
				<a href='getTestRecipe.re?recipe_no=${ chefsList.recipe_no }'>
					<img src='${pageContext.request.contextPath}/resources/img/temp-img/${ chefsList.recipe_complete_img }' alt='${ chefsList.recipe_complete_img }' style='width:350px; height:300px;'>
				</a>
				<div class="receipe-content">
					<h5>${ chefsList.recipe_nm }</h5>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>
	<%-- <div id="paging" class="pagination">
		<jsp:include page="chefsRecipePaging.jsp"/>
	</div> --%>
</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	var page = 1;
	
	$(window).scroll(function() {
		if($(document).height() - $(window).height() == $(window).scrollTop()) {
			console.log("스크롤 인식");
			page++;
			var mem_id = "${chef_id}";
			console.log(mem_id);
			var ch_params = {
					pager : page,
					member_id : mem_id
				}
			$.ajax({
				url: "getChefRecipeListScrollAjax.re",
				type: "POST",
				data: ch_params,
				dataType: "JSON",
				success: function(result) {
					$.each(result, function(index, value) {
						var row = "";
						row += "<div class='col-12 col-sm-6 col-lg-4'>";
						row += "<div class='single-best-receipe-area mb-30'>";
						row += "<a href='getTestRecipe.re?recipe_no="+value.recipe_no+"'>";
						row += "<img src='${pageContext.request.contextPath}/resources/img/temp-img/"+value.recipe_complete_img+"' alt='"+value.recipe_complete_img+"'></a>";
						row += "<div class='receipe-content'><h5>"+value.recipe_nm+"</h5>";
						row += "</div></div></div>";
						
						$("#chefsList").append(row);
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