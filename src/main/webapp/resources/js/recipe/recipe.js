// 식재료 늘리기 / 줄이기
$(document).ready(function() {
	$(".add-ingre").click(function() {
		var ingreIndex = 0;
		var ingreIndexB = ingreIndex;
		ingreIndex++;
		$('.copy-ingre #ingredient-caregory'+ingreIndexB).attr('onchange', 'ingredient_unit('+ingreIndex+')');
		$('.copy-ingre #ingredient-caregory'+ingreIndexB).attr('id', 'ingredient-caregory'+ingreIndex);
		$('.copy-ingre #ingredient_unit'+ingreIndexB).attr('id','ingredient_unit'+ingreIndex);
		$('.copy-ingre #ingreName'+ingreIndexB).attr('id','ingreName'+ingreIndex);
		$('.copy-ingre #ingreUnit'+ingreIndexB).attr('id','ingreUnit'+ingreIndex);
		var recipeingre = $(".copy-ingre").html();
		$(".last-ingre").before(recipeingre);
		
	});
	$("body").on("click", ".remove-ingre", function() {
		$(this).parents(".control-group-ingre").remove();
	});
});


// 요리과정 늘리기 / 줄이기
$(document).ready(
		function() {
			$(".add-more").click(
					function() {
						var index = $('.imgIndex').last().val();
						var indexBefore = index;
						index++;
						
						$('.copy #image_container1').attr("id",
								"image_container"+indexBefore);
						
						$(".copy .imageIndex").attr('onchange',
								"setThumbnail(event," + index + ");");
						
						$('.copy #image_container'+indexBefore).attr("id",
								"image_container"+index);
						$('.imgIndex').val(index);
						
						$('.copy #process'+indexBefore).attr("id",
								'process'+index);
						
						$('.copy #processMove'+indexBefore).attr("id",
								'processMove'+index);
						
						$('.copy #up'+indexBefore).attr("id",
								'up'+index);
						$('.copy #down'+indexBefore).attr("id",
								'down'+index);
						$('.copy #up'+index).attr("onclick",
								'processUp('+index+')');
						$('.copy #down'+index).attr("onclick",
								'processDown('+index+')');
						
						var recipeProcess = $(".copy").html();
						$(".last").before(recipeProcess);
					});
			$("body").on("click", ".remove", function() {
				$(this).parents(".control-group").remove();
			});
		});

// 이미지 미리보기
function setThumbnail(event, i) {
	var reader = new FileReader();

	var img = document.createElement("img");
	reader.onload = function(event) {
		img.setAttribute("src", event.target.result);
		img.style.width = '250px';
		$(".index" + i).remove();
		$(".originalImg" + i).remove();
		img.setAttribute("class", "index" + i);
	};
	$("#image_container"+i).append(img);
	reader.readAsDataURL(event.target.files[0]);
}

// 장바구니 페이지 이동 결정
function moveBasket() {
	var form1 = document.basketInsert;
	document.getElementById("where").value = 'basket';
	form1.submit();
}
function moveRecipe() {
	var form2 = document.basketInsert;
	document.getElementById("where").value = 'recipe';
	form2.submit();
}

// 장바구니 체크박스
$(".checkBasketClass").change(function() {
	if ($("#checkBasket" + $(this).val()).is(":checked")) {
		$("#check" + $(this).val()).val('true');
		priceTotal();
	} else {
		$("#check" + $(this).val()).val('false');
		priceTotal();
	}
});

// 장바구니 바로 구매하기
$(document).ready(function(){
	$(".orderRecipeButton").on("click", function(){ 
    	var list = new Array();
    	for (var i = 0; i <= $('.checkBasketClass').last().val(); i++) {
    		if ($("#check" + i).val() == "true") {
    			var map = {
    	    			ingre_no : $(".ingredient_no" + i).val(),
    	    			ingre_cnt : $(".ingredient_cnt" + i).val(),
    	    			recipe_no : $(".recipe_no" + i).val(),
    	    			recipe_nm : $(".recipe_nm" + i).val()
    	    		};
    	    		list.push(map);
			}
    	}
    	let json = JSON.stringify(list);
    	$("input[name=order]").val(json);
    	$("[name=basketInsert]").attr("action", "orderForm");
    	$("[name=basketInsert]").submit();

    });
});

// 상품 가격 표시
$("[name=ingredient_cnt]").change(function() {
	priceSum();
	priceTotal();
});

// 총 합계 함수 호출
$(document).ready(function(){
	defaultCnt();
	priceSum();
	priceTotal();
});

// 상품 가격 표시 함수
function priceSum(){
	for (var i = 0; i <= $('.checkBasketClass').last().val(); i++) {
		if ($("#check" + i).val() == "true") {
			var cnt = $('.ingredient_cnt'+i).val();
			var price = $(".ingredient_price" + i).val();
			
			var total = cnt * price;
			$('#totalPrice'+i).text("합계 : "+total+"원");
			priceTotal();
		}
	}
}

// 총 합계 함수
function priceTotal(){
	var res;
	var total = 0;
	for (var i = 0; i <= $('.checkBasketClass').last().val(); i++) {
		if ($("#check" + i).val() == "true") {
			var str = $('#totalPrice'+i).text(); // 가격 가져오기
			res = str.replace(/[^0-9]/g,""); // 숫자만 추출
			var price = Number(res); // number로 변환
			total = total + price; // 합계
			ingredient_amt(i); // 재고 체크
		}
	}
	$('#totalPrice').text("총 합계 : "+total+"원");
}


