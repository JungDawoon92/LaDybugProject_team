<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	#list{ text-align:center}
	table.center {
		margin-left:auto;
		margin-right:auto;
	}
</style>
</head>
<body>
<div id="list">

<hr>
<form action="login.do" method="post">
<table class="center" border="1">
	<tr>
		<td bgcolor="orange">아이디</td>
		<td><input type="text" name="id"/></td>
	</tr>
	<tr>
		<td bgcolor="orange">비밀번호</td>
		<td><input type="password" name="pass"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit"/>
		</td>
	</tr>
</table>
</form>
<hr>
</div>
</body>
</html>