<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 리스트</title>
</head>
<body>
<div>
<h1 align="center">글 목록</h1>
<table border="1" cellpadding="0" cellspacing="0" align="center" width="700">
	<tr align="center">
		<th bgcolor="orange" width="100">번호</th>
		<th bgcolor="orange" width="200">제목</th>
	</tr>
	<c:forEach items="${ recipeList }" var="recipe">
		<tr>
			<td>${ recipe.recipe_no }</td>
			<td align="left"><a href="getRecipe.re?recipe_no=${ recipe.recipe_no }">${ recipe.recipe_nm }</a></td>
		</tr>
	</c:forEach>
</table>
<br>
<p align="center"><a href="recipeInterceptor/recipeInsert.re">레시피 등록하기</a></p>
</div>
</body>
</html>









