<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
	section{
		padding-left: 700px;
    	padding-top: 100px;
	}	
</style>
</head>
<body>
<section>
<h3>관리자 로그인</h3>
<!-- For logout  -->
<c:if test="${not empty logoutMsg}">
    <div style="color: #0000ff;" > 
        <h3> ${logoutMsg} </h3>
    </div>
</c:if>

<!-- login processing module of spring security 4 -->
<form action="<c:url value="/login"/>" method="post">
<!-- For failed user authentication  -->
  <c:if test="${not empty errorMsg}">
    <div style="color: #ff0000;"> 
        <h3> ${errorMsg} </h3>
    </div>
  </c:if>
  <table>
    <tr><td>User:</td><td><input type='text' name='username' value=''></td></tr>
    <tr><td>Password:</td><td><input type='password' name='password' /></td></tr>
    <tr><td colspan='2'><input name="submit" type="submit" value="LOGIN" /></td></tr>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  </table>
</form>
</section>
</body>
</html>