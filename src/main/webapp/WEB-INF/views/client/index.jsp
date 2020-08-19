<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Delicious - Food Blog Template | Home</title>

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>
<script type="text/javascript">
		$(document).ready(function() {
			var ischangePWD = '${ ischangePWD }';
			console.log(ischangePWD);
			if( ischangePWD != 0 ) {
				 alert('비밀번호 변경한 지 90일이 지났습니다. 비밀번호를 변경해주세요.');
			}
		})
</script>
    <jsp:include page="/WEB-INF/include/Nav.jsp" />
    <!-- ##### Header Area End ##### -->

    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area">
        <div class="hero-slides owl-carousel">
            <!-- Single Hero Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(resources/img/bg-img/bg1.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <h2 data-animation="fadeInUp" data-delay="300ms">Delicious Homemade Burger</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique nisl vitae luctus sollicitudin. Fusce consectetur sem eget dui tristique, ac posuere arcu varius.</p>
                                <a href="#" class="btn delicious-btn" data-animation="fadeInUp" data-delay="1000ms">See Receipe</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(resources/img/bg-img/bg6.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <h2 data-animation="fadeInUp" data-delay="300ms">Delicious Homemade Burger</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique nisl vitae luctus sollicitudin. Fusce consectetur sem eget dui tristique, ac posuere arcu varius.</p>
                                <a href="#" class="btn delicious-btn" data-animation="fadeInUp" data-delay="1000ms">See Receipe</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(resources/img/bg-img/bg7.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                <h2 data-animation="fadeInUp" data-delay="300ms">Delicios Homemade Burger</h2>
                                <p data-animation="fadeInUp" data-delay="700ms">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique nisl vitae luctus sollicitudin. Fusce consectetur sem eget dui tristique, ac posuere arcu varius.</p>
                                <a href="#" class="btn delicious-btn" data-animation="fadeInUp" data-delay="1000ms">See Receipe</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Top Catagory Area Start ##### -->
    <section class="top-catagory-area section-padding-80-0">
        <div class="container">
            <div class="row">
                <!-- Top Catagory Area -->
                <div class="col-12 col-lg-6">
                    <div class="single-top-catagory">
                        <img src="${pageContext.request.contextPath}/resources/img/bg-img/bg2.jpg" alt="">
                        <!-- Content -->
                        <div class="top-cta-content">
                            <h3>Strawberry Cake</h3>
                            <h6>Simple &amp; Delicios</h6>
                            <a href="receipe-post.html" class="btn delicious-btn">See Full Receipe</a>
                        </div>
                    </div>
                </div>
                <!-- Top Catagory Area -->
                <div class="col-12 col-lg-6">
                    <div class="single-top-catagory">
                        <img src="${pageContext.request.contextPath}/resources/img/bg-img/bg3.jpg" alt="">
                        <!-- Content -->
                        <div class="top-cta-content">
                            <h3>Chinesse Noodles</h3>
                            <h6>Simple &amp; Delicios</h6>
                            <a href="receipe-post.html" class="btn delicious-btn">See Full Receipe</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Top Catagory Area End ##### -->

    <!-- ##### Best Receipe Area Start ##### -->
    <section class="best-receipe-area">
        <div class="container">
            <div class="row">

                <div class="col-12" style="width: 1140px;">
                    <div class="section-heading">
                        <h3>핫핫 레시피!</h3>
                    </div>
                </div>
            </div>
            
			<div class="top-cta-content">
				<a href="getRankLikeRankingList.rk" class="btn delicious-btn pull-right" role="button">레시피 순위 더보기</a>
			</div>
			<div class="clearfix"></div>

			<div class="row" id="likeRankingList">
				<c:forEach var="likeList" items="${ likeRankingList }" varStatus="status" begin="0" end="5">
					<div class="col-12 col-sm-6 col-lg-4">
						<div class="single-best-receipe-area mb-30">
							<a href='getRecipe.re?recipe_no=${ likeList.recipe_no }'>
								<img src="${pageContext.request.contextPath}/resources/img/recipe-com-img/${ likeList.recipe_complete_img }" alt='${ likeList.recipe_complete_img }' style='width:350px; height:300px;'>
							</a>
							<div class="receipe-content">
								<h5 id="rank_no" data-rank_no="${ likeList.rank_no }">No.${ likeList.rank_no }&nbsp;&nbsp;${ likeList.recipe_nm }</h5>
								<i class="fa fa-thumbs-up font-italic" aria-hidden="true">${ likeList.recipe_like_sum }</i>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
    </section>
    <!-- ##### Best Receipe Area End ##### -->
    
    <!-- ##### Small Receipe Area Start ##### -->
	<section class="small-receipe-area section-padding-80-0">
		<div class="container">
			<div class="section-heading">
				<h3>핫핫 식재료</h3>
			</div>
			<div class="top-cta-content">
				<a href="getRankSellIngredientRankingList.rk" class="btn delicious-btn pull-right" role="button">식재료 순위 더보기</a>
			</div>
			<div class="clearfix"></div>
			<div class="row" id="subRankingList">
				<c:forEach var="ingreList" items="${ ingreRankingList }" varStatus="status" begin="0" end="11">
				<div class="col-12 col-sm-6 col-lg-4">
					<div class="single-small-receipe-area d-flex">
						<div class="receipe-thumb">
							<img src="${pageContext.request.contextPath}/resources/img/ingredient-img/${ ingreList.ingredient_thumbName }" alt="${ ingreList.ingredient_thumbName }" class='mr-3 mt-3 rounded-circle' style='width:60px; height:60px;'>
						</div>
						<div class="receipe-content">
							<span style="color: #f50920;">No.${ ingreList.rank_no }</span>
							<a href='getRankSellIngredientRankingList.rk'>
							<h5>${ ingreList.ingredient_nm }</h5>
							</a>
							<i class="fa fa-fire font-italic" aria-hidden="true">${ ingreList.ingredient_sell_sum }</i>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</section>
    <!-- ##### Small Receipe Area End ##### -->



    <!-- ##### Small Receipe Area Start ##### -->
	<section class="small-receipe-area section-padding-80-0">
		<div class="container">
			<div class="section-heading">
				<h3>핫핫 쉐프</h3>
			</div>
			<div class="top-cta-content">
				<a href="getRankSubscribeRankingList.rk" class="btn delicious-btn pull-right" role="button">쉐프 순위 더보기</a>
			</div>
			<div class="clearfix"></div>
			<div class="row" id="subRankingList">
				<c:forEach var="subList" items="${ subRankingList }" varStatus="status" begin="0" end="11">
				<div class="col-12 col-sm-6 col-lg-4">
					<div class="single-small-receipe-area d-flex">
						<div class="receipe-thumb">
							<a href='getChefRecipeList.re?member_id=${ subList.member_id }'>
								<img src="${pageContext.request.contextPath}/resources/img/profileImg/${ subList.member_img }" alt="${ subList.member_img }" class='mr-3 mt-3 rounded-circle' style='width:60px; height:60px;'>
							</a>
						</div>
						<div class="receipe-content">
							<span style="color: #f50920;">No.${ subList.rank_no }</span>
							<a href='getChefRecipeList.re?member_id=${ subList.member_id }'>
							<h5>${ subList.member_nickname }</h5>
							</a>
							<i class="fa fa-user" aria-hidden="true">${ subList.member_sub_sum }</i>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</section>
    <!-- ##### Small Receipe Area End ##### -->





    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area" style="background-color: #000;">
        <div class="container h-100">
            <div class="row h-100">
                <div class="col-12 h-100 d-flex flex-wrap align-items-center justify-content-between">
                    <div class="footer-logo">
                        <a href="index.jsp"><img src="${pageContext.request.contextPath}/resources/img/core-img/logo.png" alt=""></a>
                    </div>                    
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area Start ##### -->
</body>

</html>