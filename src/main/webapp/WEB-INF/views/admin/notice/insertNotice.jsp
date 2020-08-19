<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shepe.admin.notice.impl.NoticeDAO"%>
<%@ page import="com.shepe.admin.notice.NoticeVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertNotice</title>
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
			<h1>insertNotice</h1>
		</header>
		<hr />
		<form method="post" action="insertNotice.do" enctype="multipart/form-data">
			<table>
				<tr>
					<td colspan="3">
						<label for="notice_nm">제목</label>
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="" id="notice_nm" name="notice_nm" />
						</div>
					</td>
			 	<tr>
					<td><label for="member_id">작성자</label><!-- {#member_id} -->
						<input type="text" id="member_id" name="member_id" /></td>
				</tr>
			 
				<tr>
					<td>
						<label for="notice_contents">내용</label> 
						<textarea class="form-control" cols="80" rows="20" id="notice_contents"
							name="notice_contents" placeholder=""
							style ="resize:none"></textarea>
					</td>
				</tr>
				<tr>
					<td>업로드</td>
					<td align="left"><input type="file" name="uploadFile"/></td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn btn-outline-secondary">작성</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>