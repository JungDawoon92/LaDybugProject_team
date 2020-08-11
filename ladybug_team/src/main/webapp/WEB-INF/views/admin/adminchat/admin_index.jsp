<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <title>Lady bug</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/shepe/resources/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <link rel="stylesheet" href="/shepe/resources/chatcss/styles.css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>


<div class="container" style="margin-top:30px">
<section>
<article>
  <div class="row">
  	<h1>Admin index</h1>
    <div class="col-sm-8">
      <textarea id="messageTextArea" rows="10" cols="50" disabled="disabled"></textarea>
    </div>
  </div>
  </article>
  </section>

      <ul id="chatList" class="chat__messages" style="padding-left: 5px;">
         <li class="incoming-message message">
          <img src="/shepe/resources/chatcss/hello.png" class="m-avatar message__avatar" />
          <div class="message__content">
            <span class="message__bubble">
              <button type="button" class="btn btn-secondary">결제</button> <button type="button" class="btn btn-secondary">취소</button> <button type="button" class="btn btn-secondary">환불</button> <button type="button" class="btn btn-secondary">로그인</button>
            </span>
            <span class="message__author">이래건</span>
          </div>
        </li>
      </ul>
</div>

<script>
var webSocket = new WebSocket("ws://localhost:8090/shepe/chatAdmin");

		webSocket.onopen = function(message) {
		};
		webSocket.onclose = function(message) {
		};
		webSocket.onerror = function(message) {
		};
</script>



</body>
</html>