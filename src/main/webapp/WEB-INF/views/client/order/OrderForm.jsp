<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<link rel="stylesheet" href="/shepe/resources/css/orderForm.css" type="text/css">
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/include/Nav.jsp" />

<div class="container">
	<section class="col">
		<div id="header">
			<h1 style="text-align:center; font-size:20px; line-height:24px; margin:0px;">결제하기</h1>
		</div>
		<hr>
		<form id="paymentForm" action="insertOrder" method="post">
			<div >
				<h3 class="order_title">
					<a href="#order_addr" data-toggle="collapse" data-target="#order_addr">배송지</a>
				</h3>
				<div id="order_addr" class="collapse show order_addr">
					<ul class="nav nav-tabs nav-justified" role="tablist">
						<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#def_addr">배송지 선택</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#new_addr">신규 입력</a></li>
					</ul>
					<div class="tab-content ord_inr">
						<div id="def_addr" class="container tab-pane active">
							<ul class="ord_tabm">
								<li>
									<div class="inf_view">
										<dl>
											<dt>${addressList[0].member_reciever }</dt>
											<dd>
												<ul>
													<li>
														<em>${addressList[0].member_phone }</em>
													</li>
												</ul>
											</dd>
											<dd>
												${addressList[0].member_address1 } ${addressList[0].member_address2 }
												<em></em>
											</dd>
										</dl>
										<a href="#"></a>
									</div>
								</li>
							</ul>
						</div>
						<div id="new_addr" class="table-responsive container tab-pane fade">
							<table class="table">
								<colgroup>
									<col width="70">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">
											<div>
												<strong>배송지명</strong>
											</div>
										</th>
										<td>
											<input type="text" class="form-control" placeholder="직접 입력하거나 선택하세요" 
													title="배송지명 입력" maxlength="50" name="delivery_name" value="">
										</td>
									</tr>
									<tr>
										<th scope="row">
											<div class="required">
												<strong>수령인</strong>
												<em></em>
											</div>
										</th>
										<td>
											<input type="text" class="form-control" title="수령인입력" name="receiver" placeholder="50자 이내로 입력하세요" >
										</td>
									</tr>
									<tr>
										<th scope="row">
											<div class="required">
												<strong>연락처</strong>
												<em>1</em>
											</div>
										</th>
										<td>
											<ul class="inp_phone">
												<li><input type="tel" class="form-control" title="휴대폰 첫째자리 입력" name="phone_first" maxlength="3" pattern="[0-9]*"></li>
												<li><input type="tel" class="form-control" title="휴대폰 둘째자리 입력" name="phone_second" maxlength="4" pattern="[0-9]*"></li>
												<li><input type="tel" class="form-control" title="휴대폰 셋째자리 입력" name="phone_third" maxlength="4" pattern="[0-9]*"></li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<div>
												<strong>연락처</strong>
												<em>2</em>
											</div>
										</th>
										<td>
											<ul class="inp_phone">
												<li><input type="tel" class="form-control" title="휴대폰 첫째자리 입력" name="subphone_first" maxlength="3" pattern="[0-9]*"></li>	
												<li><input type="tel" class="form-control" title="휴대폰 둘째자리 입력" name="subphone_second" maxlength="4" pattern="[0-9]*"></li>
												<li><input type="tel" class="form-control" title="휴대폰 셋째자리 입력" name="subphone_third" maxlength="4" pattern="[0-9]*"></li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<div class="required">
												<strong>배송지</strong>
												<em></em>
											</div>
										</th>
										<td>
											<div class="code">
												<input type="text" id="sample2_postcode" class="form-control" placeholder="우편번호">
												<a class="bt" onclick="sample2_execDaumPostcode()">주소검색</a>	
											</div>
											<div class="address">
												<input type="text" id="sample2_address" class="form-control" name="address" placeholder="주소"><br>
												<input type="text" id="sample2_detailAddress" class="form-control" name="detail_address" placeholder="상세주소">
												<input type="text" id="sample2_extraAddress" class="form-control" name="extra_address" placeholder="참고항목">
											</div>
											<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
											<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" 
											style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<h3 class="order_title">
					<a href="#order_info" data-toggle="collapse" data-target="#order_info">주문자<span class="summary">qwer</span></a>
				</h3>
				<div id="order_info" class="collapse">
					<dl>
						<dt>${member_nm }</dt>
						<dd><em>${member_phone }</em></dd>
						<dd><em>${member_email }@${member_domain }</em></dd>
					</dl>
				</div>
				<h3 class="order_title">
					<a href="#" data-toggle="collapse" data-target="#order_item">주문상품<span></span></a>
				</h3>
				<div id="order_item" class="collapse show">
					<c:forEach var="list" items="${orderList}" varStatus="status">
					<div class="order_list">
						<div class="order_recipe">
							<h4><a href="#">${list.recipe_nm}</a></h4>
						</div>
						<div class="order_item">
							<ul class="order_plst">
								<li>
									<div class="order_pdt">
										<a href="" class="thumb"><img title="상품이미지" alt="상품이미지" width="112" height="112" style="padding-right:10px"
													src="${pageContext.request.contextPath}/resources/img/cart-img/${list.ingredient_thumbName}" /></a>
										<dl>
											<dt>
												<a><span>${list.ingredient_nm }</span>
													<span>
														(수량 : "<em>${list.ingredient_cnt }</em>")
													</span>
												</a>
											</dt>
											<dd>
												<em class="sum">${ sum = list.ingredient_cnt * list.ingredient_price}</em>"원"
											</dd>
										</dl>
									</div>
								</li>
							</ul>
						</div>
					</div>
					</c:forEach>
				</div>
				<div class="multiple_area">
					<div class="total_price">
						<div class="title point_navercolor">총 주문금액</div>
						<p class="area"><span class="sum point_navercolor"><fmt:formatNumber value="${param.orderPriceSum }" pattern="#,###"/>원</span></p>
					</div>
				</div>
				<h3 class="order_title">
					<a href="#payment_info" data-toggle="collapse" data-target="#payment_info">결제수단</a>
				</h3>
				<div id="payment_info" class="collapse show panel-collapse">
					<div class="payment_error_info">
						<ul class="payment_list">
							<li class="payment">
								<input type="radio" id="paymentType_pay" class="paymentType" name="paymentType" data-payment="pay" value="pay" checked="checked" >
								<label for="paymentType_pay">페이 간편결제</label>
								<div class="pay_box" style="display:block;" data-payment="pay">
									<input type="radio" id="kakao_pay" class="pay" name="payType" value="KAKAO_PAY" checked="checked" >
									<label for="kakao_pay">
										<img src="${pageContext.request.contextPath}/resources/img/pay-img/payment_icon_yellow_small.png">
									</label>
									<input type="radio" id="naver_pay" class="pay" name="payType" value="NAVER_PAY">
									<label for="naver_pay">네이버 페이</label>
								</div>
							</li>
							<li class="payment">
								<input type="radio" id="paymentType_account" class="paymentType" name="paymentType" data-payment="account" value="account">
								<label for="paymentType_account">계좌 간편결제</label>
								<div class="pay_box" style="display:none;" data-payment="account">
									<input type="radio" id="remittance" class="cash" name="payType" value="REMITTANCE">
									<label for="remittance">무통장입금</label>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<h3 class="order_title">
					<a href="#payment_tot" data-toggle="collapse" data-target="#payment_tot">최종 결제금액
						<span class="summary"><em><fmt:formatNumber value="${param.orderPriceSum }" pattern="#,###"/></em>원</span>
					</a>
				</h3>
				<div id="payment_tot" class="collapse show payment_tot">
					<strong class="title">총 결제금액</strong>
					<p class="information">
						<em style="font-size:22px; color:#1088ed;"><fmt:formatNumber value="${param.orderPriceSum }" pattern="#,###"/></em>원
					</p>
				</div>
				<div>
					<div class="button_area">
						<button id="submitBtn" type="button" class="btn btn-success btn-block">
							<span><fmt:formatNumber value="${param.orderPriceSum }" pattern="#,###"/></span>원
							<span>결제하기</span>
						</button>
					</div>
				</div>
				<div>
					<div class="button_area row" style="display:none;">
						<div class="col-6"><button type="button" class="btn btn-success btn-block">확인</button></div>
						<div class="col-6"><button type="button" class="btn btn-danger btn-block">취소</button></div>
					</div>
				</div>
			</div>
		</form>
	</section>
