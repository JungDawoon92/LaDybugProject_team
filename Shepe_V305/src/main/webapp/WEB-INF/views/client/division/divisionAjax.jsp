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
</head>
<body>
	<div id="list">
	 <div class="container">
	 	<div class="row">
			 <c:forEach items="${divisionList}" var="division">
				  <div class="card col-lg-3 col-md-3 col-6" style="width:13rem;margin:20px 0 24px 0">
				  	<img class="card-img-top img-thumbnail" src="/shepe/resources/img/${division.recipe_complete_img}" alt="image" style="width: 255px;height: 350px;">
				  	<div class="card-body">
				    	<h4 class="card-title">${division.recipe_nm}</h4>
				    	<p class="card-text"><p class="card-text float-right"><i class="far fa-heart"></i><i class="far fa-eye"></i>${division.recipe_cnt}</p>
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
	 
	 	
	 <script>
			$(".page-item > .page-link").click(function(){
	 		var click =$(this).data("page");
	 		
		    $.ajax({
			  	    url: "getDivision_re?page="+click+"&sum="+sum,
			  	  	cache: false
			   }).done(function (fragment) {
			         $("#list").replaceWith(fragment);
			    });
			});
	</script>


	</div>

</body>
</html>