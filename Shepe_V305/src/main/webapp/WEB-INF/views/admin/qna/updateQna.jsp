<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shepe.admin.qna.impl.QnaDAO"%>
<%@ page import="com.shepe.admin.qna.QnaVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateQnA</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<div class="container">
		<header>
			<h1>updateQnA</h1>
		</header>
		<hr />
		<form method="post" action="updateQna.do">
			<table>
				<tr>
					<td>
						<input type="hidden" name="qna_sq" value="${qnaDetail.qna_sq}" />
						<label for="qna_nm">제목</label>${qnaDetail.qna_nm}
						<label for="member_id">작성자</label>${qnaDetail.member_id}
					</td>
				</tr>
				<tr>
					<td>
						<label for="qna_contents"></label>
						<textarea class="form-control" name="qna_contents" 
							style = "width:500px; height:300px; resize: none; font-Size:15px;" >
						${qnaDetail.qna_contents}</textarea>
					</td>
				<tr>
					<td><br>
						<button type="submit" class="btn btn-info">수정하기</button>
						<a href="getQnaList.do" class="btn btn-info" role="button">돌아가기</a><!-- 바로 뒤로 돌아가기 수정하기 -->
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>