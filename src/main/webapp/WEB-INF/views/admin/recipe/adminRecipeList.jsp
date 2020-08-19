<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 레시피 리스트</title>

<!-- Core Stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/recipeInsert.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body>

	<jsp:include page="/WEB-INF/include/adminNav.jsp" />

	<div class="container">
		<div class="titleCenter">레시피 관리</div>
		
		<!-- 검색 -->
		<form action="recipeList.adre" method="post">
			<span>
				<select name="searchCondition">
					<c:forEach items="${ conditionMap }" var="option">
						<option value="${ option.value }">${ option.key }
					</c:forEach>
				</select>
				<input name="searchKeyword" type="text" />
				<input type="submit" value="검색" />
			</span>
		</form>
		
		<div class="titleRight">
			<a href="adminRecipeChartView.adre">
				<button class="btn btn-primary">레시피 현황</button>
			</a>
			<a href="adminRecipeInsert.adre">
				<button class="btn btn-success">레시피 등록</button>
			</a>
		</div>
		<table class="table table-bordered">
			<tr align="center">
				<th width=100px;>썸네일</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${ recipeList }" var="recipe">
				<tr>
					<td>
						<a href="getRecipe.adre?recipe_no=${ recipe.recipe_no }">
							<img src="${pageContext.request.contextPath}/resources/img/recipe-com-img/${ recipe.recipe_complete_img }">
						</a>
					</td>
					<td>
						<a href="getRecipe.adre?recipe_no=${ recipe.recipe_no }">${ recipe.recipe_nm }</a>
					</td>
					<td>
						${ recipe.member_id }
					</td>
					<td>
						${ recipe.recipe_ymd }
					</td>
					<td>
						${ recipe.recipe_cnt }
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<!-- 페이징 -->
		<div class="pagingCenter">
			
			<ul id="paging" class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="recipeList.adre${pageMaker.makeQueryPage(pageMaker.startPage - 1)}&searchCondition=${ search.searchCondition }&searchKeyword=${ search.searchKeyword }">이전</a></li>
				</c:if>
			
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li class="page-item"><a class="page-link"
						href="recipeList.adre${pageMaker.makeQueryPage(idx)}&searchCondition=${ search.searchCondition }&searchKeyword=${ search.searchKeyword }">${idx}</a></li>
				</c:forEach>
			
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="recipeList.adre${pageMaker.makeQueryPage(pageMaker.endPage + 1)}&searchCondition=${ search.searchCondition }&searchKeyword=${ search.searchKeyword }">다음</a></li>
				</c:if>
			</ul>
		</div>
		<!-- end 페이징 -->
	</div>
</body>

<script src="<c:url value ="/resources/js/recipe/recipe.js" />"></script>

</html>