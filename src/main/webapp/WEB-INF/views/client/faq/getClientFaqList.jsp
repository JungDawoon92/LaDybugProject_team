<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shepe.admin.faq.impl.FaqDAO"%>
<%@ page import="com.shepe.admin.faq.FaqVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getFaqList</title>
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
.faqList{
	margin:15px;
	text-align:center;
	font-weight:bold;
	font-size:40px;
 }
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/include/Nav.jsp" />
	
	<div class="container">
	
    	<div class="category" style="margin: 10px; text-align: center">
			<div class="faqList float-left">F A Q</div>
	    	<div class="float-right" style="margin:30px;">
	    		<button type="button" id="1" class="btn btn-outline-primary btnall">전체</button>
		   		<button type="button" id="2" class="btn btn-outline-primary">회원/로그인</button>
	      		<button type="button" id="3" class="btn btn-outline-primary">상품</button>
	      		<button type="button" id="4" class="btn btn-outline-primary">주문/결제</button> 
	      		<button type="button" id="5" class="btn btn-outline-primary">배송/조회</button> 
	      		<button type="button" id="6" class="btn btn-outline-primary">취소/환불</button> 
	      		<button type="button" id="7" class="btn btn-outline-primary">교환/반품</button> 
	      	</div>
      	</div>
		<div>
			<table class="table table-light table-striped" id="faq_table">
				<colgroup>
					<col width="25%" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>구분</th>
					<th>제목</th>
				</tr>
				<tbody id= "faq_for">
					<c:forEach items="${faqList}" var="List">			<!-- controller 의 faqList 이름 : "List" -->
						<tr>
							<td><c:out value="${List.faq_category}" /></td>
							<td><a href="#${List.faq_sq}" data-toggle="collapse">${List.faq_nm}</a>
								<div id="${List.faq_sq}" class="collapse">${List.faq_contents}
								</div></td>
							<input type="hidden" name="faq_delelte" value="${faqDetail.faq_sq}" />
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 페이징 -->
	
	<div class="container page" style="text-align: center">
		<ul class="pagination">
			<c:if test="${paging.prevpage != 0}">
				<li class="page-item"><a class="page-link"
					href="getClientFaqList.do?page=${paging.prevpage}">&lt;&lt;</a></li>
			</c:if>
			<c:choose>
				<c:when test="${paging.page <= 1}">
					<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="getClientFaqList.do?page=${paging.page - 1}">&lt;</a></li>
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
							href="getClientFaqList.do?page=${a}">${a}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.page >= paging.maxpage}">
					<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="getClientFaqList.do?page=${paging.page + 1}">&gt;</a></li>
				</c:otherwise>
			</c:choose>
			<c:if test="${paging.nextpage ne 0}">
				<li class="page-item"><a class="page-link"
					href="getClientFaqList.do?page=${paging.nextpage}">&gt;&gt;</a></li>
			</c:if>
		</ul>
	</div>
	<hr/>
	<div class="container">
	<div class="faqList">자주 묻는 질문</div>
	<table class="table table-Light table-striped">
		<colgroup>
			<col width="25%" />
			<col width="*%" />
		</colgroup>
		<thead>
			<tr>
				<th>구분</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody id= "faq_for">
			<c:forEach items="${faqRC}" var="FaqRC">
				<tr>
					<td><c:out value="${FaqRC.faq_category}" /></td>
					<td><a href="#${FaqRC.faq_sq}" data-toggle="collapse">${FaqRC.faq_nm}</a>
							<div id="${FaqRC.faq_sq}" class="collapse">${FaqRC.faq_contents}</div></td>
					<input type="hidden" name="faq_delelteRC" value="${FaqRC.faq_sq}"/>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
<jsp:include page="../division/chat/chatModule_index.jsp"></jsp:include>

<script type="text/javascript">
$('.btn').click( function() {
	if($(this).hasClass("btnall") == true) {
		$('.pagination').show();
	}
	else {
		$('.pagination').hide();
	}
})
</script>

<script type="text/javascript">
var choice1 = "0";

$(".category > .btn").click(function(){
    $(".category > .btn").removeClass("active");
    $(this).addClass("active");
    choice1 = this.id;
    
    $('#faq_for').empty();
    
	   if( $(this).hasClass('active') ){ 
       $.ajax({
               url: "getClientAjaxFaqList.do?choice="+choice1,
               cache: false,
               dataType: "JSON",
               success : function(result) {
                    $.each(result, function(index, value){
                       $('#faq_for').append(
                    		   '<tr><td>' + value.faq_category + '</td>' +
                    		   '<td><a href=\"#'+ value.faq_sq + '\"data-toggle=\"collapse\">' + value.faq_nm + '</a>' +
                    		   '<div id=\"' + value.faq_sq + '\"class="collapse">' + value.faq_contents + '</div></td>'
                     );
                    });
               },
               error: function(request, status, error) {
                  alert("오류");
               }
            });
       }
   });
   
   
(function() {
	var hidechat = $("#togglechat");
	$(hidechat).hide();
}());
</script>
</html>