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
<title>getNoticeList</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
.pagination {
	justify-content: center;
}

tr, th, td {
	padding: 10px;
}

@media all and (max-width: 995px) {
     #paging456 {
       display: none;
     }
}
.btn {
	margin : 10px;
}

.faqList{
	margin:15px;
	text-align:center;
	font-weight:bold;
	font-size:40px;
 }
</style>

<script type="text/javascript">

$(document).ready(function(){
	var page = 1;	// 처음 받아올 페이지 번호 
	
	$(window).scroll(function() {
		if($(document).height() - $(window).height() == $(window).scrollTop()) {
			console.log("스크롤 인식");
			page ++;	
			var li_params = {pager : page}	
			$.ajax({
				url: "getClientNoticeListScroll.do",	// 컨트롤러 이름 
				type: "POST",
				data: li_params,
				dataType: "JSON",				// 받아올 type
				success: function(result) {
					$.each(result, function(index, value){
						var row = "";
						row += "<tr><td><a href='detailClientNotice.do?notice_sq="+value.notice_sq+"'>"+value.notice_nm+"</a></td>";
						row += "<td>"+value.member_id+"</td>";
						row += "<td>"+value.notice_ymd+"</td>";
						row += "<td>"+value.notice_rc+"</td>";	// html 은 ""로 묶어주고 불러 올 값은 ++로 묶어서 연결해준다 ''
						console.log("append");
						$("#appendbox").append(row);
					});
				},
				error: function(request, status, error) {
					alert("status : " + status);
				}
			});
		}
	});
});
</script>

</head>
<body>
	<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<div class="container">
		<div>
			<div align="center" class="faqList float-left">Notice</div>
			<div>
			<table class="table table-light table-striped">
				<colgroup>
					<col width="*%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>제 목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
					<!-- controller 의 noticeList 이름 : "List" -->
				<tbody id="appendbox">
					<c:forEach items="${noticeList}" var="List">
						<tr>
							<td><a href="detailClientNotice.do?notice_sq=${List.notice_sq}">${List.notice_nm}</a></td>
							<td><c:out value="${List.member_id}" /></td>
							<td><fmt:formatDate value="${List.notice_ymd}" pattern="yy-MM-dd" /></td>
							<td><c:out value="${List.notice_rc}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
			<!-- 페이징 -->
	 <div class="container">
		<ul class="pagination" id="paging456">
			<c:if test="${paging.prevpage != 0}">
				<li class="page-item"><a class="page-link"
					href="getClientNoticeList.do?page=${paging.prevpage}">&lt;&lt;</a></li>
			</c:if>
			<c:choose>
				<c:when test="${paging.page <= 1}">
					<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="getClientNoticeList.do?page=${paging.page - 1}">&lt;</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="a" begin="${paging.startpage}"
				end="${paging.endpage}" step="1">
				<c:choose>
					<c:when test="${a == paging.page}">
						<li class="page-item active"><a class="page-link" href="#">${a}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="getClientNoticeList.do?page=${a}">${a}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.page >= paging.maxpage}">
					<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="getClientNoticeList.do?page=${paging.page + 1}">&gt;</a></li>
				</c:otherwise>
			</c:choose>
			<c:if test="${paging.nextpage ne 0}">
				<li class="page-item"><a class="page-link"
					href="getClientNoticeList.do?page=${paging.nextpage}">&gt;&gt;</a></li>
			</c:if>
		</ul>
	</div>
	</div>
	
	<jsp:include page="../division/chat/chatModule_index.jsp"></jsp:include>
		
<script>
(function() {
	var hidechat = $("#togglechat");
	$(hidechat).hide();
}());
</script>

</body>
</html>