<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Delicious - Food Blog Template | Home</title>

<!-- Core Stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/recipeInsert.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
</head>
<body>
	<jsp:include page="/WEB-INF/include/adminNav.jsp" />	
	
	<!-- ##### insert form ##### -->
	<div>
		<section class="background">
			<div class="container">
				<form action="adminRecipeInsert.adre" method="post" enctype="multipart/form-data">
					<!-- #### 기본 정보 입력 #### -->
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="recipe-insert-back color col-sm-8">

							<div class="recipe-insert-title">레시피 등록하기</div>

							<div class="recipe-insert-section">
								<div class="recipe-insert-column" id="image_container0">
									완성 이미지 <input type="file" id="recipe_complete_img_file" name="recipe_complete_img_file"
									 accept="image/*" onchange="setThumbnail(event, 0);" required="required" />
								</div>
								
								<div class="recipe-insert-column">
									<input type="hidden" name="member_id"
										value="${sessionScope.member_id}" required="required" />
									<input type="hidden" name="member_nickname"
									 value="${sessionScope.nickname}" required="required" />
									레시피 제목
									<input type="text" class="form-control" name="recipe_nm"
									 required="required" style="font-size:15px" />
								</div>

								<div class="recipe-insert-column">
									레시피 설명
									<textarea class="form-control" rows="5" name="recipe_info" style="font-size:15px"></textarea>
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
								
								<div class="recipe-insert-column">
									몇 인분짜리 요리인가요?
									<input type="number" name="recipe_person" min="1" max="20"
									 value="1"  required="required"/>인분
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
									<div class="recipe-insert-column">
										식재료 등록
										<div class="clearfix"></div>
										<select id="ingredient-caregory0" onchange="ingredient_unit(0)">
											<option value="">분류</option>
											<option value="육류">육류</option>
											<option value="해물류">해물류</option>
											<option value="과일/채소">과일/채소</option>
											<option value="견과류">견과류</option>
											<option value="기타">기타</option>
										</select><br>
										<input type="text" class="form-control ingre" id="ingreName0" name="ingredient_nm"
										 placeholder="예) 돼지고기"  required="required" min="2"/>
										<input type="text" class="form-control ingre" id="ingreUnit0" name="recipeIngre_cnt"
										 placeholder="예) 300g" required="required" />
										<span id="ingredient_unit0">
											(단위 : g)
										</span>
										<div class="clearfix"></div>
										<hr>
									</div>
									
									<div class="last-ingre"> 
										<button class="btn btn-success add-ingre" type="button"><i class="glyphicon glyphicon-plus"></i></button>
									</div>
								</div>
							</div>
							<div class="col-sm-2"></div>
						</div>
					</div>
					<!-- #### 레시피 식재료 #### -->
					
					
					<!-- #### 요리 과정 #### -->
					<div class="imageUpload">
						<input type="hidden" class="imgIndex" value="1">
						<div class="row process" id="process1">
							<div class="col-sm-2"></div>
							<div class="recipe-insert-back color col-sm-8">
								<div class="recipe-insert-section">
									<div class="recipe-insert-column">
										요리 과정
										<textarea class="form-control" rows="5" name="recipe_process"
										 required="required" style="font-size:15px"></textarea>
									</div>
									<div class="recipe-insert-column" id="image_container1">
										과정 이미지 <input multiple="multiple" type="file" name="recipe_process_img_file" accept="image/*" onchange="setThumbnail(event, 1);">
									</div>
									<div class="rightIcon">
										<i class="glyphicon glyphicon-chevron-up" id="up1" onclick="processUp(1)"></i>
										<i class="glyphicon glyphicon-chevron-down" id="down1" onclick="processDown(1)"></i>
									</div>
								</div>
							</div>
							<div class="col-sm-2"></div>
						</div>
						
						<!-- 여기에 카피 등록됨 -->
						<div class="last"></div>
						
					</div>
					<!-- #### 요리 과정 #### -->
					
					<!-- #### 레시피 등록 #### -->
					<div class="row">
						<div class="col-sm-2"></div>
						<div class="recipe-insert-back color col-sm-8">
							<div class="recipe-insert-section">
								<div class="recipe-insert-column buttonCenter">
									<div class="row buttonCenter">&nbsp;&nbsp;
										<button type="button" class="btn btn-success btn-block col-sm-3 add-more">과정 추가</button>
										<div class="col-sm-1"></div>
										<button type="reset" class="btn btn-warning btn-block col-sm-3">초기화</button>
										<div class="col-sm-1"></div>
										<button type="submit" class="btn btn-primary btn-block col-sm-3">등록</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<!-- #### 레시피 등록 #### -->
				</form>
				
				<!-- 식재료 카피 -->
				<div class="copy-ingre hide">
					<div class="recipe-insert-column control-group-ingre">
						<div class="clearfix"></div>
						<select id="ingredient-caregory0">
							<option value="">분류</option>
							<option value="육류">육류</option>
							<option value="해물류">해물류</option>
							<option value="과일/채소">과일/채소</option>
							<option value="견과류">견과류</option>
							<option value="기타">기타</option>
						</select><br>
						<input type="text" class="form-control ingre" id="ingreName0" name="ingredient_nm"
						 placeholder="예) 양파"  required="required" min="2"/>
						<input type="text" class="form-control ingre" id="ingreUnit0" name="recipeIngre_cnt"
						 placeholder="예) 1개" required="required" />
						<span id="ingredient_unit0">
							(단위 : 개)
						</span>
						<div class="clearfix"></div>
						<button class="btn btn-danger remove-ingre" type="button"><i class="glyphicon glyphicon-remove"></i></button>
						<hr>
					</div>
				</div>
				<!-- 식재료 카피 -->
				<!-- #### 요리 과정 카피 #### -->
				<div class="copy hide">
					<div class="row control-group process" id="process1">
						<div class="col-sm-2"></div>
						<div class="recipe-insert-back color col-sm-8">
							<div class="recipe-insert-section">
								<div class="recipe-insert-column">
									요리 과정
									<textarea class="form-control" rows="5" name="recipe_process" style="font-size:15px"></textarea>
								</div>
								<div class="recipe-insert-column" id="image_container1">
									과정 이미지 <input multiple="multiple" class="imageIndex" type="file"
									 name="recipe_process_img_file" accept="image/*" onchange="setThumbnail(event, 2);">
								</div>
								<div class="rightIcon" id="processMove1">
									<button class="btn btn-danger remove left" type="button"><i class="glyphicon glyphicon-remove"></i></button>
									<i class="glyphicon glyphicon-chevron-up" id="up1" onclick="processUp(1)"></i>
									<i class="glyphicon glyphicon-chevron-down" id="down1" onclick="processDown(1)"></i>
								</div>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
				<!-- #### 요리 과정 카피 #### -->
			
			</div>
		</section>
	</div>

	<script src="<c:url value ="/resources/js/recipe/recipe.js" />"></script>
    
</body>

</html>