</div>
<script>
$(".nav-link").click(function () {
	$("div#new_addr input").val("");
})

$("input[name=paymentType]").change(function () {
	var height = $(document).scrollTop();
	
	var data_val = $(this).data("payment");
	console.log(data_val);
	$(".pay_box").css("display","none");
	$("div[data-payment='"+data_val+"']").css("display", "block");
	console.log($("div[data-payment='"+data_val+"']>input:first"));
	$("div[data-payment='"+data_val+"']>input:first").prop("checked", true);
	
	if($(document).scrollTop() != height) {
		$(window).scrollTop(height);
	}
});

$("#submitBtn").on("click", function () {
	let orderIngredient = [];
	
	<c:forEach var="temp" items="${orderList}">
		orderIngredient.push(
			{
				"ingredient_no" : "${temp.ingredient_no}", 
				"ingredient_nm" : "${temp.ingredient_nm}", 
				"ingredient_cnt" : "${temp.ingredient_cnt}",
				"ingredient_price" : "${temp.ingredient_price}",
				"ingredient_thumbName" : "${temp.ingredient_thumbName}",
				"recipe_no" : "${temp.recipe_no}", 
				"recipe_nm" : "${temp.recipe_nm}"
			}
		);
	</c:forEach>
	
	if($("#new_addr").hasClass("show") == true) {
		if($("input[name=receiver]").val() == "") {
			alert("수령인을 입력하세요");
			return;
		}
		else if($("input[name=phone_first]").val() == "" || $("input[name=phone_second]").val() == "" || $("input[name=phone_third]").val() == "") {
			console.log($("input[name=phone_second]").val);
			alert("연락처1을 입력하세요");
			return;
		}
		else if($("input[name=address]").val() == "" || $("input[name=detail_address]").val() == "" || $("input[name=extra_address]").val() == "") {
			alert("주소를 입력하세요");
			return;
		}
	}
	else {
		$("input[name=receiver]").val("${addressList[0].member_reciever}");
		
		var strSplit = "${addressList[0].member_phone }".split('-');
		$("input[name=phone_first]").val(strSplit[0]);
		$("input[name=phone_second]").val(strSplit[1]);
		$("input[name=phone_third]").val(strSplit[2]);
		
		$("input[name=address]").val("${addressList[0].member_address1}");
		$("input[name=detail_address]").val("${addressList[0].member_address2}");
	}
	
	let ingreParam = JSON.stringify(orderIngredient);
	$("#paymentForm").append("<input type='hidden' name='orderIngredient' value='"+ingreParam+"'>");
	$("#paymentForm").append("<input type='hidden' name='orderPriceSum' value='"+${param.orderPriceSum}+"'>");
	$("#paymentForm").submit();

});

var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
    element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {

            var addr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("sample2_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample2_extraAddress").value = '';
            }

            document.getElementById('sample2_postcode').value = data.zonecode;
            document.getElementById("sample2_address").value = addr;
            document.getElementById("sample2_detailAddress").focus();

            element_layer.style.display = 'none';
        },
        width : '100%',
        height : '100%',
        maxSuggestItems : 5
    }).embed(element_layer);

    element_layer.style.display = 'block';

    initLayerPosition();
}

function initLayerPosition(){
    var width = 300; 
    var height = 400; 
    var borderWidth = 5;

    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}
</script>
</body>
</html>