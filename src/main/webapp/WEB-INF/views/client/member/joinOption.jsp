<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
ul li {
	display:inline-block;
}
.join_btn{
	align-content: center;
    border: 1px solid #ff5b59;
    background: #ff5b59;
    color: #fff;
    display: inline-block;
    position: relative;
    min-width: 390px;
    height: 64px;
    padding: 0 5px;
    font-size: 16px;
    line-height: 64px;
    text-align: center;  
    border: 0 none;
    border-radius: 0;
    cursor: pointer;
    color: white;
    outline: 0;
}
.container_etc {
	width: 600px;
	margin: auto;
	margin-top: 100px;
	min-height: 300px;
}

#join_btn { 
outline: 0; 
border: 0; 
background-color:#ff5b59;
font-size: 15px;
color: white;
text-align: center;
}
.join_btn{
align-content: center;
}
</style>
</head>
<jsp:include page="/WEB-INF/include/Nav.jsp" />
<body>
<section>
<div class="container_etc">
	<div id="content" class="content_primary welcome_member">
		<div id="content" class="cmem_ct_join">
			<div class="cmem_header">
				<div class="cmem_header_tit">
					<h2>회원가입</h2>
				</div>
				<div class="cmem_join_desc">
					<h2>SHEPE에 오신것을 환영합니다.</h2>
					<p class="cmem_join_desc_txt">회원가입 후 SHEPE의 다양한 서비스를 이용해보세요.
						여러분도 쉐프가 될 수 있습니다.</p>
				</div>
			</div>
					<div class="cmem_subtit">
						<h3>SHEPE 통합회원</h3>
					</div>
					<ul class="join_benefit">
						<li><span class="sp_cmem_join cmem_ico_birthday_coupon"></span>
							<div class="cmem_benefit_txt">
								<span class="cmem_benefit_name">생일쿠폰</span>
								<p>
									1년에 한 번씩 <br>최대 20만원까지 할인되는 <br>10% 생일쿠폰 제공
								</p>
							</div></li>
						<li><span class="sp_cmem_join cmem_ico_ssgpoint"></span>
							<div class="cmem_benefit_txt">
								<span class="cmem_benefit_name">SHEPE포인트</span>
								<p>
									신세계백화점, 이마트, <br>스타벅스 등 제휴사에서 <br>포인트 적립 및 사용 가능
								</p>
							</div></li>
						<li><span class="sp_cmem_join cmem_ico_event"></span>
							<div class="cmem_benefit_txt">
								<span class="cmem_benefit_name">이벤트 참여</span>
								<p>
									매주 진행되는 <br>다양한 쇼핑 혜택의 <br>이벤트 참여 가능
								</p>
							</div></li>
					</ul>
					<button type="button" id="join_btn" class="cmem_join_btn cmem_btn_ornge" onclick="location.href='terms.do'">
						<div class="join_btn">
							<span class="join_span_btn">SHEPE 회원가입</span>
						</div>
					</button>
				</div>
			</div>
		</div>
</section>
</body>
</html>