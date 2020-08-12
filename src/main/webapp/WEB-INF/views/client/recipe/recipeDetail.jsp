<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">

<!-- Title -->
<title>Delicious - Food Blog Template | Home</title>

<!-- Core Stylesheet -->
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/recipeInsert.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

	<jsp:include page="/WEB-INF/include/Nav.jsp" />
	
	<div>
		<section class="background">
			<hr>
			<div class="container">
			
				<!-- 1 로우 -->
				<div>
					
					<!-- #### 기본 정보 #### -->
					<div class="recipe-insert-back col-md-8">
						<div class="recipe-insert-section">
							<div class="recipe-detail-column">
								<img class="recipe-insert-title comImege" src="${pageContext.request.contextPath}/resources/img/recipe-com-img/${ recipe.recipe_complete_img }"><br>
								<div class="recipe-complete-title">${ recipe.recipe_nm } </div>
								<input type="hidden" value="${ recipe.member_id }">
								<div class="recipe-complete-info">
									${fn:replace(recipe.recipe_info, replaceChar, "<br/>")}
								</div>
								<div class="alignRight">
									<%if((session.getAttribute("member_id")!=null)&&(request.getAttribute("member_id")!=null) ){%>
										<%if( session.getAttribute("member_id").equals(request.getAttribute("member_id")) ) { %>
											<a class="btn btn-primary"
											href="recipeInterceptor/recipeUpdate.re?recipe_no=${ recipe.recipe_no }">수정 하기
											</a>
										<%} %>
									<%} %>
									조회수 : ${ recipe.recipe_cnt }
									<hr>
								</div>
							</div>
						</div>
					</div>
					<!-- #### 기본 정보 #### -->
					
					<!-- #### 식재료 정보 #### -->
					<div class="recipe-ingre-back col-md-4">
						<div class="recipe-insert-section">
							<div class="recipe-detail-column">
								<div class="recipe-insert-title">
									재료 (${ recipe.recipe_person } 인분)
								</div>
								<c:forEach items="${ recipeIngreList }" var="ingre" varStatus="sq">
									<div>
										${ ingre.ingredient_nm }&nbsp;&nbsp;
										${ ingre.recipeingre_cnt }
									</div>
									<input type="hidden" class="recipeIngre_cnt" value="${ sq.index }">
								</c:forEach>
							
							</div>
						</div>
					</div>
				</div>
				<!-- #### 식재료 정보 #### -->
			
				<!-- 2 로우 -->
				<form action="recipeInterceptor/basketInsert.re" method="post" name="basketInsert">
					<div>
						
						<!--  #### 요리 과정 #### -->
						<div class="recipe-insert-back col-md-8">
							<div class="recipe-insert-section">
							
								<div class="recipe-insert-title">요리 과정</div>
								
								<div class="recipe-process-column">
									<c:forEach items="${ recipeProcessList }" var="process" varStatus="status">
										<div>
											<span class="hn">STEP ${status.count}.</span>
											
											${fn:replace(process.recipe_process, replaceChar, "<br/>")}&nbsp;&nbsp;
										</div>
										<div class="pagingCenter">
											<img class="recipe-insert-title proImege" src="${pageContext.request.contextPath}/resources/img/recipe-pro-img/${ process.recipe_process_img }">
										</div>
										<hr>
									</c:forEach>				
								</div>
							</div>
						</div>
						
						<!--  #### 재료 정보 #### -->
						<div class="recipe-ingre-back col-md-4">
							<div class="recipe-insert-section">
						
							<div class="recipe-insert-title">쇼핑 하기 <br>
								<span class="recipe_person">(${ recipe.recipe_person } 인분)</span>
								<input type="hidden" class="original_person" value="${ recipe.recipe_person }">
								<button type="button" class="btn btn-success btn-sm" title="인원수 늘리기"
									onclick="personUp()">
									<span class="glyphicon glyphicon-plus"></span>
								</button>
								<button type="button" class="btn btn-success btn-sm" title="인원수 내리기"
									onclick="personDown()">
									<span class="glyphicon glyphicon-minus"></span>
								</button>
							</div>
								<div class="recipe-process-column">
									
									<c:forEach items="${ shopingIngreList }" var="shopingIngre" varStatus="index">
										<img class="recipe-insert-title ingreImege"
										 	src="${pageContext.request.contextPath}/resources/img/ingredient-img/${ shopingIngre.ingredient_thumbName }">
										<div class="ingreTitle">${ shopingIngre.ingredient_nm }</div>
										(${shopingIngre.ingredient_weight}당)
										 ${ shopingIngre.ingredient_price }원 <br>
										<input type="hidden"
										 class="recipeingre_cnt${ index.index }" value="${ shopingIngre.recipeingre_cnt }" />
										
										<input type="hidden"
										 class="ingredient_amt${ index.index }" value="${ shopingIngre.ingredient_amt }" />
										
										<input type="number" name="ingredient_cnt" id="${ index.index }"
										 class="ingredient_cnt${ index.index }"  min="1" max="20" value="1">
										
										<input type="checkbox" id="checkBasket${ index.index }" name="checkBasket"
										 class="checkBasketClass" value="${ index.index }" checked="checked"/> 담기<br>
										<div class="ingredientLack${ index.index } red"></div>
										
										<div id="totalPrice${ index.index }"></div>
										 
										<input type="hidden" id="check${ index.index }" name="check"
										 class="checkClass" value="true"/>
										 
										<%if (session.getAttribute("member_id") != null) {%>
											<input type="hidden" name="member_id"
											 class="member_id${ index.index }"  value="${sessionScope.member_id}"/>
										<%} else if(session.getAttribute("kname") != null) { %>
											<input type="hidden" name="member_id"
											 class="member_id${ index.index }"  value="${sessionScope.kname}"/>
										<%} else if(session.getAttribute("nname") != null) { %>
											<input type="hidden" name="member_id"
											 class="member_id${ index.index }"  value="${sessionScope.nname}"/>
										<%} %>
										<input type="hidden" name="recipe_no"
										 class="recipe_no${ index.index }" value="${recipe.recipe_no}"/>
										 
										<input type="hidden" name="recipe_nm"
										 class="recipe_nm${ index.index }" value="${recipe.recipe_nm}"/>
										 
										<input type="hidden" name="ingredient_no"
										 class="ingredient_no${ index.index }" value="${shopingIngre.ingredient_no}"/>
										 
										<input type="hidden" name="ingredient_nm"
										 class="ingredient_nm${ index.index }" value="${shopingIngre.ingredient_nm}"/>
										 
										<input type="hidden" name="ingredient_price"
										 class="ingredient_price${ index.index }" value="${shopingIngre.ingredient_price}"/>
										 
										<input type="hidden" name="ingredient_thumbName"
										 class="ingredient_thumbName${ index.index }" value="${shopingIngre.ingredient_thumbName}"/>
										 
										<input type="hidden" name="ingredient_weight"
										 class="ingredient_weight${ index.index }" value="${shopingIngre.ingredient_weight}"/>
										
										<hr class="hrSection">
									</c:forEach>	
									<input type="hidden" name="order" value="">
									<input type="hidden" name="where" id="where" value="before"/>
									<div id="totalPrice"></div>
									<%if ((session.getAttribute("member_id") == null)&&(session.getAttribute("kname") == null)
											&&(session.getAttribute("nname") == null)) {%>
									<div class="pagingCenter">
										<input type="button" class="orderRecipeButton" value="장바구니 담기">
										<input type="button" class="orderRecipeButton" value="바로 구매하기">
									</div>
									<%} else { %>
									<div class="pagingCenter">
										<input type="button" data-toggle="modal" data-target="#myModal" value="장바구니 담기">
										<input type="button" class="orderRecipeButton" value="바로 구매하기">
									</div>
									<%} %>
									<!-- Modal -->
									<div class="modal fade" id="myModal" role="dialog">
										<div class="modal-dialog">
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">×</button>
												</div>
												<div class="modal-body">
													<p>장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?</p>
												</div>
												<div class="modal-footer">
													<input type="button" onclick="moveBasket()" value="예"/>
													<input type="button" onclick="moveRecipe()" value="아니오"/>
												</div>
											</div>
										</div>
									</div>
									<!-- Modal -->
									
								</div>
							</div>
						</div>
					</div>
				</form>
				
			</div>
		</section>
	</div>

	<script src="<c:url value ="/resources/js/recipe/recipe.js" />"></script>
	
</body>

</html>
