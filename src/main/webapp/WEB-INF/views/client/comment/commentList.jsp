<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>Comment</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/rank.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">	
	<div class="mt-3">
		<h3>요리후기&nbsp;<span class="text-info" id="commentCnt"></span></h3>
	</div>
	
	
	<div id="commentList">
	<!-- 댓글 리스트 삽입 -->
	</div>
	<br>
	<div class="text-center">
		<c:if test="${ listCnt gt 5 }">
			<a type="button" id="addList" class="btn btn-outline-secondary" href="#addList">댓글 더보기</a>
			<a type="button" id="delList" class="btn btn-outline-secondary" href="#commentCnt">댓글 접기</a>
		</c:if>
	</div>
	
	<form id="commentForm" action="insertComment.co" method="post" enctype="multipart/form-data">
		<input type="hidden" id="recipe_no" name="recipe_no" value="${ recipeDetail.recipe_no }" />
		<input type="hidden" id="member_id" name="member_id" value="${ memberInfo.member_id }" />
		<input type="hidden" id="member_nickname" name="member_nickname" value="${ memberInfo.member_nickname }" /><br>
		<div class="form-group">
			<div>
				<textarea class="form-control" rows="5" id="comment_content" name="comment_content" placeholder="후기를 남겨주세요~" required></textarea>
				<div class="custom-file pmd-custom-file-outline">
					<input type="file" class="custom-file-input" id="coUploadFile" name="coUploadFile">
					<label class="custom-file-label" for="coUploadFile">프로필 사진</label>
				</div>
				<div class="pull-right"><br><button type="submit" class="btn btn-outline-dark">등록</button></div><div class="clearfix" />
			</div>
		</div>
	</form>
</div>

</body>
<script type="text/javascript">
$(document).ready(function() {
	var page = 1;
	commentList(page);
	
	$("#addList").click(function() {
		page++;
		commentList(page);
	});
	$("#delList").click(function() {
		$("#commentList").empty();
		page = 1;
		commentList(page);
	});
});

function commentList(page) {
	var li_params = { 
			recipe_no : "${recipeDetail.recipe_no}",
			pager : page 
		}
	$.ajax({
		url: "getCommentListAjax.co",
		type: "POST",
		data: li_params,
		dataType: "JSON",
		success: function(result) {
			var commentCnt = ${listCnt};
			$("#commentCnt").empty();
			$.each(result, function(index, value){
				profile = value.member_img;
				var row = "";
				row += "<div class='media border p-3'>";
				row += "<img src='${pageContext.request.contextPath}/resources/img/profileImg/"+profile+"' alt='"+profile+"' class='mr-3 mt-3 rounded-circle' style='width:60px; height:60px;'>";
				row += "<div class='media-body'>";
				row += "<h5>"+value.member_nickname+"<small><i>&nbsp;&nbsp;&nbsp;"+value.comment_ymd+"&nbsp;&nbsp;&nbsp;</i>";
				row += "</small></h5><div class='clear'></div>";
				row += "<pre class='wordbreak'>"+value.comment_content+"</pre>";
				row += "</div></div>";
	
				$("#commentList").append(row);
			});
			$("#commentCnt").append(commentCnt);
		},
		error: function(request, status, error) {
			alert("status : " + status);
		}
	});
}
</script>
</html>