<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	<title>회원 리스트 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.root {
	width: 100%;
	text-align: center;
}

.container {
	display: inline-block;
}

table {
	border-spacing: 15px;
}

#paging {
	list-style: none; 
	float: center; 
	padding: 6px;
	justify-content: center;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
	<body>
	<jsp:include page="/WEB-INF/include/adminNav.jsp"></jsp:include>
		<div class="root">
				<h1>회원 리스트</h1>
			<hr />
			<div class="container">			
			
				<table class="table table-hover">
					<tr>
						<th>회원번호</th>
						<th>이    름</th>
						<th>닉 네 임</th>
						<th>아 이 디</th>
					</tr>					
					<c:forEach items="${list}" var = "list">
						<tr>
							<td><c:out value="${list.member_sq}" /></td>
							<td><c:out value="${list.member_nm}" /></td>
							<td><c:out value="${list.member_nickname}" /></td>
								<td><a href="#${list.member_id}" data-toggle="collapse" data-target="#${list.member_id}">${list.member_id}</a>
									<div id="${list.member_id}" class="collapse">
										<table>
											<colgroup>
												<col width="40%" />
												<col width="40%" />
												<col width="50%" />
												<col width="60%" />
												<col width="60%" />
											</colgroup>
											<tr>
												<th>생년월일</th>
												<th>전화번호</th>
												<th>이 메 일</th>
												<th>수    정</th>
												<th>삭    제</th>
											</tr>
											<tr>
												<td><fmt:formatDate value="${list.member_birth}" pattern="yyyy-MM-dd"/></td>
												<td><c:out value="${list.member_phone}" /></td>
												<td><c:out value="${list.member_email}@${list.member_email_domain}" /></td>
												<td><button type="submit" class="btn btn-info" onclick="location.href='adminUpdateView.ad?sq=${list.member_sq}'">수정</button></td>
												<td><button type="button" id="btn-del" class="btn btn-danger" data-toggle="modal" data-target="#myModal">삭제</button></td>
											</tr>
										</table>
									</div>
								</td>						
							</tr>
							  <!-- The Modal -->
							  <div class="modal" id="myModal">
							    <div class="modal-dialog">
							      <div class="modal-content">
							      
							        <!-- Modal Header -->
							        <div class="modal-header">
							          <h4 class="modal-title">회원 삭제</h4>
							          <button type="button" class="close" data-dismiss="modal">&times;</button>
							        </div>
							        
							        <!-- Modal body -->
							        <div class="modal-body">
							          위 회원을 정말로 삭제하시겠습니까?
							        </div>
							        
							        <!-- Modal footer -->
							        <div class="modal-footer">
							          <button type="button" class="btn btn-danger" onclick="location.href='adminDelete.ad?sq=${list.member_sq}'">삭제</button>
							          <button type="button" class="btn btn-info" data-dismiss="modal">취소</button>
							    	</div>
							  	  </div>
				    		    </div>
				    	      </div>
					</c:forEach>					
				</table>
				<!-- 페이징 -->
				<div>
				  <ul id="paging" class="pagination">
				    <c:if test="${pageMaker.prev}">
				    	<li class="page-item"><a class="page-link" href="list${pageMaker.makeQueryPage(pageMaker.startPage - 1)}">이전</a></li>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li class="page-item"><a class="page-link" href="list${pageMaker.makeQueryPage(idx)}">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<li class="page-item"><a class="page-link" href="list${pageMaker.makeQueryPage(pageMaker.endPage + 1)}">다음</a></li>
				    </c:if> 
				  </ul>
				  <!-- end 페이징 -->
				</div>
			</div>
		<hr />		
	</div>
</body>
</html>