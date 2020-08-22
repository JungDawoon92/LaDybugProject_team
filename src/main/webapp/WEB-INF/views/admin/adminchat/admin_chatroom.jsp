<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<title>Lady bug</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="/shepe/resources/chatcss/NewFile.css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<title>Insert title here</title>
</head>

<body>

<jsp:include page="/WEB-INF/include/adminNav.jsp"></jsp:include>
<div class="container">
<h3 class=" text-center">Messaging</h3>
<div class="messaging">
  <div class="inbox_msg">
    <div class="inbox_people">
      <div class="headind_srch">
        <div class="recent_heading">
          <h4>상담내역</h4>
        </div>
        <div class="srch_bar">
          <div class="stylish-input-group">
            <span class="input-group-addon">
            	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#counseling_history"><i class="fa fa-plus-square-o"></i></button>
            </span> 
          </div>
        </div>
      </div>
      
      
      
      <!-- 모달 -->
      
      
       		<div class="modal" id="counseling_history">
       			<form method="post" id="history" name="counseling"  onsubmit="return false;">
			    <div class="modal-dialog">
			      <div class="modal-content">
			        <div class="modal-header">
			          <h4 class="modal-title">상담이력작성하기</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			          
			          <label for="sel1">상담주제:</label>
			          <select class="form-control" id="sel1" name="h_subject">
			          	<option  value="회원/로그인">회원/로그인</option>
			          	<option  value="상품">상품</option>
			          	<option  value="주문/결제">주문/결제</option>
			          	<option  value="배송/조회">배송/조회</option>
			          	<option  value="취소/환불">취소/환불</option>
			          	<option  value="교환/반품">교환/반품</option>
			            <c:forEach var="i" begin="0" end="${BootContentt.butNum - 1}"> 
			            		<c:set var="fname1" value="q${i}" />
								<option id="a${i}" value="${BootContentt[fname1]}">${BootContentt[fname1]}</option>
						</c:forEach>
			          </select>
			          <div class="form-group">
			            <label for="comment">상담이력:</label>
			            	<textarea class="form-control" rows="5" id="comment" name="h_content"></textarea>
			         </div>
			         
			         <input type="hidden" name="h_userid" value="${chatroomVO.userid}">
			         <input type="hidden" name="h_adminid" value="admin">
			         <input type="hidden" name="consultsq" value="${chatroomVO.consultsq}">
			         
			         
			         <div class="form-check custom-control-inline">
				      <label class="form-check-label" for="radio1">
				        <input type="radio" class="form-check-input" id="radio1" name="h_ok" value="0" checked>상담진행중
				      </label>
				    </div>
				    <div class="form-check custom-control-inline">
				      <label class="form-check-label" for="radio2">
				        <input type="radio" class="form-check-input" id="radio2" name="h_ok" value="1">상담완료
				      </label>
    				</div>
			        </div>
			        
			        <div class="modal-footer">
			          <button type="submit" class="btn btn-primary" onclick="submitcheck();" data-dismiss="modal">작성</button>
			          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			        </div>
			      </div>
			    </div>
			    </form>
  			</div>
  			

      <div id="inbox_counseling" class="inbox_chat">
	      
	<c:forEach var="c_list" items="${counselingList}">
        <div class="chat_list">
          <div class="chat_people">
            <div class="chat_ib">
              <h5>${c_list.h_subject}</h5>
              <p>${c_list.h_content}</p>
              <span class="chat_date"><font class="text-secondary" style="font-size: 12px;">${c_list.h_date}</font></span>
            </div>
          </div>
        </div>
	</c:forEach>




      </div>
    </div>
    <div class="mesgs">
      <div id="msg_historyid" class="msg_history">
      	<c:forEach var="history" items="${getChatroomList}">
	      	
	      	<c:choose>
			    <c:when test="${history.fromID ne 'admin'}">
				    <div class="incoming_msg">
						<div class="incoming_msg_img">
							<img src="/shepe/resources/chatcss/king.PNG" alt="sunil">
						</div>
						<div class="received_msg">
							<div class="received_withd_msg">
								<p>
									${history.chatContent}
								</p>
								<span class="time_date">
									${history.fromID}
								</span>
							</div>
						</div>
					</div>
			    </c:when>
			    <c:otherwise>
			      	<div class="outgoing_msg">
						<div class="sent_msg">
							<p>
								${history.chatContent}
							</p>
							<span class="time_date">
								${history.fromID}
							</span>
						</div>
					</div>
			    </c:otherwise>
			</c:choose>
		</c:forEach>
      </div>
      
      
      <div class="type_msg">
        <div class="input_msg_write">
          <input  id="chatContent" type="text" class="write_msg" placeholder="Type a message" onkeydown="return enter()" />
          <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true" onclick="sendMessage()"></i></button>
        </div>
      </div>
      
      
    </div>
  </div>
