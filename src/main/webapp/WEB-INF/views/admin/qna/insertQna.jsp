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
<title>insertQnA</title>
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
			<h1>insertQnA</h1>
		</header>
		<hr />
		<form method="post" action="insertQna.do">
			<table>
				<tr>
					<td>
						<label for="qna_nm">제목</label>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="질문" id="qna_nm" name="qna_nm" />
						</div>
					</td>
			 	<tr>
					<td><label for="member_id">작성자</label>
						<input type="text" id="member_id" name="member_id" /></td>
				</tr>
			 
				<tr>
					<td>
						<label for="qna_contents">내용</label> 
						<textarea class="form-control" cols="80" rows="20" id="qna_contents"
							name="qna_contents" placeholder="250자 이내로 입력해주세요"
							style ="resize:none"></textarea>
					</td>
				</tr>
				<tr>
					<input type="hidden">
					<td>
						<button type="submit" class="btn btn-outline-secondary">작성</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>