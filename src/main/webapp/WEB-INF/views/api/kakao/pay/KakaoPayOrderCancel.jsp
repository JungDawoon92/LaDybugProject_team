<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
카카오페이 결제가 정상적으로 취소되었습니다.
 
결제일시:     [[${Cancel.approved_at}]]<br/>
주문번호:    [[${Cancel.partner_order_id}]]<br/>
상품명:    [[${Cancel.item_name}]]<br/>
상품수량:    [[${Cancel.quantity}]]<br/>
결제금액:    [[${Cancel.amount.total}]]<br/>
결제방법:    [[${Cancel.payment_method_type}]]<br/>
 
 
 
<h2>[[${Cancel}]]</h2>
</body>
</html>