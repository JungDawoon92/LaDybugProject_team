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
<span>
	<c:choose>
		<c:when test="${likeCheck.member_like_id eq member_id }">
			<button type="button" class="btn btn-danger" id="likeBtn" onclick="checkLike()" disabled="disabled">
				<span><i class="fa fa-thumbs-o-up" aria-hidden="true">추천중</i></span>
			</button>
		</c:when>
		<c:otherwise>
			<button type="button" class="btn btn-outline-warning" id="likeBtn" onclick="checkLike()">
				<span><i class="fa fa-plus" aria-hidden="true">좋아요</i></span>
			</button>
		</c:otherwise>
	</c:choose>	
</span>
</body>
<script type="text/javascript">

function checkLike() {
	if(confirm("해당레시피를 추천하시겠습니까?") == false) {
		return false;
	} else {
		addLike();
	}
}
function addLike() {
	var r_no = "${recipe.recipe_no}";
	var mem_id = "${member_id}";
	var mem_nick = "${member_nick}";
	var params = {
		recipe_no : r_no,
		member_like_id : mem_id,
		member_nickname : mem_nick
	}
	$.ajax({
		url: "insertRankLikeAjax.rk",
		type: "POST",
		data: params,
		success: function(result) {
			var html = "<span><i class='fa fa-thumbs-o-up' aria-hidden='true'>추천중</i></span>";
			$("#likeBtn").empty();
			$("#likeBtn").append(html);
			$("#likeBtn").attr("class", "btn btn-danger");
			$("#likeBtn").attr("disabled", true);
		},
		error: function(request, status, error) {
			alert("status : " + status)
		}
	});
}
</script>
</html>