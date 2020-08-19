<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>CommentListPaging</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
</head>
<body>
	<ul class="pagination pagination-sm">
	<c:if test="${paging.listcount != 0 }">
		<c:if test="${paging.prevpage != 0}">
			<li class="page-item">
				<a class="page-link" href="#paging" onclick="commentList(1);">처음</a>
			</li>
		</c:if>
		<c:if test="${paging.prevpage != 0}">
			<li class="page-item">
				<a class="page-link" href="#paging" onclick="commentList(${paging.prevpage});">&lt;</a>
			</li>
		</c:if>
		<c:forEach var="a" begin="${paging.startpage}" end="${paging.endpage}" step="1">
			<c:choose>
				<c:when test="${a eq paging.page}">
					<li class="page-item active"><a class="page-link" href="#paging" onclick="commentList(${a});">${a}</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="#paging" onclick="commentList(${a});">${a}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${ paging.nextpage !=0 }">
			<li class="page-item">
				<a class="page-link" href="#paging" onclick="commentList(${paging.nextpage});">&gt;</a>
			</li>
		</c:if>
		<c:if test="${ paging.nextpage !=0 }">
			<li class="page-item">
				<a class="page-link" href="#paging" onclick="commentList(${paging.maxpage});">끝</a>
			</li>
		</c:if>
	</c:if>
		
	</ul>
</body>
</html>