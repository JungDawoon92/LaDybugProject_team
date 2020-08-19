<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
카카오페이 주문내역
 
결제일시:     [[${History.approved_at}]]<br/>
주문번호:    [[${History.partner_order_id}]]<br/>
상품명:    [[${History.item_name}]]<br/>
상품수량:    [[${History.quantity}]]<br/>
결제금액:    [[${History.amount.total}]]<br/>
결제방법:    [[${History.payment_method_type}]]<br/>
 
<h2>[[${History}]]</h2>
</body>
</html>