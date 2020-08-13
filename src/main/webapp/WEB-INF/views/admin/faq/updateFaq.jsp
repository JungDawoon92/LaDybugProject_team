<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shepe.admin.faq.impl.FaqDAO"%>
<%@ page import="com.shepe.admin.faq.FaqVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateFaQ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/adminNav.jsp"></jsp:include>
	<div class="container">
		<header>
			<h1>updateFaQ</h1>
		</header>
		<hr />
		<form method="post" action="updateFaq.do">
			<table>
				<tr>
					<td>
						<input type="hidden" name="faq_sq" value="${faqDetail.faq_sq}" />
						<label for="faq_nm">제목</label>${faqDetail.faq_nm}
						<label for="member_id">작성자</label>${faqDetail.member_id}
					</td>
				</tr>
				<tr>
					<td>
						<label for="faq_contents"></label>
						<textarea class="form-control" name="faq_contents" 
						style = "width:500px; height:300px; resize: none; font-Size:15px;" >
						${faqDetail.faq_contents}</textarea>
					</td>
				<tr>
					<td><br>
						<button type="submit" class="btn btn-info">수정하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>