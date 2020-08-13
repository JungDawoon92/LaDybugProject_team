<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/ingredient/magnifier.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="<c:url value ="/resources/js/ingredient/magnifier.js" />"></script>
<script src="<c:url value ="/resources/js/ingredient/fnImgPop.js" />"></script>
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
var m = ${result};

console.log(typeof(m));
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
	    var bbb = parseInt(aaa) * count;
	    var price = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(bbb);
		$('h3 #ing_price').text(price+"원");
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
    var price = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(bbb);
	$('h3 #ing_price').text(price+"원");	
}

function orderForm() {
	let checkArr = new Array();
	var no = $('#ingredient_no').val();
	var cnt = $('#ingredient_cnt').val();
	checkArr.push({"ingre_no":no, "ingre_cnt":cnt});
	let json = JSON.stringify(checkArr);
	$('input[name=order]').val(json);
}

</script>
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!-- Title -->
<title>Delicious - Food Blog Template | Receipe Post</title>
<!-- Favicon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/core-img/favicon.ico">
<style type="text/css">
h3 div{display:inline;}
.centerImg{text-align:center; }
.centerImg img{width:85%; }
</style>
</head>
<body>
	<!-- Preloader -->
	<div id="preloader">
		<i class="circle-preloader"></i> <img
			src="${pageContext.request.contextPath}/resources/img/core-img/salad.png"
			alt="">
	</div>
	<jsp:include page="/WEB-INF/include/Nav.jsp" />
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
					<div>
						<img id="imgController" name="imgController"
							onclick="fnImgPop(this.src)"
							src="${pageContext.request.contextPath}/resources/img/ingredient-img/${ingredient.ingredient_thumbName}"
							alt="${ingredient.ingredient_nm}"
							title="${ingredient.ingredient_nm}"
							style="height: 100px; width: 100px; margin-top: 5px;"
							data-zoom="2" />
					</div>
				</div>
			<form method="POST">
				<div class="row">
					<div class="col-12 col-md-8">
						<div class="receipe-headline my-5">
							<span>0<script>document.write(new Date().getMonth()+1);</script>,
								2020
							</span>
							<c:if test="{$ingredient.ingredient_categ }">
								<span style="float: right"> <a
									href="meatPage.do?ingredient_categ=${ingredient.ingredient_categ}"
									class="btn btn-outline-info btn-sm"> <i
										class="fa fa-hashtag" aria-hidden="true">육류</i></a> <a
									href="beefPage.do?ingredient_categ=${ingredient.ingredient_categ}"
									class="btn btn-outline-info btn-sm"> <i
										class="fa fa-hashtag" aria-hidden="true">소고기</i></a> <a
									href="chickenPage.do?ingredient_categ=${ingredient.ingredient_categ}"
									class="btn btn-outline-info btn-sm"> <i
										class="fa fa-hashtag" aria-hidden="true">닭고기</i></a> <a
									href="seafoodPage.do?ingredient_categ=${ingredient.ingredient_categ}"
									class="btn btn-outline-info btn-sm"> <i
										class="fa fa-hashtag" aria-hidden="true">해산물</i></a> <a
									href="vegetablePage.do?ingredient_categ=${ingredient.ingredient_categ}"
									class="btn btn-outline-info btn-sm"> <i
										class="fa fa-hashtag" aria-hidden="true">야채</i></a> <a
									href="fruitPage.do?ingredient_categ=${ingredient.ingredient_categ}"
									class="btn btn-outline-info btn-sm"> <i
										class="fa fa-hashtag" aria-hidden="true">과일</i></a> <a
									href="nutsPage.do?ingredient_categ=${ingredient.ingredient_categ}"
									class="btn btn-outline-info btn-sm"> <i
										class="fa fa-hashtag" aria-hidden="true">견과류</i></a> <a
									href="etcPage.do?ingredient_categ=${ingredient.ingredient_categ}"
									class="btn btn-outline-info btn-sm"> <i
										class="fa fa-hashtag" aria-hidden="true">기타</i></a>
								</span>
							</c:if>
							<h4>${ingredient.ingredient_nm}</h4>
							<hr>
							<div class="receipe-duration">
								
									<div>
										판매가 :
										<h6 style="display: inline;">
											<fmt:formatNumber type="number"  value="${ingredient.ingredient_price}" />원
										</h6>
									</div>
									<input type="hidden" id="ingredient_price" name="ingredient_price" class="ingredient_price" value="${ingredient.ingredient_price}" readonly="readonly" style="border: 1px"> 
										<b>카테고리 : ${ingredient.ingredient_categ}류</b> 
										<input type="hidden" id="ingredient_no" name="ingredient_no" value="${ingredient.ingredient_no}"> 
										<input type="hidden" id="ingredient_amt2" name="ingredient_amt2" value="${ingredient.ingredient_amt}"> 
										<input type="hidden" id="ingredient_nm" name="ingredient_nm" value="${ingredient.ingredient_nm}"> 
										<input type="hidden" id="ingredient_thumbimg" name="ingredient_thumbName" value="${ingredient.ingredient_thumbName}">
									<hr>
									<b>중량 : ${ingredientDetail.ingredient_weight}</b><br> <b>유통기한
										: ${ingredientDetail.ingredient_selLife} </b>
									<hr>
									<b>수량:
										<div id="check" style="display: inline;"></div>
									</b> <span class="qty" style="display: inline;"> <input
										type="hidden" id="sale_price" name="sale_price" value="13600" />
										<input type="hidden" id="chk_sale_price" name="chk_sale_price"
										value="13600" /> <input type="text" name="ingredient_cnt"
										id="ingredient_cnt" value="1" title="제품수량입력" maxlength="3" />
										<a class='btn btn-success' type="button" id="minus"
										title="상품수량감소"><i class="fa fa-minus"
											style="color: lightblue; text-shadow: 2px 2px 4px #000000;"
											aria-hidden="true" onclick="minus()"></i></a> <a
										class='btn btn-success' type="button" id="plus" title="상품수량증가"><i
											class="fa fa-plus"
											style="color: lightblue; text-shadow: 2px 2px 4px #000000;"
											aria-hidden="true" onclick="plus()"></i></a>
										<h3 style="display: inline; float: right;">
											총 제품금액:<div id="ing_price">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${ingredient.ingredient_price}" />원</div>
										</h3>
										<br><br>
										<div id="amtCheck"></div>
									</span>
								
							</div>
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="receipe-ratings text-right my-5">
							
								<span>
									<button class="btn delicious-btn mt-30" id="insertCart"
										type="submit" formaction="insertCart">장바구니</button>
									<button class="btn delicious-btn mt-30" id="orderCart"
										type="submit" onclick="orderForm()"
										formaction="orderForm">
										구매하기 
									</button>
									<input type="hidden" name="order">
								</span>
							
						</div>
					</div>
				</div>
				</form>

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
										<div class="centerImg">
											<div>
												<img
													src="${pageContext.request.contextPath}/resources/img/ingredient-img/${ingredient.ingredient_thumbName}"
													alt="${ingredient.ingredient_nm }"
													title="${ingredient.ingredient_nm }">
											</div>
											<hr>
											<dl>
												<dt>
													<img
														src="${pageContext.request.contextPath}/resources/img/ingredient-img/${ingredient.ingredient_thumbName}"
														alt="${ingredient.ingredient_nm }"
														title="${ingredient.ingredient_nm }">
												</dt>

												<c:forEach items="${ingredientMulti}" var="multi">
													<dt>
														<img
															src="${pageContext.request.contextPath}/resources/img/upload/${multi.ingredient_fileName}"
															alt="${ingredient.ingredient_nm}"
															title="${ingredient.ingredient_nm}">
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
						<p>
							레이디버그는 여러분들의 밥상을 책임질 준비가 되어 있습니다. <br>4~5년 전부터 혼밥, 혼술의 시대가
							도래해왔습니다. 그리고 2020년!! 코로나 19사태로 식재료 업체들과 식당 업주들은 크나 큰 고통을 맞이하면서
							경제적 타격을 맞았습니다. <br>이를 경제적으로 완화시킬 수 있는 방법은 여러 식당 사업자와 업체들을 우리
							레이디버그 고객님과 연결해드려 보다 질 좋은 식재료 서비스, 그에 맞는 레시피로 즐거운 밥상이 될 수 있기를
							약속합니다!!<br> <br> Ladyberg is ready to take charge of
							your meal. The era of eating alone and drinking alone has come
							four to five years ago. And 2020!! The Corona 19 crisis has dealt
							an economic blow to food companies and restaurant owners as they
							face great pain. The cost-effective way to mitigate this is to
							connect multiple restaurant operators and businesses with our
							Ladyburg customers to better quality food service. I promise to
							give you a elightful table with the right recipe!!
						</p>

					</div>
				</div>
				<!--  추천 식재료   -->
				<div class="row">
					<div class="col-12">
						<div class="receipe-headline my-5">
							<div class="receipe-duration">
								<h5>다른 브랜드의 상품 더 보기</h5>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${result ne '0'}">
							<c:forEach items="${addList}" var="po" varStatus="wdfas">
								<div class="col-12 col-sm-6 col-lg-4">
									<div class="single-best-receipe-area mb-30">
										<a href="clientDetail.do?ingredient_no=${po.ingredient_no}&ingredient_categ=${po.ingredient_categ}&ingredient_thumbName=${po.ingredient_thumbName}">
											<img src="${pageContext.request.contextPath}/resources/img/ingredient-img/${po.ingredient_thumbName}" style="height: 253px; width: 350px;">
										</a>	
											<div class="receipe-content">
												<a href="receipe-post.html">
													<h5>
														<a href="clientDetail.do?ingredient_no=${po.ingredient_no}&ingredient_categ=${po.ingredient_categ}&ingredient_thumbName=${po.ingredient_thumbName}">${po.ingredient_nm}</a>
														${result}
													</h5>
													<h6>
														<fmt:formatNumber type="number" maxFractionDigits="3"
															value="${po.ingredient_price}" />원
													</h6> ${po.ingredient_categ}
												</a>
												<div class="ratings">
													<i class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star" aria-hidden="true"></i> <i
														class="fa fa-star-o" aria-hidden="true"></i>
												</div>
											</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:when test="${result <= '0'}">
								죄송합니다. 비슷한 브랜드의 상품이 존재하지 않습니다.
						</c:when>
					</c:choose>
					<br><br><br>
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

	
</body>
</html>