// 갯수 디폴트값 셋팅
function defaultCnt(){
	for (var i = 0; i <= $('.checkBasketClass').last().val(); i++) {
		$('.ingredient_cnt'+i).val(defaultCntFunc(i));
	}
}

// 인원수 늘리기
function personUp(){
	var before = $('span.recipe_person').text(); // 인원수 get
	var res = before.replace(/[^0-9]/g,""); // 스트링 제거
	var beforePerson = Number(res); // 숫자 변환
	
	var afterPerson = beforePerson + 1;
	var stringAfter = String(afterPerson);
	var after = "(" + stringAfter + " 인분)"
	$('span.recipe_person').text(after);
	
	var originalPerson = $('.original_person').val();
	
	for (var i = 0; i <= $('.checkBasketClass').last().val(); i++) {
		if ($("#check" + i).val() == "true") {
			var ingredientCnt = defaultCntFunc(i);
			var div = ingredientCnt / originalPerson;
			var result = Math.ceil(div * afterPerson);
			$('.ingredient_cnt'+i).val(result);
			priceSum();
			priceTotal();
		}
	}
}

//인원수 내리기
function personDown(){
	var before = $('span.recipe_person').text(); // 인원수 get
	var res = before.replace(/[^0-9]/g,""); // 스트링 제거
	var beforePerson = Number(res); // 숫자 변환
	
	if(beforePerson > 1){
		var afterPerson = beforePerson - 1;
		var stringAfter = String(afterPerson);
		var after = "(" + stringAfter + " 인분)"
		$('span.recipe_person').text(after);
		
		var originalPerson = $('.original_person').val();
		
		for (var i = 0; i <= $('.checkBasketClass').last().val(); i++) {
			if ($("#check" + i).val() == "true") {
				var ingredientCnt = defaultCntFunc(i);
				var div = ingredientCnt / originalPerson;
				var result = Math.ceil(div * afterPerson);
				$('.ingredient_cnt'+i).val(result);
				priceSum();
				priceTotal();
			}
		}
	}
}

//갯수 디폴트값 셋팅
function defaultCntFunc(i){
	var ingreValue = $('.ingredient_weight'+i).val(); // 식재료 단위 get
	var res1 = ingreValue.replace(/[^0-9]/g,""); // 스트링 제거
	var ingrePrice = Number(res1); // 숫자 변환
		
	var recipeValue = $('.recipeingre_cnt'+i).val(); // 레시피 수량 get
	var res2 = recipeValue.replace(/[^0-9]/g,""); // 스트링 제거
	var recipePrice = Number(res2); // 숫자 변환
		
	if (ingrePrice <= recipePrice){
		var div = recipePrice / ingrePrice;
		var sum = Math.ceil(div);
		return sum;
	} else if (ingrePrice > recipePrice){
		return 1;
	}
}

// 재고 부족 함수
function ingredient_amt(i){
	var cnt = Number($('.ingredient_cnt'+i).val()); //선택 수량
	var amt = Number($('.ingredient_amt'+i).val()); //재고
	var text = '재고가 '+ amt + '개 남았습니다.'
	if(cnt >= amt){ //재고 부족, 같음
		$('.ingredient_cnt'+i).val(amt);
		$('.ingredientLack'+i).text(text);
	}
}

//식재료 분류하기
function ingredient_unit(i){
	var val = $('#ingredient-caregory'+i).val();
	if (val == "육류"){
		$('#ingreName'+i).attr('placeholder', '예) 삼겹살');
		$('#ingreUnit'+i).attr('placeholder', '예) 100g');
		$('#ingredient_unit'+i).text('(단위 : g)');
	} else if(val == "해물류"){
		$('#ingreName'+i).attr('placeholder', '예) 오징어');
		$('#ingreUnit'+i).attr('placeholder', '예) 1마리');
		$('#ingredient_unit'+i).text('(단위 : 마리)');
	} else if(val == "과일/채소"){
		$('#ingreName'+i).attr('placeholder', '예) 양파');
		$('#ingreUnit'+i).attr('placeholder', '예) 1개');
		$('#ingredient_unit'+i).text('(단위 : 개)');
	} else if(val == "견과류"){
		$('#ingreName'+i).attr('placeholder', '예) 땅콩');
		$('#ingreUnit'+i).attr('placeholder', '예) 50g');
		$('#ingredient_unit'+i).text('(단위 : g)');
	} else if(val == "기타"){
		$('#ingreName'+i).attr('placeholder', '예) 두부');
		$('#ingreUnit'+i).attr('placeholder', '예) 1모');
		$('#ingredient_unit'+i).text('(단위 : 개)');
	}
}

// 과정 올리기
function processUp(i){
	if(i>0){
		var eq = $('#process'+i).index(); // 클릭한 태그의 div의 index(1부터)
		var eqBefore = eq-2; // 앞 태그 순서 (0부터 시작하므로 -2)
		var select = $('.process').eq(eqBefore).attr("id"); // 앞 태그의 id값
		if(eqBefore>-1){
			$('#process'+i).insertBefore($('#'+select));
		}
	}
}

//과정 내리기
function processDown(i){
	var eq = $('#process'+i).index(); // 클릭한 태그의 div순서
	var select = $('.process').eq(eq).attr("id"); // 앞 태그의 id값
	$('#process'+i).insertAfter($('#'+select));
}

