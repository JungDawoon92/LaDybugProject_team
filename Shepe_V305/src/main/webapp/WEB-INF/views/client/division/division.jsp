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
  <link rel="stylesheet" href="/shepe/resources/chatcss/styles.css" />
  <style>
  @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
    
    .pagination {
   		justify-content: center;
	}
	h4,p,li,font{
		font-family: 'Nanum Pen Script';
	}
	.btn_color {
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
      	<button type="button" id="1" class="btn btn-outline-primary btn-sm">밥/죽/떡</button>
      	<button type="button" id="2" class="btn btn-outline-primary btn-sm">면/만두</button>
      	<button type="button" id="3" class="btn btn-outline-primary btn-sm">국/탕</button> 
      	<button type="button" id="4" class="btn btn-outline-primary btn-sm">찌개</button> 
      	<button type="button" id="5" class="btn btn-outline-primary btn-sm">메인반찬</button> 
      	<button type="button" id="6" class="btn btn-outline-primary btn-sm">김치/젓갈/장류</button> 
      	<button type="button" id="7" class="btn btn-outline-primary btn-sm">양념/소스/잼</button> 
      	<button type="button" id="8" class="btn btn-outline-primary btn-sm">차/음료/술</button> 
      	<button type="button" id="9" class="btn btn-outline-primary btn-sm">디저트</button> 
      	<button type="button" id="10" class="btn btn-outline-primary btn-sm">퓨전</button> 
      	<button type="button" id="11" class="btn btn-outline-primary btn-sm">샐러드</button> 
      	<button type="button" id="12" class="btn btn-outline-primary btn-sm">밑반찬</button> 
      	<button type="button" id="13" class="btn btn-outline-primary btn-sm">기타</button>
      </div>
      </td>
    </tr>
    <tr>
      <th>재료</th>
      <td>
      <div class="button2">
      	<button type="button" id="14" class="btn btn-outline-primary btn-sm">육류</button>  
      	<button type="button" id="15" class="btn btn-outline-primary btn-sm">해물류</button>  
      	<button type="button" id="16" class="btn btn-outline-primary btn-sm">건어물류</button> 
      	<button type="button" id="17" class="btn btn-outline-primary btn-sm">곡류</button> 
      	<button type="button" id="18" class="btn btn-outline-primary btn-sm">콩/견과류</button> 
      	<button type="button" id="19" class="btn btn-outline-primary btn-sm">채소류</button> 
      	<button type="button" id="20" class="btn btn-outline-primary btn-sm">버섯류</button> 
      	<button type="button" id="21" class="btn btn-outline-primary btn-sm">밀가루</button> 
      	<button type="button" id="22" class="btn btn-outline-primary btn-sm">가공식품류</button> 
      	<button type="button" id="23" class="btn btn-outline-primary btn-sm">과일류</button> 
      	<button type="button" id="24" class="btn btn-outline-primary btn-sm">쌀</button> 
      	<button type="button" id="25" class="btn btn-outline-primary btn-sm">달걀/유제품</button> 
      	<button type="button" id="26" class="btn btn-outline-primary btn-sm">돼지고기</button> 
      	<button type="button" id="27" class="btn btn-outline-primary btn-sm">소고기</button> 
      	<button type="button" id="28" class="btn btn-outline-primary btn-sm">닭고기</button> 
      	<button type="button" id="29" class="btn btn-outline-primary btn-sm">기타</button>
      </div>
      </td>
    </tr>
    <tr>
      <th>방법</th>
      <td>
      <div class="button3"> 
      	<button type="button" id="30" class="btn btn-outline-primary btn-sm">끓이기</button>  
      	<button type="button" id="31" class="btn btn-outline-primary btn-sm">절임</button>  
      	<button type="button" id="32" class="btn btn-outline-primary btn-sm">조림</button> 
      	<button type="button" id="33" class="btn btn-outline-primary btn-sm">회</button> 
      	<button type="button" id="34" class="btn btn-outline-primary btn-sm">삶기</button> 
      	<button type="button" id="35" class="btn btn-outline-primary btn-sm">데치기</button> 
      	<button type="button" id="36" class="btn btn-outline-primary btn-sm">무침</button> 
      	<button type="button" id="37" class="btn btn-outline-primary btn-sm">비빔</button> 
      	<button type="button" id="38" class="btn btn-outline-primary btn-sm">볶음</button> 
      	<button type="button" id="39" class="btn btn-outline-primary btn-sm">굽기</button> 
      	<button type="button" id="40" class="btn btn-outline-primary btn-sm">부침</button> 
      	<button type="button" id="41" class="btn btn-outline-primary btn-sm">찜</button> 
      	<button type="button" id="42" class="btn btn-outline-primary btn-sm">튀김</button> 
      	<button type="button" id="43" class="btn btn-outline-primary btn-sm">기타</button>
      </div>
      </td>
    </tr>
</table>
<hr>
</div>

	<div id="list">

	<div class="container">
		<div class="row">
			<c:forEach items="${divisionList}" var="division">
			  <div class="card col-lg-3 col-md-3 col-12" style="width:13rem; margin:20px 0 24px 0">
			  	<img class="card-img-top img-thumbnail" src="/shepe/resources/img/${division.recipe_complete_img}" alt="image" style="width: 255px;height: 350px;">
			  	<div class="card-body">
			    	<h4 class="card-title">${division.recipe_nm}</h4>
			    	<p class="card-text float-right"><i class="far fa-heart"></i><i class="far fa-eye"></i>${division.recipe_cnt}</p>
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

		</div>

<script>
(function() {
	var hidechat = $("#togglechat");
	$(hidechat).hide();
}());
</script>
     
     
     
<script>
	var choice1 ="0";
	var choice2 ="0";
	var choice3 ="0";
	var sum = "";
	
  $(".button1 > .btn").click(function(){
    $(".button1 > .btn").removeClass("active");
    $(this).addClass("active");
    choice1 = this.id;
    sum = choice1+","+choice2+","+choice3;
  
    if( $(this).hasClass('active') ){ 
	    $.ajax({
		  	    url: "getDivision_re?sum="+sum,
		  	  	cache: false
		   }).done(function (fragment) {
		         $("#list").replaceWith(fragment);
		    });
	    }
    
	});
  
  $(".button2 > .btn").click(function(){
	    $(".button2 > .btn").removeClass("active");
	    $(this).addClass("active");
	    choice2 = this.id;
	    sum = choice1+","+choice2+","+choice3;

	    if( $(this).hasClass('active') ){ 
		    $.ajax({
			  	    url: "getDivision_re?sum="+sum,
			  	  	cache: false
			   }).done(function (fragment) {
			         $("#list").replaceWith(fragment);
			    });
		    }
		});
  $(".button3 > .btn").click(function(){
	    $(".button3 > .btn").removeClass("active");
	    $(this).addClass("active");
	    choice3 = this.id;
	    sum = choice1+","+choice2+","+choice3;

	    if( $(this).hasClass('active') ){ 
		    $.ajax({
			  	    url: "getDivision_re?sum="+sum,
			  	  	cache: false
			   }).done(function (fragment) {
			         $("#list").replaceWith(fragment);
			    });
		    }
	   
		});
  

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

</body>
</html>

