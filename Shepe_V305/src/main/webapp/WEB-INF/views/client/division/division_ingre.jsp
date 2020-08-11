<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <title>Lady bug</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/shepe/resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style>
	@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	
    .pagination {
   		justify-content: center;
	}
	h4,p,li,font {
		font-family: 'Nanum Pen Script';
	}
	
  </style>
</head>
<body>

<jsp:include page="/WEB-INF/include/Nav.jsp" />

<div class="container">
<div class="container">
  <table class="table">
    <tr>
      <th style="width: 74px;">종류</th>
      <td>
      <div class="button1">
      	<button type="button" id="0" class="btn btn-outline-primary btn-sm">전체</button>
      	<button type="button" id="1" class="btn btn-outline-primary btn-sm">육류</button>
      	<button type="button" id="2" class="btn btn-outline-primary btn-sm">소고기</button>
      	<button type="button" id="3" class="btn btn-outline-primary btn-sm">닭고기</button> 
      	<button type="button" id="4" class="btn btn-outline-primary btn-sm">해산물</button> 
      	<button type="button" id="5" class="btn btn-outline-primary btn-sm">야채</button> 
      	<button type="button" id="6" class="btn btn-outline-primary btn-sm">과일</button> 
      	<button type="button" id="7" class="btn btn-outline-primary btn-sm">견과류</button> 
      	<button type="button" id="8" class="btn btn-outline-primary btn-sm">기타</button>
      </div>
      </td>
    </tr>
</table>
<hr>
</div>

<div id="list">

	<div class="container">
		<div class="row">
			<c:forEach items="${divisionInList}" var="division">
			  <div class="card col-lg-3 col-md-3 col-12" style="width:13rem; margin:20px 0 24px 0">
			  	<img class="card-img-top img-thumbnail" src="/shepe/resources/img/${division.ingredient_thumbName}" alt="image" style="width: 255px;height: 350px;">
			  	<div class="card-body">
			    	<h4 class="card-title">${division.ingredient_nm} <font size=3 class="float-right text-muted"><i class="fas fa-chart-line"></i>&nbsp; ${division.ingredient_sell_sum} 명이나 구매했어요!</font></h4>
			    	<p class="card-text float-right"><i class="fas fa-coins"></i><font size=5> ${division.ingredient_price}원</font></p>
			  	</div>
			  </div>
			 </c:forEach>
		</div>
    </div>
      <hr> 
      
      <!-- 페이징 -->
      
      <div class="container">	
			<ul class="pagination">
			<c:if test="${paging.prevpage != 0}">
				<li class="page-item"><button class="page-link" data-page="${paging.prevpage}">&lt;&lt;</button></li> 
			</c:if>
			<c:choose>
				<c:when test="${paging.page <= 1}">
					<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
				</c:when>
				<c:otherwise>
					 <li class="page-item"><button class="page-link" data-page="${paging.page - 1}">&lt;</button></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="a" begin="${paging.startpage}" end="${paging.endpage}" step="1">
				<c:choose>
				<c:when test="${a == paging.page}">
					<li class="page-item active"><a class="page-link" href="#">${a}</a></li>
				</c:when>
				<c:otherwise>
					  <li class="page-item"><button class="page-link" data-page="${a}">${a}</button></li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.page >= paging.maxpage}">
					<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
				</c:when>
				<c:otherwise>
					 <li class="page-item"><button class="page-link" data-page="${paging.page + 1}">&gt;</button></li>
				</c:otherwise>
			</c:choose>
			<c:if test="${paging.nextpage ne 0}">
				<li class="page-item"><button class="page-link" data-page="${paging.nextpage}">&gt;&gt;</button></li>
			</c:if>
			</ul>
		</div>
		</div>
		<jsp:include page="chat/chatModule_index.jsp"></jsp:include>
		
<script>
(function() {
	var hidechat = $("#togglechat");
	$(hidechat).hide();
}());
</script>

		</div>

     
 <script>
 var choice1 = "null";
 
$(".button1 > .btn").click(function(){
    $(".button1 > .btn").removeClass("active");
    $(this).addClass("active");
    choice1 = this.id;
  
    if( $(this).hasClass('active') ){ 
	    $.ajax({
		  	    url: "getDivision_ingre?choice="+choice1,
		  	  	cache: false
		   }).done(function (fragment) {
		         $("#list").replaceWith(fragment);
		    });
	    }
	});
	
	
$(".page-item > .page-link").click(function(){
 	var click =$(this).data("page");
		console.log(click);
    $.ajax({
	  	    url: "getDivision_ingre?page="+click+"&choice="+choice1,
	  	  	cache: false
	   }).done(function (fragment) {
	         $("#list").replaceWith(fragment);
	    });
	});
	
</script>

</body>
</html>