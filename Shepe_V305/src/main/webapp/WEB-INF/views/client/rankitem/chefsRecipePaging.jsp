<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>chefsRecipePaging</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<ul class="pagination pagination-sm">
		<c:if test="${paging.prevPage != 0}">
			<li class="page-item">
				<a class="page-link" href="getChefRecipeList.re?page=1#paging">처음</a>
			</li>
		</c:if>
		<c:if test="${paging.prevPage != 0}">
			<li class="page-item">
				<a class="page-link" href="getChefRecipeList.re?page=${paging.prevPage}#paging">&lt;</a>
			</li>
		</c:if>
		<c:forEach var="a" begin="${paging.startPage}" end="${paging.endPage}" step="1">
			<c:choose>
				<c:when test="${a eq paging.page}">
					<li class="page-item active"><a class="page-link" href="getChefRecipeList.re?page=${a}#paging">${a}</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="getChefRecipeList.re?page=${a}#paging">${a}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${ paging.nextPage !=0 }">
			<li class="page-item">
				<a class="page-link" href="getChefRecipeList.re?page=${paging.nextPage}#paging">&gt;</a>
			</li>
		</c:if>
		<c:if test="${ paging.nextPage !=0 }">
			<li class="page-item">
				<a class="page-link" href="getChefRecipeList.re?page=${paging.maxPage}#paging">끝</a>
			</li>
		</c:if>
		
	</ul>
</body>
</html>