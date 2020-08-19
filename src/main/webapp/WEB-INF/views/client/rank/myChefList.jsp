<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>My Chef List</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/shepe/resources/css/mypage.css" type="text/css">

<script type="text/javascript">
$(document).ready(function(){
	
	$("[data-toggle='tooltip']").tooltip();
	
	var page = 1;
	
	$(window).scroll(function() {
		if($(document).height() - $(window).height() == $(window).scrollTop()) {
			console.log("스크롤 인식");
			page ++;
			var sub_params = {pager : page}
			$.ajax({
				url: "getMyChefListScrollAjax.rk",
				type: "POST",
				data: sub_params,
				dataType: "JSON",
				success: function(result) {
					$.each(result, function(index, value){
						var row = "";
						var profile = value.member_img;
						row += "<div class='col-12 col-sm-6 col-lg-4' id="+value.member_id+">";
						row += "<div class='single-small-receipe-area d-flex'>";
						row += "<div class='receipe-thumb'>";
						row += "<a href='getChefRecipeList.re?member_id="+value.member_id+"'>";
						row += "<img src='${pageContext.request.contextPath}/resources/img/profileImg/"+profile+"' alt='"+profile+"' class='mr-3 mt-3 rounded-circle' style='width:60px; height:60px;'>";
						row += "</a></div><div class='receipe-content'>";
						row += "<span style='color: #f50920;''>No."+value.rank_no+"</span>";
						row += "<h5>"+value.member_nickname+"</h5>";
						row += "<a href='getChefRecipeList.re?member_id="+value.memer_id+"' data-toggle='tooltip' data-placement='right' title='쉐프의 새로운 레시피가 "+value.push_check+"개 있어요!'>";
						row += "<i class='fa fa-envelope-square' aria-hidden='true'>"+value.push_check+"</i></a>";
						row += "<i class='fa fa-user' aria-hidden='true'>"+value.member_sub_sum+"</i>";
						row += "<button type='button' class='btn btn-outline-primary btn-sm' onclick='checkDelete("+value.member_id+")'>";
						row += "<span class='text-primary'><i class='fa fa-minus' aria-hidden='true'>구독취소</i></span>";
						row += "</button></div></div></div>";
						
						$("#myChefList").append(row);
					});
				},
				error: function(request, status, error) {
					alert("status : " + status);
				}
			});
		}
	});
});


function checkDelete(member_id) {
	if(confirm("구독을 취소하시겠습니까?") == false) {
		return false;
	} else {
		delSubscribe(member_id);
	}
}

function delSubscribe(member_id) {
	var mem_id = member_id;
	var mem_sub_id = "${member_id}";
	var params = {
		member_id : mem_id,
		member_sub_id : mem_sub_id
	}
	$.ajax({
		url: "deleteRankSubscribeAjax.rk",
		type: "POST",
		data: params,
		success: function(result) {
			alert("구독취소 완료");
			$("#"+mem_id).remove();
			
		},
		error: function(request, status, error) {
			alert("status : " + status)
		}
	});
}
</script>
</head>
<body>
<div class="container wrapper">

	<jsp:include page="/WEB-INF/include/Nav.jsp" />
	
	<div><jsp:include page="/WEB-INF/include/myPageMenu.jsp" /></div>
	
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item">
			<a class="nav-link" id="likeList" href="/shepe/getMyLikeList.rk">추천중인 레시피</a>
		</li>
		<li class="nav-item">
			<a class="nav-link active" id="subList" href="/shepe/getMyChefList.rk">구독중인 쉐프</a>
		</li>
	</ul>
	<div class="clearfix"></div>
	<br>
	
	<div class="text-center">
		<h3>구독중인 쉐프</h3>
		<br>
	</div>

	<div class="row" id="myChefList">
	<c:forEach var="myList" items="${ myChefList }" varStatus="status">
		<div class="col-12 col-sm-6 col-lg-4" id="${ myList.member_id }">
			<div class="single-small-receipe-area d-flex">
				<div class="receipe-thumb">
					<a href='getChefRecipeList.re?member_id=${ myList.member_id }'>
						<img src="${pageContext.request.contextPath}/resources/img/profileImg/${ myList.member_img }" alt="${ myList.member_img }" class='mr-3 mt-3 rounded-circle' style='width:60px; height:60px;'>
					</a>
				</div>
				<div class="receipe-content">
					<a href='getChefRecipeList.re?member_id=${ myList.member_id }'>
						<h5>${ myList.member_nickname }</h5>
					</a>
					<a href='getChefRecipeList.re?member_id=${ myList.member_id }' data-toggle="tooltip" data-placement="right" title="쉐프의 새로운 레시피가 ${ myList.push_check }개 있어요!">
						<i class="fa fa-envelope-square" aria-hidden="true">${ myList.push_check }</i>
					</a>
					<i class="fa fa-user" aria-hidden="true">${ myList.member_sub_sum }</i>
					<button type="button" class="btn btn-outline-primary btn-sm" onclick="checkDelete('${myList.member_id}')">
						<span class="text-primary"><i class="fa fa-minus" aria-hidden="true">구독취소</i></span>
					</button>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>
</body>

</html>