<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>레시피 작성자</h4>
	<div class="media mt-3">
		<img src="${pageContext.request.contextPath}/resources/img/profileImg/${member_img}" class="align-self-center mr-3" style="width: 60px">
		<div class="media-body">
			<h5>${ recipe.member_nickname }</h5>
			<span class="text-left">쉐프와 쉐프의 레시피가 마음에 드신다면 구독과 좋아요를 눌러주세요 :)</span>
			<c:if test="${ member_id ne recipe.member_id }">
				<div class="pull-right">
					<jsp:include page="../comment/rankLike.jsp" />
					<jsp:include page="../comment/rankSubscribe.jsp" />
				</div>
			</c:if>
		</div>
		<div class="clearfix"></div>
	</div>
</body>
</html>