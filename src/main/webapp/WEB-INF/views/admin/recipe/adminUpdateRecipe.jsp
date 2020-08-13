<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">

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
	<jsp:include page="/WEB-INF/include/adminNav.jsp" />

	<!-- ##### update form ##### -->
	<div>
		<section class="background">
			<div class="container">
				<form action="adminRecipeUpdate.adre" method="post" enctype="multipart/form-data">
					<!-- #### 기본 정보 입력 #### -->
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="recipe-insert-back color col-sm-8">

							<div class="recipe-insert-title">레시피 수정하기</div>

							<div class="recipe-insert-section">
								<div class="recipe-insert-column" id="image_container0">
								이미지 등록<br>
									<img class="recipe-insert-title originalImg0" src="${pageContext.request.contextPath}/resources/img/recipe-com-img/${ recipe.recipe_complete_img }" width=250px; height=auto;><br>
								</div>
									<input type="file" id="recipe_complete_img_file" name="recipe_complete_img_file"
									 accept="image/*" onchange="setThumbnail(event, 0);" />
								<div class="recipe-insert-column">
									<input type="hidden" name="recipe_no"
										value="${recipe.recipe_no}" />
									레시피 제목 <input type="text" class="form-control" name="recipe_nm"
													value="${recipe.recipe_nm}" style="font-size:15px"/>
								</div>

								<div class="recipe-insert-column">
									레시피 설명
									<textarea class="form-control" rows="5" name="recipe_info" style="font-size:15px">${recipe.recipe_info}</textarea>
								</div>

								<div class="recipe-insert-column row">
									<select class="col-sm-4 recipe-caregory"
										name="recipe_category_kind" required="required">
										<option value="">종류별</option>
										<option value="밥/죽/떡">밥/죽/떡</option>
										<option value="면/만두">면/만두</option>
										<option value="국/탕">국/탕</option>
										<option value="찌개">찌개</option>
										<option value="메인반찬">메인반찬</option>
										<option value="김치/젓갈/장류">김치/젓갈/장류</option>
										<option value="양념/소스/잼">양념/소스/잼/유제품</option>
										<option value="차/음료/술">차/음료/술</option>
										<option value="디저트">디저트</option>
										<option value="퓨전">퓨전</option>
										<option value="기타">기타</option>
										<option value="밑반찬">밑반찬</option>
										<option value="샐러드">샐러드</option>
										<option value="양식">양식</option>
										<option value="빵">빵</option>
										<option value="스프">스프</option>
										<option value="과자">과자</option>
									</select> <select class="col-sm-3 recipe-caregory"
										name="recipe_category_ing" required="required">
										<option value="">재료별</option>
										<option value="육류">육류</option>
										<option value="해물류">해물류</option>
										<option value="건어물류">건어물류</option>
										<option value="곡류">곡류</option>
										<option value="콩/견과류">콩/견과류</option>
										<option value="채소류">채소류</option>
										<option value="버섯류">버섯류</option>
										<option value="밀가루">밀가루</option>
										<option value="가공식품류">가공식품류</option>
										<option value="기타">기타</option>
										<option value="쌀">쌀</option>
										<option value="과일류">과일류</option>
										<option value="달걀/유제품">달걀/유제품</option>
										<option value="소고기">소고기</option>
										<option value="돼지고기">돼지고기</option>
										<option value="닭고기">닭고기</option>
									</select> <select class="col-sm-3 recipe-caregory"
										name="recipe_category_how" required="required">
										<option value="">방법별</option>
										<option value="끓이기">끓이기</option>
										<option value="절임">절임</option>
										<option value="조림">조림</option>
										<option value="회">회</option>
										<option value="삶기">삶기</option>
										<option value="데치기">데치기</option>
										<option value="무침">무침</option>
										<option value="비빔">비빔</option>
										<option value="볶음">볶음</option>
										<option value="굽기">굽기</option>
										<option value="부침">부침</option>
										<option value="찜">찜</option>
										<option value="튀김">튀김</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<!-- #### 기본 정보 입력 #### -->
					
					<!-- #### 레시피 식재료 #### -->
					<div>
						<div class="row">
							<div class="col-sm-2"></div>
							<div class="recipe-insert-back color col-sm-8">
								<div class="recipe-insert-section">
									<c:forEach items="${ recipeIngreList }" var="ingre">
										<div class="recipe-insert-column control-group-ingre">
											식재료 등록
											<div class="clearfix"></div>
											<input type="text" class="form-control ingre" name="ingredient_nm" 
												value="${ingre.ingredient_nm}" />
											<input type="text" class="form-control ingre" name="recipeIngre_cnt"
												value="${ingre.recipeingre_cnt}"/>
											<div class="clearfix"></div>
											<button class="btn btn-danger remove-ingre" type="button"><i class="glyphicon glyphicon-remove"></i></button>
										</div>
										<input type="hidden" name="recipeingre_sq" value="${ingre.recipeingre_sq}"/>
									</c:forEach>
									<!-- 카피 삽입 위치 -->
									<div class="input-group-btn last-ingre"> 
										<button class="btn btn-success add-ingre" type="button"><i class="glyphicon glyphicon-plus"></i></button>
									</div>
								</div>
							</div>
							<div class="col-sm-2"></div>
						</div>
					</div>
					<!-- #### 레시피 식재료 #### -->
					
					<!-- #### 요리 과정 #### -->
					<c:forEach items="${ recipeProcessList }" var="process" varStatus="status">
						<input type="hidden" class="imgIndex" value="${ status.count }">
						<div class="imageUpload">
							<div class="row control-group">
								<div class="col-sm-2"></div>
								<div class="recipe-insert-back color col-sm-8">
									<div class="recipe-insert-section">
										<div class="recipe-insert-column">
											<span class="hn">STEP ${status.count}.</span>
											<textarea class="form-control" rows="5" name="recipe_process" style="font-size:15px">${ process.recipe_process }</textarea>
										</div>
										
										<div class="recipe-insert-column" id="image_container${ status.count }">
											이미지 등록<br>
											<img class="recipe-insert-title originalImg${ status.count }" src="${pageContext.request.contextPath}/resources/img/recipe-pro-img/${ process.recipe_process_img }" width=250px; height=auto;><br>
										</div>
										<input multiple="multiple" type="file" name="recipe_process_img_file"
										 accept="image/*" onchange="setThumbnail(event, ${ status.count });">
										 
										<button class="btn btn-danger remove" type="button"><i class="glyphicon glyphicon-remove"></i></button>
										<input type="hidden" name="recipe_process_sq" value="${ process.recipe_process_sq }">
									</div>
								</div>
								<div class="col-sm-2"></div>
							</div>
						</div>
						<input type="hidden" class="processImg" value="${ status.count }"/>
					</c:forEach>
					<!-- #### 요리 과정 #### -->
					
					<!-- #### 레시피 등록 #### -->
					<div class="row last">
						<div class="col-sm-2"></div>
						<div class="recipe-insert-back color col-sm-8">
							<div class="recipe-insert-section">
								<div class="recipe-insert-column">
									<div class="recipe-insert-column buttonCenter">
									<div class="row buttonCenter">&nbsp;&nbsp;
										<button type="button" class="btn btn-success btn-block col-sm-3 add-more">과정 추가</button>
										<div class="col-sm-1"></div>
										<button type="button" class="btn btn-danger btn-block col-sm-3"
										 data-toggle="modal" data-target="#myModal">삭제 하기</button>
										<div class="col-sm-1"></div>
										<button type="submit" class="btn btn-primary btn-block col-sm-3">완료</button>
									</div>
								</div>
								</div>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<!-- #### 레시피 등록 #### -->
				</form>
			</div>
		</section>
	</div>
	
	<!-- 식재료 카피 -->
	<div class="copy-ingre hide">
		<div class="recipe-insert-column control-group-ingre">
			<input type="text" class="form-control ingre" name="ingredient_nm" placeholder="예) 양파" />
			<input type="text" class="form-control ingre" name="recipeIngre_cnt" placeholder="예) 1/2 개" />
			<div class="clearfix"></div>
			<button class="btn btn-danger remove-ingre" type="button"><i class="glyphicon glyphicon-remove"></i></button>
			<input type="hidden" name="recipeingre_sq" value="0"/>
		</div>
	</div>
	<!-- 식재료 카피 -->
	
	<!-- #### 요리 과정 카피 #### -->
	<div class="copy hide">
		<div class="row control-group">
			<div class="col-sm-2"></div>
			<div class="recipe-insert-back color col-sm-8">
				<div class="recipe-insert-section">
					<div class="recipe-insert-column">
						요리 과정
						<textarea class="form-control" rows="5" name="recipe_process" style="font-size:15px"></textarea>
					</div>
					<div class="recipe-insert-column" id="image_container1">
						과정 이미지 <input multiple="multiple" class="imageIndex" type="file"
						name="recipe_process_img_file" accept="image/*" onchange="setThumbnail(event, 1);">
					</div>
					<input type="hidden" name="recipe_process_sq" value="0">
					<div class="input-group-btn"> 
						<button class="btn btn-danger remove" type="button"><i class="glyphicon glyphicon-remove"></i></button>
					</div>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
	<!-- #### 요리 과정 카피 #### -->
	
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
						<input type="button" onclick="moveBasket()" value="예"/>
					</a>
					<input type="button" class="close" data-dismiss="modal" value="아니오"/>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->

	<script src="<c:url value ="/resources/js/recipe/recipe.js" />"></script>
    
</body>

</html>