</div>
</div>

<script>
var webSocket = new WebSocket("ws://192.168.219.130:8090/shepe/chatAdmin");

		webSocket.onopen = function(message) {
		};
		webSocket.onclose = function(message) {
		};
		webSocket.onerror = function(message) {
		};
</script>

<script type="text/javascript">

webSocket.onmessage = function(message) {
	
	let node = JSON.parse(message.data);
	
	if(node.message === "ClientConnect입니다." ) {
		sessionStorage.removeItem("clientconnect");
		sessionStorage.setItem("clientconnect", "connect");
		return;
		
	} else if (node.message === "ClientLogout입니다.") {
		sessionStorage.removeItem("clientconnect");
		sessionStorage.setItem("clientconnect", "notConnect");
		return;
	}
	
	var fromID = 'admin';
	var toID = node.key;
	var roomcheck = '${chatroomVO.userid}';

	if (node.status === "message" && node.key === roomcheck) {
		
		$('#msg_historyid').append(
  				'<div class="incoming_msg">' + 
  				'<div class="incoming_msg_img"> <img src="/shepe/resources/chatcss/king.PNG" alt="sunil"></div>'+
  				'<div class="received_msg">' +
  				'<div class="received_withd_msg"><p>' +
  				node.message +
  				'</p>' +
  				'<span class="time_date">'+
  				toID +
  				'</span>' +
  				'</div>' +
  				'</div>' +
  				'</div>'
  				);
		$('#msg_historyid').scrollTop($('#msg_historyid')[0].scrollHeight);
	
	} else if (node.status === "bye") {

	}
};



function sendMessage() {
		
		let message = document.getElementById("chatContent");
		var fromID = '${chatroomVO.userid}';
		var toID = 'admin';
		var chatContent = message.value;
		var chatRoomNum =${chatroomVO.chatroomnum} + 0;
		var chatread = 0;
		
		if("connect" === (sessionStorage.getItem("clientconnect"))){
			chatread = 1;
		}
		
		webSocket.send(fromID + "#####" + chatContent);
		
		$('#msg_historyid').append(
				'<div class="outgoing_msg">' +
				'<div class="sent_msg"><p>' +
				chatContent +
				'</p>' +
				'<span class="time_date">admin</span>' +
				'</div>' +
				'</div>'
		);
		message.value = ""; 
	
	$.ajax({
		type : "POST",
		url : "chatSubmit",
		data : {
			fromID : encodeURIComponent(toID),
			toID : encodeURIComponent(fromID),
			chatContent : encodeURIComponent(chatContent),
			chatRoomNum : chatRoomNum,
			chatread : chatread
		}
	}).done(function() {
		$('#msg_historyid').scrollTop($('#msg_historyid')[0].scrollHeight);
	});
	
	}



	function enter() {

		if (event.keyCode === 13) {
			sendMessage();

			return false;
		}
		return true;
	}
	
	$(document).ready(function() {
		$('#msg_historyid').scrollTop($('#msg_historyid')[0].scrollHeight);
	});
	
</script>
<script>
$(window).on("beforeunload", function(){

	let message = "Adminlogout입니다.";
	
	let key = '${chatroomVO.userid}';
	
	webSocket.send(key + "#####" + message);
});

$(document).keydown(function (e) {
    
    if (e.which === 116) {
        if (typeof event == "object") {
            event.keyCode = 0;
        }
        return false;
    } else if (e.which === 82 && e.ctrlKey) {
        return false;
    }
}); 


function submitcheck(){
	var formData = $('#history').serialize();
	
        $.ajax({
            cache : false,
            url : "counseling_history",
            type : 'POST', 
            data : formData
        }).done(function() {
        	
        	 $.ajax({
        		type : "POST",
 				url : "admin_counselingone",
 				data : {
 					consultnum : '${chatroomVO.consultsq}'
 				},
 				dataType: "JSON",
     			success : function(result) {
     		        		$('#inbox_counseling').prepend(
     		        				'<div class="chat_list">' + 
     		    					'<div class="chat_people">'+
     		    	  				'<div class="chat_ib">' +
     		    	  				'<h5>' +
     		    	  				result.h_subject +
     		    	  				'<span class="chat_date">' +
     		    	  				result.h_date +
     		    	  				'</span></h5><p>'+
     		    	  				result.h_content +
     		    	  				'</p></div></div></div>'
     						);
     			},
     			error: function(request, status, error) {
     				alert("오류");
     			}
     		});

		});
        
      
}


</script>


</body>
</html>