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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/recipeInsert.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</head>
<body>

	<jsp:include page="/WEB-INF/include/adminNav.jsp" />
	
	<div>
		<section class="background">
			<hr>
			<div class="container">
				
				<!-- 1 로우 -->
				<div>
					
					<!-- #### 식재료 정보 #### -->
					<div class="recipe-ingre-back col-md-4 pull-right">
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
					<!-- #### 식재료 정보 #### -->
					
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
									<a href="adminRecipeUpdate.adre?recipe_no=${ recipe.recipe_no }">
										<button type="button" class="btn btn-info">수정 하기</button>
									</a>&nbsp;&nbsp;
									<button type="button" class="btn btn-danger"
									 data-toggle="modal" data-target="#myModal">삭제 하기</button>
								
									 조회수 : ${ recipe.recipe_cnt }
									<hr>
								</div>
							</div>
						</div>
					</div>
					<!-- #### 기본 정보 #### -->
				</div>
			
				<!-- 2 로우 -->
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
									<div>
										<img class="recipe-insert-title proImege" src="${pageContext.request.contextPath}/resources/img/recipe-pro-img/${ process.recipe_process_img }">
									</div>
									<hr>
								</c:forEach>				
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<!-- 삭제하기 Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<div class="modal-body">
					<p>삭제 하시면 레시피와 관련 데이터가 모두 삭제됩니다.<br>
						정말 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<a href="adminRecipeDelete.adre?recipe_no=${ recipe.recipe_no }">
						<button type="button" class="btn btn-info" onclick="moveBasket()">예</button>
					</a>
					<button type="button" class="btn btn-warning" data-dismiss="modal">아니오</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	
	<div class="container">
		<jsp:include page="../comment/adcommentList.jsp" />
	</div>
	
	<script src="<c:url value ="/resources/js/recipe/recipe.js" />"></script>
	
</body>

</html>
