<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shepe.admin.qna.impl.QnaDAO"%>
<%@ page import="com.shepe.admin.qna.QnaVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getQnaList</title>
<style>
.pagination {
	justify-content: center;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function deletes() {
		if (confirm("질문을 삭제 하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
	function inserts() {
		if (confirm("질문을 추가 하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<div class="container">
		<section>
			<h1>Q & A</h1>
			<table class="table table-dark table-striped">
				<tr>
					<th>게시글</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>글삭제</th>
				</tr>
				<c:forEach items="${qnaList}" var="List">
					<!-- controller 의 qnaList 이름 : "List" -->
					<tr>
						<td><a href="detailQna.do?qna_sq=${List.qna_sq}">${List.qna_nm}</a></td>
						<td><c:out value="${List.member_id}" /></td>
						<td><fmt:formatDate value="${List.qna_ymd}"
								pattern="yy-MM-dd" /></td>
						<td><a href="deleteQna.do?qna_sq=${List.qna_sq}"
							class="button" onclick="return deletes()">삭제</a>
					</tr>
				</c:forEach>
				<tr class="text-right">
					<td colspan="9" class="text-right"
						style="border-bottom: transparent;">
				</tr>
			</table>
			<button type="button" class="btn btn-outline-secondary"
				style="float: right"
				onclick="location.href='insertQnaView.do'; return inserts()">질문하기</button>
		</section>
		<!-- 취소해도 질문으로 넘어감 -->
	</div>

	<!-- 페이징 -->

	<div class="container">
		<ul class="pagination">
			<c:if test="${paging.prevpage != 0}">
				<li class="page-item"><a class="page-link"
					href="getQnaList.do?page=${paging.prevpage}">&lt;&lt;</a></li>
			</c:if>
			<c:choose>
				<c:when test="${paging.page <= 1}">
					<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="getQnaList.do?page=${paging.page - 1}">&lt;</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="a" begin="${paging.startpage}"
				end="${paging.endpage}" step="1">
				<c:choose>
					<c:when test="${a == paging.page}">
						<li class="page-item active"><a class="page-link" href="#">${a}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="getQnaList.do?page=${a}">${a}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.page >= paging.maxpage}">
					<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="getQnaList.do?page=${paging.page + 1}">&gt;</a></li>
				</c:otherwise>
			</c:choose>
			<c:if test="${paging.nextpage ne 0}">
				<li class="page-item"><a class="page-link"
					href="getQnaList.do?page=${paging.nextpage}">&gt;&gt;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>