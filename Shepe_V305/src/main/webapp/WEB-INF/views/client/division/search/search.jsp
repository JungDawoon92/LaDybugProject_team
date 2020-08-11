<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  <link rel="stylesheet" href="/shepe/resources/chatcss/search.css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="search-result-box card-box">
                    <!-- end row -->
                    <ul class="nav nav-tabs tabs-bordered">
                        <li class="nav-item"><a href="#home" data-toggle="tab" aria-expanded="true" class="nav-link active">레시피 <span class="badge badge-success ml-1">${re_listcount}</span></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <div class="row">
									<div class="col-md-12">
										
										<c:forEach items="${search_reList}" var="reList">
											<div class="search-item">
											<div class="media">
												<img class="d-flex mr-3 img-thumbnail"
													src="/shepe/resources/img/${reList.recipe_complete_img}" height="54"
													style="width: 250px; height: 210px;">
												<div class="media-body">
													<h5 class="media-heading mt-0">
														<a href="#" class="text-dark">${reList.recipe_nm}</a>
													</h5>
													<p class="font-13">
														<b>category:</b> <span><a href="#" class="text-muted">${reList.recipe_category_kind}</a></span>
													</p>
													<p class="mb-0 font-13">
														<b>info:</b> <br>
														<span class="text-muted">${reList.recipe_info}</span>
													</p>
												</div>
											</div>
										</div>
										</c:forEach>
										
										
										
										<ul class="pagination justify-content-end pagination-split mt-0">
										<c:choose>
											<c:when test="${re_paging.page <= 1}">
												<li class="page-item"><button type="button"
													class="btn btn-outline-primary btn-sm" disabled><i class='fas fa-angle-left' style='font-size:15px'></i></button></li>
													&nbsp;
											</c:when>
											<c:otherwise>
												 <li class="page-item">
												 <a href="searchAction?page=${re_paging.page - 1}&searchValue=${searchValue}&pagevalue=1" class="btn btn-outline-primary btn-sm" role="button"><i class='fas fa-angle-left' style='font-size:15px'></i></a></li>
													&nbsp;
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${re_paging.page >= re_paging.maxpage}">
												<li class="page-item"><button type="button"
													class="btn btn-outline-primary btn-sm" disabled><i class='fas fa-angle-right' style='font-size:15px'></i></button></li>
											</c:when>
											<c:otherwise>
												 <li class="page-item">
												 	<a href="searchAction?page=${re_paging.page + 1}&searchValue=${searchValue}&pagevalue=1" class="btn btn-outline-primary btn-sm" role="button"><i class='fas fa-angle-right' style='font-size:15px'></i></a>
												 </li>
											</c:otherwise>
										</c:choose>
										</ul>

									<ul class="nav nav-tabs tabs-bordered">
										<li class="nav-item"><a href="#home" data-toggle="tab"
											aria-expanded="true" class="nav-link active">식재료
												<span class="badge badge-success ml-1">${in_listcount}</span>
										</a></li>
									</ul>
									
									<c:forEach items="${search_inList}" var="inList">
									<div class="search-item">
                                        <h4 class="mb-1"><a href="#">${inList.ingredient_nm}</a></h4>
                                        <div class="font-13 text-success mb-3">http://localhost:8090/shepe/ingredient_no=${inList.ingredient_no}</div>
                                        <p class="mb-0 text-muted">인그리sum=${inList.ingredient_sell_sum} 등등 기타등등 여기에 추가한다.</p>
                                    </div>
									</c:forEach>
									
										<ul class="pagination justify-content-end pagination-split mt-0">
											<c:choose>
												<c:when test="${in_paging.page <= 1}">
													<li class="page-item"><button type="button"
															class="btn btn-outline-primary btn-sm" disabled>
															<i class='fas fa-angle-left' style='font-size: 15px'></i>
														</button></li>
													&nbsp;
											    </c:when>
											<c:otherwise>
													<li class="page-item">
													 	<a href="searchAction?page=${in_paging.page - 1}&searchValue=${searchValue}&pagevalue=2" class="btn btn-outline-primary btn-sm" role="button"><i class='fas fa-angle-left' style='font-size:15px'></i></a>
													</li>
													&nbsp;
											</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${in_paging.page >= in_paging.maxpage}">
													<li class="page-item"><button type="button"
															class="btn btn-outline-primary btn-sm" disabled>
															<i class='fas fa-angle-right' style='font-size: 15px'></i>
														</button></li>
												</c:when>
												<c:otherwise>
													<li class="page-item">
														<a href="searchAction?page=${in_paging.page + 1}&searchValue=${searchValue}&pagevalue=2" class="btn btn-outline-primary btn-sm" role="button"><i class='fas fa-angle-right' style='font-size:15px'></i></a>
													</li>
												</c:otherwise>
											</c:choose>
										</ul>
										<div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end All results tab -->
                    </div>
                </div>
            </div>
        </div>
        <!-- end row -->
    </div>
    <!-- container -->
</div>
<script>
	$(window).scroll(function() {
		  sessionStorage.scrollTop = $(this).scrollTop();
		});
	
		$(document).ready(function() {
		  if (sessionStorage.scrollTop != "undefined") {
		    $(window).scrollTop(sessionStorage.scrollTop);
		  }
		  
		  if($(window).width() < 768) { 
				$(".media").attr('class','card');
				$(".media-body").attr('class','card-body');
				}
		  if($(window).width() > 768) { 
				$(".card").attr('class','media');
				$(".card-body").attr('class','media-body');
				} 
		  
		});
		
		$(window).resize(function() { 
			
			if($(window).width() < 768) { 
				$(".media").attr('class','card');
				$(".media-body").attr('class','card-body');
				}
			if($(window).width() > 768) { 
				$(".card").attr('class','media');
				$(".card-body").attr('class','media-body');
				} 
			
		});

</script>

</body>
</html>