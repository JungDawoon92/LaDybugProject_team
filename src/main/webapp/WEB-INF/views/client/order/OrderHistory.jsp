<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/shepe/resources/css/orderHistory.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<div class="container border wrapper">
      <jsp:include page="/WEB-INF/include/myPageMenu.jsp" />
		<section>
			<div>
				<article>
					<div class="order_content">
						<div class="order_list">
							<ul>
							<c:forEach var="list" items="${orderHistory}">
								<li>
									<div>
										<div class="order_top">
											<span class="type">구매완료</span>
											<span class="date">${list.order_ymd }</span>
											<a href="#" class="detail">주문상세</a>
										</div>
										<div class="order_center">
											<div class="info">
												<a>
													<div class="item_name">
														${list.orderIngreVOs[0].recipe_nm }
														<c:if test="${list.orderIngreVOs.size() ne '1'}">
															외 ${otherCnt = list.orderIngreVOs.size() - 1}
														</c:if>
														<span class="price"><fmt:formatNumber value="${list.order_sum }" pattern="#,###"/>원</span>
													</div>
												</a>
											</div>
										</div>
										<div class="order_bottom">
										</div>
									</div>
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</article>
			</div>
		</section>
	</div>
<script type="text/javascript">
$(document).ready(function () {
	$("#paymentHistory").css('color', 'black');
})
</script>
</body>
</html>