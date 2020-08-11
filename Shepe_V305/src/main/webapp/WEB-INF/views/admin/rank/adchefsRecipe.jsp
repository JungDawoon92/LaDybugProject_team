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
<jsp:include page="/WEB-INF/include/adminNav.jsp" />
	<div>
		<h4>${ chef_id } 님의 레시피입니다.
			<jsp:include page="../comment/adrankSubscribe.jsp" />	
		</h4>
	</div>
	<div class="row" id="chefsList">
	<c:forEach var="chefsList" items="${ chefRecipeList }" varStatus="status">
		<div class="col-12 col-sm-6 col-lg-4">
			<div class="single-best-receipe-area mb-30">
				<a href='getTestRecipe.re.ad?recipe_no=${chefsList.recipe_no}'>
					<img src='${pageContext.request.contextPath}/resources/img/temp-img/${chefsList.recipe_complete_img}' alt='${chefsList.recipe_complete_img}' style='width:350px; height:300px;'>
				</a>
				<div class="receipe-content">
					<h5>${ chefsList.recipe_nm }</h5>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>
	<div id="paging" class="pagination">
		<jsp:include page="adchefsRecipePaging.jsp"/>
	</div>
</div>
</body>
</html>