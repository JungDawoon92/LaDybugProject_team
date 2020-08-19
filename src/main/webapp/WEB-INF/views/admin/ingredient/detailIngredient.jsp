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
<!-- Title -->
<title>Delicious - Food Blog Template | Blog Post</title>
<!-- Favicon -->
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/core-img/favicon.ico">
<!-- Core Stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style.css">
<style type="text/css">
#beforeList {float:right;}
#collapseTwo {text-align: left;}
</style>
</head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<body>
<jsp:include page="/WEB-INF/include/adminNav.jsp"/>
	<!-- ##### Breadcumb Area Start ##### -->
	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/breadcumb2.jpg);">
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

	<!-- ##### Blog Area Start ##### -->
	<div class="blog-area section-padding-80">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-8">
					<div class="blog-posts-area">
						<!-- Single Blog Area -->
						<div class="single-blog-area mb-80">
							<!-- Thumbnail -->
							<div class="blog-thumbnail">
								<img src="${pageContext.request.contextPath}/resources/img/ingredient-img/${detail.ingredient_thumbName}" alt="${detail.ingredient_nm}" title="${detail.ingredient_nm}" style="width: 100%; height: auto;">
								<!-- Post Date -->
								<div class="post-date">
									<a href="#"><span><script>document.write(new Date().getMonth()+1);</script></span>July<br>2020</a>
								</div>
							</div>
							<!-- Content -->
							<div class="blog-content">
								<div>
									<img
										src="${pageContext.request.contextPath}/resources/img/ingredient-img/${detail.ingredient_thumbName}"
										alt="${detail.ingredient_nm}" title="${detail.ingredient_nm}"
										style="height: 100px; width: 100px; border: 1px solid black">
								</div>
							</div>
						</div>
						<!-- Single Blog Area -->
						<div class="single-blog-area mb-80">
							<!-- Thumbnail -->
							<!-- Content -->
							<div class="blog-content">
							<!-- 아코디언 매앤 -->
								<div class="col-12" style="max-width:100%;">
									<div class="accordions mb-80" id="accordion" role="tablist"
										aria-multiselectable="true">
										<!-- Single Accordian Area -->
										<div class="panel single-accordion">
											<h6>
												<a role="button" class="" aria-expanded="true"
													aria-controls="collapseOne" data-toggle="collapse"
													data-parent="#accordion" href="#collapseOne">상품정보<span
													class="accor-open"><i class="fa fa-plus"
														aria-hidden="true"></i></span> <span class="accor-close"><i
														class="fa fa-minus" aria-hidden="true"></i></span>
												</a>
											</h6>
											<div id="collapseOne" class="accordion-content collapse show">
													<div>
														<div>
															<div>
																<img src="${pageContext.request.contextPath}/resources/img/ingredient-img/${detail.ingredient_thumbName}"
																				alt="${detail.ingredient_nm }" title="${detail.ingredient_nm }" style="width: 100%; height: auto;">
															</div>
															<dl>
																<dt></dt>
																<dt></dt>																
															</dl>
															<hr>
															<dl>
																<dt></dt>
																<dt></dt>
															</dl>
															<hr>
															<dl>
																<dt><img src="${pageContext.request.contextPath}/resources/img/ingredient-img/${detail.ingredient_thumbName}"
																				style="width: 100%; height: auto;"></dt>
																<dt>${detail.ingredient_amt}</dt>
															<c:forEach items="${detailMulti}"  var="multi">							
																<dt><img src="${pageContext.request.contextPath}/resources/img/upload/${multi.ingredient_fileName}"
																				style="width: 100%; height: auto;"></dt>
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
													data-toggle="collapse" href="#collapseTwo">상세정보<span class="accor-open"><i
														class="fa fa-plus" aria-hidden="true"></i></span> <span
													class="accor-close"><i class="fa fa-minus"
														aria-hidden="true"></i></span>
												</a>
											</h6>
											<div id="collapseTwo" class="accordion-content collapse">
												<div>
													<dl>
														<dt>식재료 원산지</dt>
														<dd>${detailDetail.ingredient_country}</dd>
													</dl>
													<dl>
														<dt>식재료 생산지/수입지</dt>
														<dd>${detailDetail.ingredient_productimporter}</dd>
													</dl>
													<dl>
														<dt>식재료 중량</dt>
														<dd>${detailDetail.ingredient_weight}</dd>
													</dl>
													<dl>
														<dt>식재료 제조월일</dt>
														<dd>${detailDetail.ingredient_mnfctDate}</dd>
													</dl>
													<dl>
														<dt>식재료 상세 유통기한</dt>
														<dd>${detailDetail.ingredient_selLife}</dd>
													</dl>
													
													<dl>
														<dt>식재료 상세 가공유형</dt>
														<dd>${detailDetail.ingredient_selFoodType}</dd>
													</dl>
													
													<dl>
														<dt>식재료 상세 저장방법</dt>
														<dd>${detailDetail.ingredient_selStorage}</dd>
													</dl>
													<dl>
														<dt>식재료 포장재질</dt>
														<dd>${detailDetail.ingredient_pckmtr}</dd>
													</dl>
													<dl>
														<dt>식재료 영양소</dt>
														<dd>${detailDetail.ingredient_nutrient}</dd>
													</dl>
													<dl>
														<dt>식재료 알레르기</dt>
														<dd>${detailDetail.ingredient_allergy}</dd>
													</dl>
												</div>
											</div>
										</div>
								
									</div>
								</div>
								<a href="#" class="post-title">건강한 식재료를 더 많이 만나보세요!!</a>
								<div class="meta-data">
									by <a href="#">LadyBug</a> in <a href="#">Restaurants</a>
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
						</div>
						<!-- Single Blog Area -->
						<div class="single-blog-area mb-80">
							<!-- Thumbnail -->
							<div class="blog-thumbnail">
								<img
									src="${pageContext.request.contextPath}/resources/img/blog-img/3.jpg"
									alt="">
								<!-- Post Date -->
								<div class="post-date">
									<a href="#"><span><script>document.write(new Date().getMonth()+1)</script></span>July<br>2020</a>
								</div>
							</div>
							<!-- Content -->
							<div class="blog-content">
								<a href="#" class="post-title">5 Tips on how to cook the
									best hamburger</a>
								<div class="meta-data">
									by <a href="#">Maria Williams</a> in <a href="#">Company</a>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Vestibulum nec varius dui. Suspendisse potenti. Vestibulum ac
									pellentesque tortor. Aenean congue sed metus in iaculis. Cras a
									tortor enim. Phasellus posuere vestibulum ipsum, eget lobortis
									purus. Orci varius natoque penatibus et magnis dis parturient
									montes, nascetur ridiculus mus.</p>
								<a href="getIngredientList.co" id="beforeList" class="btn delicious-btn mt-30">확인</a>
							</div>
						</div>
					</div>		
				</div>

				<div class="col-12 col-lg-4" style="height: 750px;">
					<div class="blog-sidebar-area">

						<!-- Widget -->
					
						<div class="single-widget mb-80">
							<h6>
								<font size="11px">${detail.ingredient_nm}</font>
							</h6>
							<ul class="list">
								<li><font size="5px">카테고리 :
										${detail.ingredient_categ}류</font></li>
								<li><font size="5px">판매가 :
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${detail.ingredient_price}"/>원</font></li>
								<hr>
								<li><font size="5px">중량  :
										${detailDetail.ingredient_weight}</font></li>
								<li><font size="5px">유통기한 : 
										${detailDetail.ingredient_selLife}</font></li>
								<hr>
							</ul>
							<form>													
									<input type="hidden" id="ingredient_no" name="ingredient_no" value="${detail.ingredient_no }"/><br>
									<input type="hidden" id="ingredient_nm" name="ingredient_nm" value="${detail.ingredient_nm }"/>
									<input type="hidden" id="ingredient_amt2" name="ingredient_amt2" value="${detail.ingredient_amt}">
									<br>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Blog Area End ##### -->

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
		src="<c:url value ="/resources/js/bootstrap/bootstrap.min.js"/>"></script>
	<!-- All Plugins js -->
	<script src="<c:url value ="/resources/js/plugins/plugins.js"/>"></script>
	<!-- Active js -->
	<script src="<c:url value ="/resources/js/active.js"/>"></script>
</body>

</html>