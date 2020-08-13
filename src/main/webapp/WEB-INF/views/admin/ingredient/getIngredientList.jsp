<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 목록</title>
<style type="text/css">
body {
	text-align: center;
	width: 100%;
}

table {
	border-spacing: 0px;
	border-collapse: 0px;
	border: 1px solid;
	border-width: 700;
	margin: auto;
}

td {
	border: 1px;
}

#tableHead th {
	text-align: center;
	background-color: orange;
}

.btn {
	margin-top: 7px;
}

img {
	width: 100px;
	height: 100px;
	margin-bottom: 15px;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<body>
<jsp:include page="/WEB-INF/include/adminNav.jsp" />
	<h1>식재료 리스트페이지 입니다.</h1>
	<a href="ingredientChart.co" class="btn btn-success">그래프 보깅</a>
	<form id="sexy" onsubmit="return false">  <!--action="getIngredientList.co" method="post"--> 
		<table>
			<tr>
				<td align="right">
				<select name="ingredient_searchCondition" id="ingredient_searchCondition"/>
					<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}">${option.key}
					</c:forEach>
				</select> 
				<input name="ingredient_searchKeyword" type="text" id="ingredient_searchKeyword" onkeypress="javascript:if(event.keyCode==13){comeOn();}" /> 
				<input type="button" value="검색" onclick="comeOn();"/></td>
			</tr>
		</table>
	</form>
	
<div class="container">
	<table id="addList" class="table table-bordered">
		<thead id ="tableHead">총 데이타는${listCount}개 있습니다.
			<tr>
				<th width="150">식재료 썸네일</th>
				<th width="150">식재료 번호</th>
				<th width="150">식재료 이름</th>
				<th width="150">식재료 카테고리</th>
				<th width="150">식재료 가격</th>
				<th width="150">식재료 수량</th>
				<th width="150"></th>
			</tr>
		</thead>
			<tbody id="listData">
			</tbody> 
	</table>
	<c:if test="${listCount gt 10}">
		<div id="more_btn_div" align="center">
			<a class='btn btn-info' type="button" id="addBtn" href="#addBtn">더보기(More)</a>
			<a class='btn btn-info' type="button" id="subBtn" href=#listData>감추기(sub)</a>
		</div>
	</c:if>
</div>
	<br>
	<a href="adminInsert.co">식재료 등록</a>
	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
	<script
		src="<c:url value ="/resources/js/jquery/jquery-2.2.4.min.js" />"></script>
	<!-- Popper js -->
	<script src="<c:url value ="/resources/js/bootstrap/popper.min.js" />"></script>
	<!-- Bootstrap js -->
	<script
		src="<c:url value ="/resources/js/bootstrap/bootstrap.min.js" />"></script>
	<!-- All Plugins js -->
	<script src="<c:url value ="/resources/js/plugins/plugins.js" />"></script>
	<!-- Active js -->

	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
<script type="text/JavaScript">
$(document).ready(function() {
	var page = 1;
	listData(page);

	$('#addBtn').click(function() {
		page++;
		listData(page);
	});

	$('#subBtn').click(function() {
		$("#listData").empty();
		page = 1;
		listData(page);
	});
});

function comeOn() {
	$("#listData").empty();
	$.ajax({
		url: "ajaxIngredientList.co",
		type: "get",
		dataType: "JSON",
		data : {ingredient_searchKeyword : $("#ingredient_searchKeyword").val(),
					ingredient_searchCondition : $("#ingredient_searchCondition").val() },
		success : function(data) {
			
			$.each(data, function(index, value) {
				var row = "";
				var price = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(value.ingredient_price);
				var condition = value.ingredient_searchCondition;
				var keyword = value.ingredient_searchKeyword;
				console.log(condition);
				console.log(keyword);
				row +="<tr>";
				row += "<td><img src='<spring:url value='/resources/img/ingredient-img/"+value.ingredient_thumbName+"'/>'></td>";
				row += "<td><a href='detailIngredient.co?ingredient_no="+value.ingredient_no+"'>"+value.ingredient_no+"</a></td>";
				row += "<td>"+value.ingredient_nm+"</td>";
				row += "<td>"+value.ingredient_categ+"</td>";
				row += "<td>"+price+"원</td>"; 
				row += "<td>"+value.ingredient_amt+"개</td>";
				row += "<td><input type='button' class='btn btn-info' value='수정' onclick='upDate("+value.ingredient_no+")'>";
				row += "<input type='button' class='btn btn-danger' onclick='del("+value.ingredient_no+")' value='삭제'></td>";		
				row +="</tr>";
				$("#listData").append(row);
			});
			
		},error: function(request, status, error) {
			console.log(error);
			alert("status : " + status);
		}
	});
};

function listData(page) {
	$.ajax({
		url: "AjaxAddList.co",
		type: "post",
		dataType: "Json",
		data : {paging : page},
		
		success : function(data) {
			$.each(data, function(index, value) {
				var row = "";
				var price = new Intl.NumberFormat({ maximumSignificantDigits: 3 }).format(value.ingredient_price);
				row +="<tr>";
				row += "<td><img src='<spring:url value='/resources/img/ingredient-img/"+value.ingredient_thumbName+"'/>'></td>";
				row += "<td><a href='detailIngredient.co?ingredient_no="+value.ingredient_no+"'>"+value.ingredient_no+"</a></td>";
				row += "<td>"+value.ingredient_nm+"</td>";
				row += "<td>"+value.ingredient_categ+"</td>";
				row += "<td>"+price+"원</td>"; 
				row += "<td>"+value.ingredient_amt+"개</td>";
				row += "<td><input type='button' class='btn btn-info' value='수정' onclick='upDate("+value.ingredient_no+")'>";
				row += "<input type='button' class='btn btn-danger' onclick='del("+value.ingredient_no+")' value='삭제'></td>";		
				row +="</tr>";
				$("#listData").append(row);
			});
			
		},error: function(request, status, error) {
			console.log(error);
			alert("status : " + status);
		}
	});
}

function del(no) {
	   result = confirm('삭제 하시겠습니까');
	    if(result == true){
	        location.href="ingredientDelete.co?ingredient_no="+no
	    }else{
	    return false;
	    }
};

function upDate(no) {
	location.href="getIngredient.co?ingredient_no="+no;
};

$(function () {
	var c = $("select[name=ingredient_searchKeyword]").val();
	console.log(c);
	
});



</script>
</html>