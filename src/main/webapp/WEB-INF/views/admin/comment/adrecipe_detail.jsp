<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
</script>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<jsp:include page="/WEB-INF/include/adminNav.jsp" />
		<table class="table table-borderless">
			<thead>
				<tr>
					<th>레시피번호</th>
					<th>닉네임</th>
					<th>레시피타이틀</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${ recipeDetail.recipe_no }</td>
					<td>${ recipeDetail.member_nickname }</td>
					<td>${ recipeDetail.recipe_nm }</td>
					<td>${ recipeDetail.recipe_ymd }</td>
				</tr>
			</tbody>
		</table>
		
		<h4>레시피 작성자</h4>
		<div class="media mt-3">
		<img src="${pageContext.request.contextPath}/resources/img/bg-img/insta3.jpg" class="align-self-center mr-3" style="width:60px">
			<div class="media-body">
				<h5>${ recipeDetail.member_nickname }</h5>
				<span class="text-left">쉐프와 쉐프의 레시피가 마음에 드신다면 구독과 좋아요를 눌러주세요 :)</span>
				<div class="pull-right">
					<jsp:include page="adrankLike.jsp"/>
					<jsp:include page="adrankSubscribe.jsp" />
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div>
			<jsp:include page="adcommentList.jsp" />
		</div>
	</div>
</body>
</html>