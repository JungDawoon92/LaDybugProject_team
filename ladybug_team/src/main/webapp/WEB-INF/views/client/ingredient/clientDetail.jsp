<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel = "stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/magnifier.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="<c:url value ="/resources/js/magnifier.js" />"></script>
<script src="<c:url value ="/resources/js/fnImgPop.js" />"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#plus').on('click', function(){
		$.ajax({
			url: "ing_amtCheck.do",
			type: "post",
			dataType: "json",
			data : {"ingredient_no": $('#ingredient_no').val(),
					"ingredient_amt" : $('#ingredient_cnt').val()},				
			success : function(data) {
				var row = "";
				row += "재료 잔고가"+(data.ingredient_amt - $('#ingredient_cnt').val())+"있습니다.";
				$("#amtCheck").text(row);	
				$('#amtCheck').css("color","navy");
			},
			error: function(request, status, error) {
				alert("status : " + status);
			}
		});
		
	});
	$('#minus').on('click', function(){
		$.ajax({
			url: "ing_amtCheck.do",
			type: "post",
			dataType: "json",
			data : {"ingredient_no": $('#ingredient_no').val(),
					"ingredient_amt" : $('#ingredient_cnt').val()},				
			success : function(data) {
				var row = "";
				row += "재료 잔고가"+(data.ingredient_amt - $('#ingredient_cnt').val())+"있습니다.";
				//row += "구매하실 수 있습니다.";
				$("#amtCheck").text(row);	
				$('#amtCheck').css("color","navy");
			},
			error: function(request, status, error) {
				alert("status : " + status);
			}
		});
		
	});
});
var count = 0;
function plus() {
	if(count <= 0) {
		count = 1;
		$('#ingredient_cnt').val(count);
	} else if ($('#ingredient_amt2').val() == count) {
		alert('죄송합니다. 더 이상 재고가 없습니다');
		return $('#ingredient_cnt').val();
	}
		++count; 
		$('#ingredient_cnt').val(count);
		var aaa = $('#ingredient_price').val();
		//var aaa= ${ingredient.ingredient_price};
	    var bbb = parseInt(aaa) * count;
		$('h3 #ing_price').text(bbb);
}
function minus() {
	--count;
	$('#ingredient_cnt').val(count);
	if(count <= 0) {
		alert('0이하는 구매 하실수 없습니다.');
		return $('#ingredient_cnt').val("1");
	} else if ($('#ingredient_amt2').val() != $('#ingredient_cnt').val()) {
		$("#plus").removeAttr("disabled", false);
		$("#minus").removeAttr("disabled", false);
	}
	var aaa = $('#ingredient_price').val();
    var bbb = parseInt(aaa) * count;
	$('h3 #ing_price').text(bbb);	
}

