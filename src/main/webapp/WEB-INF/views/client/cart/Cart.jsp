<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<link rel="stylesheet" href="/shepe/resources/css/cart.css" type="text/css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>
<jsp:include page="/WEB-INF/include/Nav.jsp" />

<div class="container border">
	<section class="cart col">
		<div class="check_all_box col">
			<input type="checkbox" id="check_all" class="check_all" onclick="checkAll()" checked>
			<label for="check_all" class="custom-control-input">상품 전체선택</label>
			<button type="button" class="check_del btn" onclick="checkDel()">선택삭제</button>
		</div>
		<div class="cart_box col border">
			<ul>
				<c:forEach var="list" items="${cartList}" varStatus="status">
				<li data-cart_sq="${list.cart_sq }">
					<div class="row border">
						<div class="item_head col-10 col-md-11 border">${list.recipe_nm }</div>
						<div class="select_del_box col-1 border">
							<button type="button" class="btn btn-light text-secondary" data-cart_sq="${list.cart_sq }" onclick="selectDel(${list.cart_sq })">
							<i class="fas fa-close" ></i></button>
						</div>
					</div>
					<div class="item_box col border">
						
							<div class="item_box row border">
								<div class="check_box border">
									<input type="checkbox" id="check_box" class="check_one" 
									data-cart_sq="${list.cart_sq }" data-ingredient_no="${list.ingredient_no }" width="100" checked>
									<label for="check_one" class="blind"></label>
								</div>
								<div class="item_img border">
									<img title="상품이미지" alt="상품이미지" width="112" height="112" style="padding-right:10px"
									src="${pageContext.request.contextPath}/resources/img/cart-img/${list.ingredient_thumbName}" />
								</div>
								<div class="item_body col-6 border">
									<div class="item_name_box col-12">
										<span>${list.ingredient_nm }</span>
									</div>
									<div class="input_cnt_box col-12 border">
										<button type="button" id="minus_btn" class="minus_btn btn btn-light text-secondary" data-cart_sq="${list.cart_sq }"
										  onclick="minusBtn(${list.cart_sq })" style="touch-action:manipulation">
											<i class="fas fa-minus" ></i>
										</button>
										<div class="input_cnt bg-light border" data-cart_sq_cnt="${list.cart_sq }">${list.ingredient_cnt }</div>
										<button type="button" id="plus_btn" class="plus_btn btn btn-light text-secondary" data-cart_sq="${list.cart_sq }"
										  onclick="plusBtn(${list.cart_sq })" style="touch-action:manipulation">
											<i class="fas fa-plus" ></i>
										</button>
									</div>
									<div class="select_cnt_box col-12 border">
										<em><fmt:formatNumber value="${list.ingredient_price }" pattern="#,###"/></em>원
									</div>
								</div>
							</div>
						
					</div>
					<c:set var="ingre_PriceSum" value="${ sum = list.ingredient_cnt * list.ingredient_price}" />
					<div class="money_box col border">
						<div class="col-12" style="padding-right:0px;">
							<span>상품금액</span>
							<span style="float:right">
								<em id="price_sum" data-cart_sq="${list.cart_sq }"  
								data-ingre_PriceSum="${ingre_PriceSum }"><fmt:formatNumber value="${ ingre_PriceSum}" pattern="#,###"/></em>원
							</span>
						</div>
					</div>
					<div style="clear:both;"></div>
				</li>
				<c:set var="total" value="${total = total + sum}" />
				</c:forEach>
			</ul>
		</div>
		<div>
			<div class="total_price border">
				<span>총 결제금액</span>
				<span class="total_pay"><strong><em id="total_pay"><fmt:formatNumber value="${total }" pattern="#,###"/></em>원</strong></span>
			</div>
			<div>
				<form action="orderForm" method="post">
					<input type="hidden" name="orderPriceSum" value="${total }">
					<input type="hidden" name="order" value="">
					<button type="submit" class="btn btn-success btn-block" onclick="paySubmitCheck()">결제</button>	
				</form>				
			</div>
		</div>
	</section>
</div>
<script type="text/javascript">
function paySubmitCheck() {
	if($(".cart_box").val() == null){
		alert('장바구니에 상품이 없습니다.');
		event.preventDefault();
	}
	else {
		let checkArr = [];
		var priceSum = 0;
		$("input[id=check_box]:checked").each(function() {
			var no = $(this).attr("data-ingredient_no");
			var sq = $(this).attr("data-cart_sq");
			var cnt = $("div[data-cart_sq_cnt='" +sq+ "']").text();
			priceSum += parseInt(removeComma($("em[data-cart_sq='" +sq+ "']").text()));
	    	checkArr.push({"ingre_no" : no, "ingre_cnt" : cnt});
	    });	
		if(!checkArr.length ) {
			alert('선택된 상품이 없습니다.');
			event.preventDefault();
		}
		else {
			let json = JSON.stringify(checkArr);
			$("input[name=order]").val(json);
			$("input[name=orderPriceSum]").val(priceSum);
		}
		
	}
}

function checkAll() {
    if ($("#check_all").is(':checked')) {
        $("input[type=checkbox]").prop("checked", true);
    } else {
        $("input[type=checkbox]").prop("checked", false);
    }
    checkBoxTotalPrice();
}

