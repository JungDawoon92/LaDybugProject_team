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
<h1>결제 실패</h1>

	카카오페이 결제가 정상적으로 취소되었습니다.
	 
	결제일시:     [${cancel.approved_at}]<br/>
	주문번호:    [${cancel.partner_order_id}]<br/>
	상품명:    [${cancel.item_name}]<br/>
	상품수량:    [${cancel.quantity}]<br/>
	결제금액:    [${cancel.amount.total}]<br/>
	결제방법:    [${cancel.payment_method_type}]<br/>
</div>

</body>
</html>