function orderForm() {
	let checkArr = new Array();
	var no = $('#ingredient_no').val();
	var cnt = $('#ingredient_cnt').val();
	checkArr.push({"ingre_no":no, "ingre_cnt":cnt});
	let json = JSON.stringfy(checkArr);
	$('input[name=orderCart]').val(json);
}
</script>
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!-- Title -->
<title>Delicious - Food Blog Template | Receipe Post</title>
<!-- Favicon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/core-img/favicon.ico">
<!-- Core Stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style.css">
<style type="text/css">
h3 div{display:inline;}
</style>
</head>
<body>
	<!-- Preloader -->
	<div id="preloader">
		<i class="circle-preloader"></i> <img
			src="${pageContext.request.contextPath}/resources/img/core-img/salad.png"
			alt="">
	</div>
	<!-- Search Wrapper -->
	<div class="search-wrapper">
		<!-- Close Btn -->
		<div class="close-btn">
			<i class="fa fa-times" aria-hidden="true"></i>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<form action="#" method="post">
						<input type="search" name="search"
							placeholder="Type any keywords...">
						<button type="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Header Area Start ##### -->
	<header class="header-area">
		<!-- Top Header Area -->
		<div class="top-header-area">
			<div class="container h-100">
				<div class="row h-100 align-items-center justify-content-between">
					<!-- Breaking News -->
					<div class="col-12 col-sm-6">
						<div class="breaking-news">
							<div id="breakingNewsTicker" class="ticker">
								<ul>
									<li><a href="#">Hello World!</a></li>
									<li><a href="#">Welcome to Colorlib Family.</a></li>
									<li><a href="#">Hello Delicious!</a></li>
								</ul>
							</div>
						</div>
					</div>

					<!-- Top Social Info -->
					<div class="col-12 col-sm-6">
						<div class="top-social-info text-right">
							<a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
							<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
							<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
							<a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
							<a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a>
							<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Navbar Area -->
		<div class="delicious-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between"
						id="deliciousNav">
						<!-- Logo -->
						<a class="nav-brand" href="index.html"><img
							src="${pageContext.request.contextPath}/resources/img/core-img/logo.png"
							alt=""></a>
						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>
						<!-- Menu -->
						<div class="classy-menu">
							<!-- close btn -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>
							<!-- Nav Start -->
							<div class="classynav">
								<ul>
									<li class="active"><a href="index.html">Home</a></li>
									<li><a href="#">Pages</a>
										<ul class="dropdown">
											<li><a href="index.html">Home</a></li>
											<li><a href="about.html">About Us</a></li>
											<li><a href="blog-post.html">Blog Post</a></li>
											<li><a href="receipe-post.html">Receipe Post</a></li>
											<li><a href="contact.html">Contact</a></li>
											<li><a href="elements.html">Elements</a></li>
											<li><a href="#">Dropdown</a>
												<ul class="dropdown">
													<li><a href="index.html">Home</a></li>
													<li><a href="about.html">About Us</a></li>
													<li><a href="blog-post.html">Blog Post</a></li>
													<li><a href="receipe-post.html">Receipe Post</a></li>
													<li><a href="contact.html">Contact</a></li>
													<li><a href="elements.html">Elements</a></li>
													<li><a href="#">Dropdown</a>
														<ul class="dropdown">
															<li><a href="index.html">Home</a></li>
															<li><a href="about.html">About Us</a></li>
															<li><a href="blog-post.html">Blog Post</a></li>
															<li><a href="receipe-post.html">Receipe Post</a></li>
															<li><a href="contact.html">Contact</a></li>
															<li><a href="elements.html">Elements</a></li>
														</ul></li>
												</ul></li>
										</ul></li>
									<li><a href="#">Mega Menu</a>
										<div class="megamenu">
											<ul class="single-mega cn-col-4">
												<li class="title">Catagory</li>
												<li><a href="index.html">Home</a></li>
												<li><a href="about.html">About Us</a></li>
												<li><a href="blog-post.html">Blog Post</a></li>
												<li><a href="receipe-post.html">Receipe Post</a></li>
												<li><a href="contact.html">Contact</a></li>
												<li><a href="elements.html">Elements</a></li>
											</ul>
											<ul class="single-mega cn-col-4">
												<li class="title">Catagory</li>
												<li><a href="index.html">Home</a></li>
												<li><a href="about.html">About Us</a></li>
												<li><a href="blog-post.html">Blog Post</a></li>
												<li><a href="receipe-post.html">Receipe Post</a></li>
												<li><a href="contact.html">Contact</a></li>
												<li><a href="elements.html">Elements</a></li>
											</ul>
											<ul class="single-mega cn-col-4">
												<li class="title">Catagory</li>
												<li><a href="index.html">Home</a></li>
												<li><a href="about.html">About Us</a></li>
												<li><a href="blog-post.html">Blog Post</a></li>
												<li><a href="receipe-post.html">Receipe Post</a></li>
												<li><a href="contact.html">Contact</a></li>
												<li><a href="elements.html">Elements</a></li>
											</ul>
											<div class="single-mega cn-col-4">
												<div class="receipe-slider owl-carousel">
													<a href="#"><img
														src="${pageContext.request.contextPath}/resources/img/bg-img/bg1.jpg"
														alt=""></a> <a href="#"><img
														src="${pageContext.request.contextPath}/resources/img/bg-img/bg6.jpg"
														alt=""></a>
												</div>
											</div>
										</div></li>
									<li><a href="receipe-post.html">Receipies</a></li>
									<li><a href="receipe-post.html">4 Vegans</a></li>
									<li><a href="contact.html">Contact</a></li>
								</ul>

								<!-- Newsletter Form -->
								<div class="search-btn">
									<i class="fa fa-search" aria-hidden="true"></i>
								</div>

							</div>
							<!-- Nav End -->
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ##### Header Area End ##### -->
	<!-- ##### Breadcumb Area Start ##### -->
	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(resources/img/bg-img/breadcumb3.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="breadcumb-text text-center">
						<h2>식재료 디테일 페이지입니다.</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Breadcumb Area End ##### -->

	<div class="receipe-post-area section-padding-80">
		<!-- Receipe Post Search -->
		<div class="receipe-post-search mb-80">
			<div class="container">
				<form action="#" method="post">
					<div class="row">
						<div class="col-12 col-lg-3">
							<select name="select1" id="select1">
								<option value="1">All Receipies Categories</option>
								<option value="1">All Receipies Categories 2</option>
								<option value="1">All Receipies Categories 3</option>
								<option value="1">All Receipies Categories 4</option>
								<option value="1">All Receipies Categories 5</option>
							</select>
						</div>
						<div class="col-12 col-lg-3">
							<select name="select1" id="select2">
								<option value="1">All Receipies Categories</option>
								<option value="1">All Receipies Categories 2</option>
								<option value="1">All Receipies Categories 3</option>
								<option value="1">All Receipies Categories 4</option>
								<option value="1">All Receipies Categories 5</option>
							</select>
						</div>
						<div class="col-12 col-lg-3">
							<input type="search" name="search" placeholder="Search Receipies">
						</div>
						<div class="col-12 col-lg-3 text-right">
							<button type="submit" class="btn delicious-btn">Search</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- Receipe Slider -->
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div id="wrap">			
						<img class="target"
							src="${pageContext.request.contextPath}/resources/img/ingredient-img/${ingredient.ingredient_thumbName}"
							alt="${ingredient.ingredient_nm}" title="${ingredient.ingredient_nm}" data-zoom="2" /> 	
					</div>
				</div>
			</div>
		</div>

		<!-- Receipe Content Area -->
		<div class="receipe-content-area">
			<div class="container">
				<!-- Content -->
							<div class="blog-content">
								<div >
									<img id="imgController" name="imgController" onclick="fnImgPop(this.src)" src="${pageContext.request.contextPath}/resources/img/ingredient-img/${ingredient.ingredient_thumbName}"
											alt="${ingredient.ingredient_nm}" title="${ingredient.ingredient_nm}"
											style="height: 100px; width: 100px; margin-top: 5px;" data-zoom="2" />
								</div>
							</div>
				<div class="row">
					<div class="col-12 col-md-8"> 
						<div class="receipe-headline my-5">
							<span>0<script>document.write(new Date().getMonth()+1);</script>,
								2020
							</span>
							<span style="float:right">
							 	<a href="meatPage.do" class="btn btn-outline-info btn-sm">
        							<i class="fa fa-hashtag" aria-hidden="true">육류</i></a>	
         						<a href="#" class="btn btn-outline-info btn-sm">
        							<i class="fa fa-hashtag" aria-hidden="true">소고기</i></a>	
						        <a href="#" class="btn btn-outline-info btn-sm">
						        	<i class="fa fa-hashtag" aria-hidden="true">닭고기</i></a>	
						        <a href="#" class="btn btn-outline-info btn-sm">
						        	<i class="fa fa-hashtag" aria-hidden="true">해산물</i></a>	
						        <a href="#" class="btn btn-outline-info btn-sm">
						        	<i class="fa fa-hashtag" aria-hidden="true">야채</i></a>	
						        <a href="#" class="btn btn-outline-info btn-sm">
						        	<i class="fa fa-hashtag" aria-hidden="true">과일</i></a>	
						        <a href="#" class="btn btn-outline-info btn-sm">
						        	<i class="fa fa-hashtag" aria-hidden="true">견과류</i></a>
						        <a href="#" class="btn btn-outline-info btn-sm">
						        	<i class="fa fa-hashtag" aria-hidden="true">기타</i></a>		
							</span>
							<h4>${ingredient.ingredient_nm}</h4>
							<hr>
							<div class="receipe-duration">
							<form>
										
								<div>판매가 : <h5 style="display:inline;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${ingredient.ingredient_price}" />원</h5></div>
								<input type ="hidden" id="ingredient_price" name="ingredient_price" class="ingredient_price" 
										value="${ingredient.ingredient_price}"원 readonly="readonly" style="border:1px">
								<b>카테고리 : ${ingredient.ingredient_categ}류</b>
								<input type="hidden" id="ingredient_no" name="ingredient_no" value="${ingredient.ingredient_no}">
								<input type="hidden" id="ingredient_amt2" name="ingredient_amt2" value="${ingredient.ingredient_amt}">
								<input type="hidden" id="ingredient_nm" name="ingredient_nm" value="${ingredient.ingredient_nm}">
								<input type="hidden" id="ingredient_thumbimg" name="ingredient_thumbimg" value="${ingredient.ingredient_thumbName}">
								<hr>
								<b>중량 : ${ingredientDetail.ingredient_weight}</b><br>
								<b>유통기한 : ${ingredientDetail.ingredient_selLife} </b>
								<hr>
								<b>수량:<div id="check" style="display:inline;"></div></b>
								<span class="qty" style="display:inline;">
									<input type="hidden" id="sale_price" name="sale_price" value="13600"/>	
									<input type="hidden" id="chk_sale_price" name="chk_sale_price" value="13600"/>	
									<input type="text" name="ingredient_cnt" id="ingredient_cnt" value="1" title="제품수량입력" maxlength="3"  />								
									<a class='btn btn-success' type="button" id="minus" title="상품수량감소" ><i class="fa fa-minus" style="color:lightblue;text-shadow:2px 2px 4px #000000;" aria-hidden="true" onclick="minus()"></i></a>							
									<a class='btn btn-success' type="button" id="plus" title="상품수량증가" ><i class="fa fa-plus" style="color:lightblue;text-shadow:2px 2px 4px #000000;" aria-hidden="true" onclick="plus()"></i></a>								
									<h3 style="display:inline; float: right;">총 제품금액:<div id="ing_price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${ingredient.ingredient_price}" />원</div></h3><br>
									<br>
									<div id="amtCheck"></div>
								</span>
							</form>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="receipe-ratings text-right my-5">
							<div class="ratings">
								<i class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star-o" aria-hidden="true"></i>
							</div>
						 <form>
							<span>
								<button class="btn delicious-btn mt-30" id="insertCart" type="submit" formaction="insertCart">장바구니</button>
								
									<button class="btn delicious-btn mt-30" id="orderCart" type="submit" onclick="orderForm()" formaction="orderForm.do">구매하기
										<input type="hidden" name="orderCart" >
									</button>
							</span>
						 </form>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<div class="accordions mb-80" id="accordion" role="tablist"
							aria-multiselectable="true">
							<!-- Single Accordian Area -->
							<div class="panel single-accordion">
								<h6>
									<a role="button" class="" aria-expanded="true"
										aria-controls="collapseOne" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne">상품정보 더보기<span
										class="accor-open"><i class="fa fa-plus"
											aria-hidden="true"></i></span> <span class="accor-close"><i
											class="fa fa-minus" aria-hidden="true"></i></span>
									</a>
								</h6>
								<div id="collapseOne" class="accordion-content collapse show">
									<div>
										<div>
											<div>
												<img
													src="${pageContext.request.contextPath}/resources/img/ingredient-img/${ingredient.ingredient_thumbName}"
													alt="${ingredient.ingredient_nm }" title="${ingredient.ingredient_nm }" style="width: 100%; height: auto;">
											</div>
											<dl>
												<dt>${ingredient.ingredient_no}</dt>
												<dt>${ingredient.ingredient_nm}</dt>
											</dl>
											<hr>
											<dl>
												<dt></dt>
												<dt></dt>
											</dl>
											<hr>
											<dl>
												<dt>
													<img
														src="${pageContext.request.contextPath}/resources/img/ingredient-img/${ingredient.ingredient_thumbName}"
														alt="${ingredient.ingredient_nm }" title="${ingredient.ingredient_nm }" style="width: 100%; height: auto;">
												</dt>
												
												<c:forEach items="${ingredientMulti}" var="multi">
													<dt>
														<img
															src="${pageContext.request.contextPath}/resources/img/upload/${multi.ingredient_fileName}"
															alt="${ingredient.ingredient_nm}" title="${ingredient.ingredient_nm}"
															style="width: 100%; height: auto;">
													</dt>
												</c:forEach>
											</dl>
										</div>
									</div>
								</div>
							</div>

							<!-- Single Accordian Area -->
							<div class="panel single-accordion">
								<h6>
									<a role="button" class="collapsed" aria-expanded="true"
										aria-controls="collapseTwo" data-parent="#accordion"
										data-toggle="collapse" href="#collapseTwo">상세정보 더보기<span
										class="accor-open"><i class="fa fa-plus"
											aria-hidden="true"></i></span> <span class="accor-close"><i
											class="fa fa-minus" aria-hidden="true"></i></span>
									</a>
								</h6>
								<div id="collapseTwo" class="accordion-content collapse">
									<div>
										<dl>
											<dt>식재료 번호</dt>
											<dd>${ingredientDetail.ingredient_codeNum}</dd>
										</dl>
										<dl>
											<dt>식재료 원산지</dt>
											<dd>${ingredientDetail.ingredient_country}</dd>
										</dl>
										<dl>
											<dt>식재료 생산지/수입지</dt>
											<dd>${ingredientDetail.ingredient_productimporter}</dd>
										</dl>
										<dl>
											<dt>식재료 중량</dt>
											<dd>${ingredientDetail.ingredient_weight}</dd>
										</dl>
										<dl>
											<dt>식재료 제조월일</dt>
											<dd>${ingredientDetail.ingredient_mnfctDate}</dd>
										</dl>
										<dl>
											<dt>식재료 상세 유통기한</dt>
											<dd>${ingredientDetail.ingredient_selLife}</dd>
										</dl>

										<dl>
											<dt>식재료 상세 가공유형</dt>
											<dd>${ingredientDetail.ingredient_selFoodType}</dd>
										</dl>

										<dl>
											<dt>식재료 상세 저장방법</dt>
											<dd>${ingredientDetail.ingredient_selStorage}</dd>
										</dl>
										<dl>
											<dt>식재료 포장재질</dt>
											<dd>${ingredientDetail.ingredient_pckmtr}</dd>
										</dl>
										<dl>
											<dt>식재료 영양소</dt>
											<dd>${ingredientDetail.ingredient_nutrient}</dd>
										</dl>
										<dl>
											<dt>식재료 알레르기</dt>
											<dd>${ingredientDetail.ingredient_allergy}</dd>
										</dl>
									</div>
								</div>
							</div>
								
						</div>
						<a href="#" class="post-title"><h2>건강한 식재료를 더 많이 만나보세요!!</h2></a>
								<div class="meta-data">
									by <a href="#">LadyBug</a> in <a href="#">Company</a>
								</div>
								<p>레이디버그는 여러분들의 밥상을 책임질 준비가 되어 있습니다. <br>4~5년 전부터 혼밥, 혼술의 시대가 도래해왔습니다. 그리고 2020년!! 코로나 19사태로 식재료 업체들과 식당 업주들은 크나 큰 고통을 맞이하면서 경제적 타격을 맞았습니다. 
								       <br>이를 경제적으로 완화시킬 수 있는 방법은 여러 식당 사업자와 업체들을 우리 레이디버그 고객님과 연결해드려 보다 질 좋은 식재료 서비스, 
								       그에 맞는 레시피로 즐거운 밥상이 될 수 있기를 약속합니다!!<br><br>
								       Ladyberg is ready to take charge of your meal. 
								       The era of eating alone and drinking alone has come four to five years ago. 
								       And 2020!! The Corona 19 crisis has dealt an economic blow to food companies and restaurant owners as they face great pain.
									   The cost-effective way to mitigate this is to connect multiple restaurant operators and businesses with our Ladyburg customers to better quality food service.
									   I promise to give you a elightful table with the right recipe!!</p>
					</div>
					<!-- Ingredients -->
					<div class="col-12 col-lg-4">
						<div class="ingredients">
							<h4>Ingredients</h4>

							<!-- Custom Checkbox -->
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck1"> <label class="custom-control-label"
									for="customCheck1">4 Tbsp (57 gr) butter</label>
							</div>

							<!-- Custom Checkbox -->
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck2"> <label class="custom-control-label"
									for="customCheck2">2 large eggs</label>
							</div>

							<!-- Custom Checkbox -->
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck3"> <label class="custom-control-label"
									for="customCheck3">2 yogurt containers granulated sugar</label>
							</div>

							<!-- Custom Checkbox -->
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck4"> <label class="custom-control-label"
									for="customCheck4">1 vanilla or plain yogurt, 170g
									container</label>
							</div>

							<!-- Custom Checkbox -->
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck5"> <label class="custom-control-label"
									for="customCheck5">2 yogurt containers unbleached white
									flour</label>
							</div>

							<!-- Custom Checkbox -->
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck6"> <label class="custom-control-label"
									for="customCheck6">1.5 yogurt containers milk</label>
							</div>

							<!-- Custom Checkbox -->
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck7"> <label class="custom-control-label"
									for="customCheck7">1/4 tsp cinnamon</label>
							</div>

							<!-- Custom Checkbox -->
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck8"> <label class="custom-control-label"
									for="customCheck8">1 cup fresh blueberries </label>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<div class="section-heading text-left">
							<h3>Leave a comment</h3>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<div class="contact-form-area">
							<form action="#" method="post">
								<div class="row">
									<div class="col-12 col-lg-6">
										<input type="text" class="form-control" id="name"
											placeholder="Name">
									</div>
									<div class="col-12 col-lg-6">
										<input type="email" class="form-control" id="email"
											placeholder="E-mail">
									</div>
									<div class="col-12">
										<input type="text" class="form-control" id="subject"
											placeholder="Subject">
									</div>
									<div class="col-12">
										<textarea name="message" class="form-control" id="message"
											cols="30" rows="10" placeholder="Message"></textarea>
									</div>
									<div class="col-12">
										<button class="btn delicious-btn mt-30" type="submit">Post
											Comments</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ##### Follow Us Instagram Area Start ##### -->
	<div class="follow-us-instagram">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h5>Follow Us Instragram</h5>
				</div>
			</div>
		</div>
		<!-- Instagram Feeds -->
		<div class="insta-feeds d-flex flex-wrap">
			<!-- Single Insta Feeds -->
			<div class="single-insta-feeds">
				<img
					src="${pageContext.request.contextPath}/resources/img/bg-img/insta1.jpg"
					alt="">
				<!-- Icon -->
				<div class="insta-icon">
					<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
				</div>
			</div>

			<!-- Single Insta Feeds -->
			<div class="single-insta-feeds">
				<img
					src="${pageContext.request.contextPath}/resources/img/bg-img/insta2.jpg"
					alt="">
				<!-- Icon -->
				<div class="insta-icon">
					<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
				</div>
			</div>

			<!-- Single Insta Feeds -->
			<div class="single-insta-feeds">
				<img
					src="${pageContext.request.contextPath}/resources/img/bg-img/insta3.jpg"
					alt="">
				<!-- Icon -->
				<div class="insta-icon">
					<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
				</div>
			</div>

			<!-- Single Insta Feeds -->
			<div class="single-insta-feeds">
				<img
					src="${pageContext.request.contextPath}/resources/img/bg-img/insta4.jpg"
					alt="">
				<!-- Icon -->
				<div class="insta-icon">
					<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
				</div>
			</div>

			<!-- Single Insta Feeds -->
			<div class="single-insta-feeds">
				<img
					src="${pageContext.request.contextPath}/resources/img/bg-img/insta5.jpg"
					alt="">
				<!-- Icon -->
				<div class="insta-icon">
					<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
				</div>
			</div>

			<!-- Single Insta Feeds -->
			<div class="single-insta-feeds">
				<img
					src="${pageContext.request.contextPath}/resources/img/bg-img/insta6.jpg"
					alt="">
				<!-- Icon -->
				<div class="insta-icon">
					<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
				</div>
			</div>

			<!-- Single Insta Feeds -->
			<div class="single-insta-feeds">
				<img
					src="${pageContext.request.contextPath}/resources/img/bg-img/insta7.jpg"
					alt="">
				<!-- Icon -->
				<div class="insta-icon">
					<a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Follow Us Instagram Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer-area">
		<div class="container h-100">
			<div class="row h-100">
				<div
					class="col-12 h-100 d-flex flex-wrap align-items-center justify-content-between">
					<!-- Footer Social Info -->
					<div class="footer-social-info text-right">
						<a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a> <a
							href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a> <a
							href="#"><i class="fa fa-behance" aria-hidden="true"></i></a> <a
							href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
					</div>
					<!-- Footer Logo -->
					<div class="footer-logo">
						<a href="index.html"><img
							src="${pageContext.request.contextPath}/resources/img/core-img/logo.png"
							alt=""></a>
					</div>
					<!-- Copywrite -->
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- ##### Footer Area Start ##### -->
	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
	<script
		src="<c:url value ="/resources/js/jquery/jquery-2.2.4.min.js" />"></script>
	<!-- Popper js -->
	<script src="<c:url value ="/resources/js/bootstrap/popper.min.js" />"></script>
	<!-- Bootstrap js -->
	<script
		src="<c:url value ="/resources/js/bootstrap/bootstrap.min.js" />"></script>
	<!-- All Plugins js -->
	<script src="<c:url value ="/resources/js/plugins/plugins.js" />"></script>
	<!-- Active js -->
	<script src="<c:url value ="/resources/js/active.js" />"></script>
	
</body>
</html>