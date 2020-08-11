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
<title>detailNotice</title>
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
			<h1>detailNotice</h1>
		</header>
		<hr />
		<form method="post" action="detailNotice.do">
			<table>
				<tr>
					<td>
						<label for="notice_nm">제목</label>${noticeDetail.notice_nm}
						<label for="member_id">작성자</label>${noticeDetail.member_id}
					</td>
				</tr>
				<tr>
					<td>
						<label for="notice_contents"></label>
							<textarea class="form-control" name="notice_contents" 
							style = "width:500px; height:300px; resize: none; font-Size:15px;" >
							${noticeDetail.notice_contents}</textarea>
					</td>
				<tr>
					<td>
						<!-- <button type="submit" class="btn btn-info">답변하기</button> -->
						<a href="updateNoticeView.do" class="btn btn-info" role="button">수정하기</a>
						<a href="getNoticeList.do" class="btn btn-info" role="button">목록</a>			
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>