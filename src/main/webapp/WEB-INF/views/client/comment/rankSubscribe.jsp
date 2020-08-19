<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<span>
	<c:choose>
		<c:when test="${subCheck.member_sub_id eq member_id }">
			<button type="button" class="btn btn-danger pull-right" id="subscribeBtn" onclick="checkSubscribe('${subCheck.member_id}')" disabled="disabled">
				<span><i class="fa fa-thumbs-o-up" aria-hidden="true">구독중</i></span>
			</button>
		</c:when>
		<c:otherwise>
			<button type="button" class="btn btn-outline-warning pull-right" id="subscribeBtn" onclick="checkSubscribe('${chef_id}')">
				<span><i class="fa fa-plus" aria-hidden="true">소식받기</i></span>
			</button>
		</c:otherwise>
	</c:choose>
</span>
</body>
<script type="text/javascript">
function checkSubscribe(member_id) {
	var m_id = member_id;
	if(confirm("해당 쉐프의 소식을 받으시겠습니까?") == false) {
		return false;
	} else {
		addSubscribe(m_id);
	}
}
function addSubscribe(m_id) {
	var mem_id = m_id;
	var mem_sub_id = "${member_id}";
	var mem_nick = "${member_nick}";
	var params = {
		member_id : mem_id,
		member_sub_id : mem_sub_id,
		member_nickname : mem_nick
	}
	console.log(params);
	$.ajax({
		url: "insertRankSubscribeAjax.rk",
		type: "POST",
		data: params,
		success: function(result) {
			var html = "<span><i class='fa fa-thumbs-o-up' aria-hidden='true'>구독중</i></span>";
			$("#subscribeBtn").empty();
			$("#subscribeBtn").append(html);
			$("#subscribeBtn").attr("class", "btn btn-danger");
			$("#subscribeBtn").attr("disabled", true);
		},
		error: function(request, status, error) {
			alert("status : " + status)
		}
	});
}
</script>
</html>