$(".check_one").click(function() {
	$("#check_all").prop("checked", false);
	checkBoxTotalPrice();
});

function checkBoxTotalPrice() {
	var tempPrice = 0;
    $("input[id=check_box]:checked").each(function() {
    	var i = $(this).attr("data-cart_sq");
    	tempPrice = tempPrice + removeComma($("em[data-cart_sq='"+i+"']").text());
    });
    $("#total_pay").text(numberWithCommas(tempPrice));
    $("input[name=order_sum]").val(tempPrice);
}

function checkDel() {
	start = new Date().getTime();
	if(confirm("삭제하시겠습니까?")){
		var checkArr = new Array();
	    $("input[id=check_box]:checked").each(function() {
	    	checkArr.push($(this).attr("data-cart_sq"));
	    });	
	    
	    if(!checkArr.length)
	    	return false;
	    
	    var params = {
	    	checkBox : checkArr
	    }
	    
	    cartDelAjax(params, checkCartDelView, calcTotal);
	    
	} else{
	    return false;
	}
	
	elapsed = new Date().getTime() - start;
	console.log(true, "소요된 시간: " + elapsed);
}

function checkCartDelView(idx) {
	$("input[id=check_box]:checked").each(function () {
		var i = $(this).data("cart_sq");
		var delBox = $("li[data-cart_sq='"+i+"']");
		var tempSum = $("em[data-cart_sq='"+i+"']").data("ingre_PriceSum");
		delBox.remove();
		return true;
	});
}

function selectDel(sq) {
	start = new Date().getTime();
	if(confirm("삭제하시겠습니까?")) {
		var checkArr = new Array();
		checkArr.push(parseInt(sq));
		
		var params = {
		    checkBox : checkArr
		}
		
		cartDelAjax(params, selectCartDelView(sq), calcTotal);

	} else{
	    return false;
	}
	
	elapsed = new Date().getTime() - start;
	console.log(true, "소요된 시간: " + elapsed);
}

function selectCartDelView(sq) {
	$("li[data-cart_sq='"+sq+"']").remove();
	
}


function cartDelAjax(params, callbackView, calcTotalCallback) {
	$.ajax({
		url: 'deleteCart',
	    type: 'POST',
	    data: JSON.stringify(params),
	    contentType: "application/json; charset=utf-8;",
	    dataType: "json",
	    success : function (data) {
	    	console.log("저장 성공");
	    	if(callbackView){
	    		callbackView();
	    	}
	    	if(calcTotalCallback){
	    		calcTotal(data);
	    	}
	    },
	    error: function () {
	        alert("fail");
	    }
	});
}
function minusBtn(sq){
	start = new Date().getTime();

	var cnt = $("div[data-cart_sq_cnt='"+sq+"']").text();
	if(parseInt(cnt) == 1) {
		return;
	}
	cnt = parseInt(cnt) - 1;
	cntBtnAjax(cnt, sq, calcPrice, calcTotal);
	
	elapsed = new Date().getTime() - start;
	console.log(true, "소요된 시간: " + elapsed);
}
function plusBtn(sq) {
	start = new Date().getTime();
	
	var cnt = $("div[data-cart_sq_cnt='"+sq+"']").text();
	if(parseInt(cnt) == 9) {
		return;
	}
	cnt = parseInt(cnt) + 1;
	cntBtnAjax(cnt, sq, calcPrice, calcTotal);
	
	elapsed = new Date().getTime() - start;
	console.log(true, "소요된 시간: " + elapsed);
}


function cntBtnAjax(cnt, sq, calcPrice, calcTotal) {
	var params = {
		cart_sq : parseInt(sq),
		ingredient_cnt : cnt
	}
	$.ajax({
		url: 'updateCartCnt',
	    type: 'POST',
	    data: JSON.stringify(params),
        contentType: "application/json; charset=utf-8;",
        dataType: "json",
	    success : function (data) {
	    	console.log("저장 성공");
	    	if(calcPrice){
	    		calcPrice(data, sq);
	    	}
	    	if(calcTotal){
	    		calcTotal(data);
	    	}
	        
	    },
	    error: function () {
	        alert("fail");
	    }
	});
}

function calcPrice(data, sq) {
	var ing_cnt = 0; var ing_price = 0;
	for(var i = 0; i < data.length; i++ ) {
		if(data[i].cart_sq == sq) {
			ing_cnt = data[i].ingredient_cnt;
			ing_price = data[i].ingredient_price;
			$("div[data-cart_sq_cnt='"+sq+"']").text(ing_cnt);
			$("em[data-cart_sq='"+sq+"']").text(numberWithCommas(ing_cnt * ing_price));
		}
	}
}

function calcTotal(data) {
	var total = 0;
	for(var i = 0; i < data.length; i++ ) {
		total += data[i].ingredient_cnt * data[i].ingredient_price;
	}
	$("#total_pay").text(numberWithCommas(total));
}
	
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function removeComma(str2)
{
	var n = parseInt(str2.replace(/,/g, ""));
	if (isNaN(n)) {
        return 0;
    }
    else {
        return n;
    }
}
</script>
</body>
</html>