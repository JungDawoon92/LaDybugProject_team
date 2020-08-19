<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shepe.admin.notice.impl.NoticeDAO"%>
<%@ page import="com.shepe.admin.notice.NoticeVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body>

<c:forEach items="${noticeList}" var="List">
					<!-- controller 의 noticeList 이름 : "List" -->
						<tr>
							<td><input type="checkbox" name="checkRow"
								value="${List.notice_sq}" /></td>
							<td><a href="detailClientNotice.do?notice_sq=${List.notice_sq}">${List.notice_nm}</a>
							</td>
							<td><c:out value="${List.member_id}" /></td>
							<td><fmt:formatDate value="${List.notice_ymd}"
									pattern="yy-MM-dd" /></td>
							<td><c:out value="${List.notice_rc}" /></td>
						</tr>
				</c:forEach>
</body>
</html>