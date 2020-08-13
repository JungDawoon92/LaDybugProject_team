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
<title>insertFaQ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
textarea {
	width:510px;
	height:500px;
	margin: 10px;
}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 10px;
  font-size: 16px;
  margin: 2px 2px;
  cursor: pointer;
  border-radius: 12px;
  width: 100px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/include/adminNav.jsp"></jsp:include>
	<div class="container">
		<header>
			<h1>insertFaQ</h1>
		</header>
		<hr />
		<form method="post" action="insertFaq.do">
			<table>
				<tr>
					<td><label for="faq_category">카테고리</label> 
					<select id="faq_category" name="faq_category" class="form-control"
						style="width: auto;">
							<option value>선택하세요</option>
							<option value="회원/로그인">회원/로그인</option>
							<option value="상품">상품</option>
							<option value="주문/결제">주문/결제</option>
							<option value="배송/조회">배송/조회</option>
							<option value="취소/환불">취소/환불</option>
							<option value="교환/반품">교환/반품</option>
					</select>
					<label for="faq_nm">제목</label>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="제목"
								id="faq_nm" name="faq_nm" />
					</div></td>
				<tr>
					<td><label for="faq_contents">내용</label> 
							<textarea class="textarea" id="faq_contents"
							name="faq_contents" style="resize: none"></textarea>
					</td>
				</tr>
				<tr>
					<td><label for="member_id">작성자</label><input type="text"
						id="member_id" name="member_id" /></td>
				<tr>
					<td><hr />
						<button type="submit" class="button">FAQ 작성</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>