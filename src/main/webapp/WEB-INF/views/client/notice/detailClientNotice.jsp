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
<title>detailNotice</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	var jbStr ="";
    var jbStrReplace = jbStr.replace(' ', '&nbsp' );
    document.write( '<p>' + jbStrReplace + '</p>' );
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<div class="container">
		<header>
			<h1>detailNotice</h1>
		</header>
		<hr />
			<table>
				<tr>
					<td>
						<div class="contents">
							<input type="hidden" name="qna_sq" value="${noticeDetail.notice_sq}" />
							<div align="center">
								<span style="font-size:25px">${noticeDetail.notice_nm}</span>
							</div>
							<div align="right"><label for="member_id">작성자</label>${noticeDetail.member_id}
								<label>작성일</label><fmt:formatDate value="${noticeDetail.notice_ymd}" pattern="yy-MM-dd" />
								<label for="notice_rc">조회수</label>${noticeDetail.notice_rc}
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<label for="notice_contents"></label>
						</div>
						<pre>
							${noticeDetail.notice_contents}
						</pre>
						<img src="${pageContext.request.contextPath}/resources/img/notice_img/${noticeDetail.notice_img}"/>
					</td>
					<td></td>
					
				<c:if test="${noticeDetail.notice_img ne null}">
					<tr>
						<td>첨부파일 <a href="/shepe/resources/notice_img/${noticeDetail.notice_img}" 
							download>${noticeDetail.notice_img}</a></td>
					</tr>
				</c:if>
			</table>
			<hr />
			<div align="center">
				<a href="getClientNoticeList.do" class="btn btn-dark" role="button">목록</a>
			</div>
		</div>
</body>
</html>