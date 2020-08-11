<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shepe.client.biz.chat.ChatRoomVO" %>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/adminNav.jsp"></jsp:include>
	<div class="container">
		<table class="table" style="margin: 0 auto;">
			<thead>
				<tr>
					<th><h4>주고받은 상담 목록</h4></th>
				</tr>
			</thead>
			<div style="overflow-y: auto; width: 100%; max-height: 450px;">
				<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd; margin: 0 auto;">
					<thead>
						<tr>
							<td style="width: 50px;">No</td><td style="width: 150px;">분류</td><td style="width: 100px;">ID</td><td style="width: 100px;">날짜</td><td style="width: 50px;">Result</td>
						</tr>
					</thead>
					<tbody id="boxTable">
						
					</tbody>
					
				</table>
			</div>
		</table>
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
	
	<script>

	webSocket.onmessage = function(message) {

		let node = JSON.parse(message.data);
		
		if (node.status === "AdminCall") {

			var clientUserID = node.key;
			sessionStorage.removeItem("clientconnect");
			sessionStorage.setItem("clientconnect", "connect");
			
			$.ajax({
				type : "POST",
				url : "admin_chatroomone",
				data : {
					userID : encodeURIComponent(clientUserID)
				},
				dataType: "JSON",
				success : function(result) {
					
					let chatcomplete = result.chatcomplete;
		        	
		        	if ( chatcomplete == '0' ) {
		        		chatcomplete = '상담진행중';
		        		} else {
		        		chatcomplete = '상담완료' ;
		        		}
					
			        		$('#boxTable').prepend('<tr onclick=javascript:goPage(\"'+ result.userid +'\",\"'+ result.chatroomnum +'\");' + 
							        "style='cursor:hand'><td>" + result.consultsq + "</td>"+
									"<td>" + result.chatsubject + "</td>"+
									"<td><h5>" +
									result.userid +
							        "</h5></td>"+
									"<td>"+result.chatdate+"</td>"+
									"<td>"+chatcomplete+"</td>"
							);

			      
				},
				error: function(request, status, error) {
					alert("오류");
				}
			});

		} else if (node.status === "message") {

		} else if (node.status === "bye") {

		}
	};

	</script>
	<script>
		$(document).ready(function() {
			
			$.ajax({
				type : "POST",
				url : "admin_chatroomList",
				dataType: "JSON",
				success : function(result) {
			        $.each(result, function(index, value){
			        	
			        	let chatcomplete = value.chatcomplete;
			        	
			        	if ( chatcomplete == '0' ) {
			        		chatcomplete = '상담진행중';
			        		} else {
			        		chatcomplete = '상담완료' ;
			        		}
		
			        	$('#boxTable').append('<tr onclick=javascript:goPage(\"'+ value.userid +'\",\"'+ value.chatroomnum +'\");' + 
								        "style='cursor:hand'><td>" + value.consultsq + "</td>"+
										"<td>" + value.chatsubject + "</td>"+
										"<td><h5>" +
										value.userid +
								        "</h5></td>"+
										"<td>"+value.chatdate+"</td>"+
										"<td>"+
										chatcomplete +
										"</td>"
						);
			        	
			        });
				},
				error: function(request, status, error) {
					alert("오류");
				}
			});

		});
		
		function goPage(clientId, clientroomnum) {
			let message = "AdminConnect입니다.";
			let key = clientId;
			let room = clientroomnum;
			
			webSocket.send(key + "#####" + message);
			
			location.href="admin_getChatroom?fromId="+key+"&toId=admin&chatroomnum="+room
			}

		</script>

</body>
</html>