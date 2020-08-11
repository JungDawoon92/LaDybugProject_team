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
	text-align: center;
	padding: 10px;
}

</style>

<script type="text/javascript">
	function deletes() {
		if (confirm("공지를 삭제하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
	function inserts() {
		if (confirm("회원을 추가하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
</script>	

</head>
<body>
	<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<div class="container">
		<h1 align="center">F A Q</h1>
    	<div class="category" style="margin: 10px; text-align: center">
    		<button type="button" id="1" class="btn btn-dark btnall">전체</button>
	   		<button type="button" id="2" class="btn btn-dark">회원/로그인</button>
      		<button type="button" id="3" class="btn btn-dark">상품</button>
      		<button type="button" id="4" class="btn btn-dark">주문/결제</button> 
      		<button type="button" id="5" class="btn btn-dark">배송/조회</button> 
      		<button type="button" id="6" class="btn btn-dark">취소/환불</button> 
      		<button type="button" id="7" class="btn btn-dark">교환/반품</button> 
      	</div>
			<div>
				<table class="table table-dark table-striped" id="faq_table">
				<colgroup>
					<col width="25%" />
					<col width="*" />
					<col width="15%" />
				</colgroup>
				<tr>
					<th>구분</th>
					<th>제목</th>
					<th>삭제</th>
				</tr>
				<tbody id= "faq_for">
				<c:forEach items="${faqList}" var="List">
					<!-- controller 의 faqList 이름 : "List" -->
					<tr>
						<td><c:out value="${List.faq_category}" /></td>
						<td><a href="#${List.faq_sq}" data-toggle="collapse">${List.faq_nm}</a>
							<div id="${List.faq_sq}" class="collapse">${List.faq_contents}
							</div></td>
						<td><a href="deleteFaq.do?faq_sq=${List.faq_sq}">삭제</a> 
						<input type="hidden" name="faq_delelte" value="${faqDetail.faq_sq}" />
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>

			<button type="button" class="btn btn-outline-secondary"
				style="float: right" onclick="location.href='insertFaqView.do'">
				FaQ작성</button>
	</div>
	<!-- 페이징 -->
	<div class="container page" style="text-align: center">
		<ul class="pagination">
			<c:if test="${paging.prevpage != 0}">
				<li class="page-item"><a class="page-link"
					href="getFaqList.do?page=${paging.prevpage}">&lt;&lt;</a></li>
			</c:if>
			<c:choose>
				<c:when test="${paging.page <= 1}">
					<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="getFaqList.do?page=${paging.page - 1}">&lt;</a></li>
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
							href="getFaqList.do?page=${a}">${a}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.page >= paging.maxpage}">
					<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="getFaqList.do?page=${paging.page + 1}">&gt;</a></li>
				</c:otherwise>
			</c:choose>
			<c:if test="${paging.nextpage ne 0}">
				<li class="page-item"><a class="page-link"
					href="getFaqList.do?page=${paging.nextpage}">&gt;&gt;</a></li>
			</c:if>
		</ul>
	</div>

</body>
<!-- <script type="text/javascript">
	$(document).ready( function() {
	var pDetach; 
	$('div.category > button[id!=1]').click( function() {
		pDetach = $('.pagination').detach();
	});
	
	$('.category > #1').click( function() {
		$('.page').before(pDetach);
	});
	});
</script> -->
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
               url: "getAjaxFaqList.do?choice="+choice1,
               cache: false,
               dataType: "JSON",
               success : function(result) {
                    $.each(result, function(index, value){
                       $('#faq_for').append(
                    		   '<tr><td>' + value.faq_category + '</td>' +
                    		   '<td><a href=\"#'+ value.faq_sq + '\"data-toggle=\"collapse\">' + value.faq_nm + '</a>' +
                    		   '<div id=\"' + value.faq_sq + '\"class="collapse">' + value.faq_contents + '</div></td>' +
                    		   '<td><a href=/admin/deleteFaq.do?faq_sq=' + value.faq_sq + '>삭제</a>'
                     );
                    });
               },
               error: function(request, status, error) {
                  alert("오류");
               }
            });
       }
   });
</script>
</html>