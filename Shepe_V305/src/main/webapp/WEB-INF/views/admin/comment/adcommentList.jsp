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
		<h3>요리후기&nbsp;<span class="text-info" id="commentCnt"></span>
			<span class='right'>
				<input type='checkbox' class='check_all' id='check_all' onclick='check_all()'>
				<button type='button' class='btn btn-sm btn-outline-danger' onclick='deleteCheck()'>삭제</button>
			</span>
		</h3>
	</div>
	
	
	<div id="commentList">
	<!-- 댓글 리스트 삽입 -->
	</div>

	<div id="paging" class="pagination">
		<jsp:include page='adcommentListPaging.jsp' />
	</div>	
	
	<form id="commentForm" action="insertComment.co.ad" method="post" enctype="multipart/form-data">
		<input type="hidden" id="recipe_no" name="recipe_no" value="${ recipeDetail.recipe_no }" />
		<input type="hidden" id="member_id" name="member_id" value="${ memberInfo.member_id }" />
		<input type="hidden" id="member_nickname" name="member_nickname" value="${ memberInfo.member_nickname }" /><br>
		<div class="form-group">
			<div>
				<textarea class="form-control" rows="5" id="comment_content" name="comment_content" placeholder="후기를 남겨주세요~" required></textarea>
				<div class="custom-file pmd-custom-file-outline">
					<input type="file" class="custom-file-input" id="coUploadFile" name="coUploadFile">
					<label class="custom-file-label" for="coUploadFile">프로필사진</label>
				</div>
				<div class="pull-right"><br><button type="submit" class="btn btn-outline-dark">등록</button></div><div class="clearfix" />
			</div>
		</div>
	</form>
</div>
<!-- 댓글 수정 modal -->
<div class="modal fade" id="updateModal" role="dailog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">댓글 수정</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<input type="hidden" id="comment_sq">
				</div>
				<div class="form-group">
					<label for="member_nickname">작성자</label>
					<span><strong>${ memberInfo.member_nickname }</strong></span>
				</div>
				<div class="form-group">
					<label for="comment_content">댓글 내용</label>
					<textarea class="form-control" rows="5" id="comment_content" name="comment_content" placeholder="수정할 댓글을 입력하세요" required></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn btn-outline-warning" onclick="updateCheck()">수정</button>
				<button type="button" class="btn btn btn-outline-dark" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">

$(document).ready(function() {
	$('#updateModal').on('show.bs.modal', function(e) {
		var comment_sq = $(e.relatedTarget).data('comment_sq');
		var comment_content = $(e.relatedTarget).data('comment_content');
		$(".modal-body #comment_sq").val(comment_sq);
		$(".modal-body #comment_content").html(comment_content);
	});

	commentList();

});

function commentList(npage) {
	var li_params = { recipe_no : "${recipeDetail.recipe_no}", page : npage }
	$.ajax({
		url: "getCommentListAjax.co.ad",
		type: "POST",
		data: li_params,
		dataType: "JSON",
		success: function(result) {
			var commentCnt = "${paging.listCount}";
			var row = "";
			var profile = "";
			console.log(profile);
			$("#commentList").empty();
			$("#commentCnt").empty();
			$.each(result, function(index, value){
				profile = value.member_img;
				row += "<div class='media border p-3'>";
				row += "<img src='${pageContext.request.contextPath}/resources/img/profileImg/"+profile+"' alt='"+profile+"' class='mr-3 mt-3 rounded-circle' style='width:60px; height:60px;'>";
				row += "<div class='media-body'>";
				row += "<h5>"+value.member_nickname+"<small><i>&nbsp;&nbsp;&nbsp;"+value.comment_ymd+"&nbsp;&nbsp;&nbsp;</i>";
				row += "<button type='button' class='btn btn-sm btn-outline-warning' data-toggle='modal' data-target='#updateModal' data-comment_sq="+value.comment_sq+" data-comment_content="+value.comment_content+">수정</button>";
				row += "<div class='right'><input type='checkbox' class='check_one' name='delBtn' id="+value.comment_sq+"></div>"
				row += "</small></h5><div class='clear'></div>";
				row += "<pre class='wordbreak'>"+value.comment_content+"</pre>";
				row += "</div></div>";
			});
			$("#commentList").append(row);
			$("#commentCnt").append(commentCnt);
			
		},
		error: function(request, status, error) {
			alert("status : " + status);
		}
	});
}

function updateCheck() {
	var c_content = $('.modal-body textarea').val();
	var c_sq = $('#comment_sq').val();
	if(confirm('정말로 수정하시겠습니까?')) {
		location.href='updateComment.co.ad?comment_content='+c_content+'&comment_sq='+c_sq+'&recipe_no='+${recipeDetail.recipe_no};
	}
}

function check_all() {
	if($('#check_all').is(':checked')) {
		$('input[type=checkbox]').prop('checked', true);
	} else {
		$('input[type=checkbox]').prop('checked', false);
	}
}

$('.check_one').click(function() {
	$('#check_all').prop('checked', false);
});

function deleteCheck() {
	var arr = new Array();
	$("input[name=delBtn]:checked").each(function(){
		arr.push($(this).attr('id'));
	});
	if(arr.length == 0) {
		alert("삭제할 댓글을 선택하세요.");
	} else {
		if(confirm('정말로 삭제하시겠습니까?')) {
			location.href="deleteComment.co.ad?recipe_no="+${recipeDetail.recipe_no}+"&arr="+arr;
			$('#check_all').prop('checked', false);
		}
	}
}

</script>
</html>