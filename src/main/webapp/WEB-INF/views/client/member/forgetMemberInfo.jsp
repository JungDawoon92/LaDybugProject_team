<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/shepe/resources/css/searchID.css">
<title>Insert title here</title>
<script>
$(document).ready(function(){
    $('#siOkbtn').on('click', function(){
    	//alert($('#m_id').val());
        $.ajax({
            type: 'POST',
            url: 'searchID.do',
            data: {
                "member_nm" : $('#m_name').val(),
                "member_email" : $('#m_email_id').val(),
                "member_email_domain" : $('#m_email_domain').val()
            },
            success: function(data){
                if($.trim(data) == "x"){
					alert('가입기록이 없습니다. 이름 또는 이메일을 확인해주세요.');
                }
                else{
                	alert('회원님의 아이디는 '+$.trim(data)+' 입니다.');
                }
            }
        });    //end ajax    
    });    //end on    
    
    $('#spwOkbtn').on('click', function(){
    	alert('이메일 전송을 완료했습니다. 이메일을 확인해주세요.');
        $.ajax({
            type: 'POST',
            url: 'searchPW.do',
            data: {
                "member_id" : $('#m_id2').val(),
                "member_email" : $('#m_email_id2').val(),
                "member_email_domain" : $('#m_email_domain2').val()
            },
            success: function(data) {
            	alert('발송된 임시 비밀번호로 로그인 바랍니다.');
            	location.href = "index.jsp";
            }
        });    //end ajax    
    });    //end on   
});
</script>
</head>
<body>
<jsp:include page="/WEB-INF/include/Nav.jsp" />
	<div class="container login-container">
            <div class="row">
                <div class="col-md-6 login-form-1">
                    <h3>아이디 찾기</h3>
                   		<div class="row">
	                        <div class="form-group col-md-11">
	                            <input type="text" class="form-control" maxlength="20" id="m_name" placeholder="이름">
	                        </div>
                        </div>
                        <div class="row">
	                        <div class="form-group col-md-5 col-xs-6">
	                            <input type="text" class="form-control" maxlength="50" id="m_email_id" placeholder="이메일">				
	                       </div>
                       <div class="form-group col-md-1 col-xs-1">@</div>
                        <div class="form-group col-md-5 col-xs-5">
                            <input type="text" class="form-control" maxlength="50" id="m_email_domain" placeholder="도메인">
                        </div>
                        </div>
                        <div align="right" class="form-group" style="padding-right: 50px;">
							<img id="siOkbtn" class="showMask" src="/shepe/resources/img/login_img/btn_ok.png" style="cursor: pointer;">
						</div>				
                </div>
                <div class="col-md-6 login-form-2">
                    <h3>비밀번호 찾기</h3>
                        <div class="row">
	                        <div class="form-group col-md-11">
	                            <input type="text" class="form-control" maxlength="20" id="m_id2" placeholder="아이디">
	                        </div>
                        </div>
                        <div class="row">
	                        <div class="form-group col-md-5 col-xs-6">
	                            <input type="text" class="form-control" maxlength="50" id="m_email_id2" placeholder="이메일">				
	                       </div>
                       <div class="form-group col-md-1 col-xs-1">@</div>
                        <div class="form-group col-md-5 col-xs-5">
                            <input type="text" class="form-control" maxlength="50" id="m_email_domain2" placeholder="도메인">
                        </div>
                        </div>
                        <div align="right" class="form-group" style="padding-right: 50px;">
							<img id="spwOkbtn" class="showMask" src="/shepe/resources/img/login_img/btn_ok.png" style="cursor: pointer;">
						</div>
                </div>
            </div>
        </div>
	
</body>
</html>