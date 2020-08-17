<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/include/Nav.jsp" />

<div class="container border wrapper">
	카카오페이 결제가 정상적으로 완료되었습니다.
	 
	결제일시:     [${paymentInfo.approved_at}]<br/>
	주문번호:    [${paymentInfo.partner_order_id}]<br/>
	상품명:    [${paymentInfo.item_name}]<br/>
	상품수량:    [${paymentInfo.quantity}]<br/>
	결제금액:    [${paymentInfo.amount.total}]<br/>
	결제방법:    [${paymentInfo.payment_method_type}]<br/>

	<a href="/shepe/myPage/orderHistory" role="button">결제 내역 확인</a>
</div>

</body>
</html>