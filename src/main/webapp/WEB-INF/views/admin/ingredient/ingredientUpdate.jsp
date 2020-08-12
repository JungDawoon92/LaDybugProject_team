<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shepe.client.ingredient.IngredientVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식재료 등록</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#ingredient_nm").keyup(function() {
		$("#nm_check").text("아이디를 중복체크 확인해주세요.");
		$("#nm_check").attr("style", "color:blue")
	});
	
	$("#submit").on("click", function(){
		if($("#ingredient_nm").val()==""){
			alert("아이디를 입력해주세요.");
			$("#ingredient_nm").focus();
			return false;
		}
		var idChkVal = $("#ingredient_nm").val();
		if(idChkVal == "N"){
			alert("중복확인 버튼을 눌러주세요.");
		}else if(idChkVal == "Y"){
			$("#regForm").submit();
		}
	});
  })

function fn_idChk(){
	$.ajax({
		url : "nmCheck.co",
		type : "post",
		dataType : "json",
		data : { "ingredient_nm" : $("#ingredient_nm").val() },
		success : function(data){
			if(data == 1){
				$('#nm_check').text("중복된 이름 입니다 ");
				$('#nm_check').css("color", "red");
				$("#submit").attr("disabled", true);
			}else if(data == 0){
				$("#nm_check").attr("value", "Y");
				$('#nm_check').text("사용가능한 이름 입니다 ");
				$('#nm_check').css("color", "red");
				$("#submit").removeAttr("disabled", false);
			} 
		}
	})
}


$(document).ready(function(){ 

$("#submit").on("click", function(){
	if($("#ingredient_thumbimg").val()==""){
		alert("식재료 썸네일을 올려해주세요.");
		$("#ingredient_thumbimg").focus();
		return false;
	}
	var thumbChkVal =$("#ingredient_thumbimg").val();
	if(thumbChkVal == "N"){
		alert("중복확인 버튼을 눌러주세요.");
	}else if(thumbChkVal == "Y"){
		$("#regForm").submit();
	}
});
})


function fn_thumbChk(){
	var thumb = $("#ingredient_thumbimg").val().slice(12);
	console.log(thumb);
$.ajax({
	url : "thumbNm.co",
	type : "post",
	dataType : "json",
	data : { "ingredient_thumbName" : thumb },
	success : function(data){
		if(data == 1){
			$('#thumb_check').text("중복된 식재료 입니다 ");
			$('#thumb_check').css("color", "red");
			$("#submit").attr("disabled", true);
		}else if(data == 0){
			$("#thumb_check").attr("value", "Y");
			$('#thumb_check').text("사용가능한 식재료 입니다 ");
			$('#thumb_check').css("color", "red");
			$("#submit").removeAttr("disabled", false);
		} 
	}
})
} 

</script>

</head>
<body>
<center>
<h1>식재료 등록</h1>
<hr>							
<form:form commandName="ingredientVO" action="ingredientUpdate.co" method="POST" enctype="multipart/form-data">
<h2>Ingredient 등록</h2>
<!--       Ingredient      -->
  <table border="1" cellpadding="0" cellspacing="0" style="width: 100%; height: 502px;">
  		<input type="hidden" name="ingredient_no" style="width: 95%;" readonly="readonly" value="${get.ingredient_no}"/></td>
	<tr>
		<td bgcolor="pink" width="70" style="width: 150px;">식재료 이름</td>
		<td align="left">
			<input id="ingredient_nm" name="ingredient_nm" style="width: 95%;" value="${get.ingredient_nm}"><br>
		 	<span style="color:red;">※식재료 이름을 정확히 기입해 주세요※</span><br>
			<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
			<div class="check_font" id = "nm_check"></div> 
		</td>		
	</tr>			
	<tr>
		<td bgcolor="pink" width="70">카테고리</td><td align="left">
		<select name="ingredient_categ" id="select1" onChange="checkCateg()">
      		<option value="MEAT">육류</option>
			<option value="BEEF">소고기</option>
			<option value="CHICKEN">닭고기</option>
			<option value="SEAFOOD">해산물</option>
			<option value="VEGETABLE">야채</option>
			<option value="FRUIT">과일</option>
			<option value="NUTS">견과류</option>
			<option value="ETC">기타</option>
		</select>
		</td>
	</tr>
<script language="javascript">
function checkCateg() {
	var x = document.getElementById("select1").value;
	if(x == "MEAT" || x == "NUTS" || x == "BEEF" || x == "CHICKEN") {
		document.getElementById("ingredient_weight").value ="g";
	} else if (x == "SEAFOOD") {
		document.getElementById("ingredient_weight").value ="마리";
	} else if (x == "VEGETABLE" || "FRUIT" || "ETC") {
		document.getElementById("ingredient_weight").value ="개";
	} 
}
</script>
	<tr>
		<td bgcolor="pink">가격</td><td align="left">
		<input type="number" name="ingredient_price" value="${get.ingredient_price}"required style="width: 95%;"  placeholder="숫자만 입력해주세요" onkeypress="priceNum()"/></td>
	</tr>
<script language="javascript">
function priceNum() { 
	if((event.keyCode < 48) || (event.keyCode > 57 )) {
		alert('숫자만 입력해주세요');
		event.returnValue = false;
		return false;	
	} else {
		return true;
	} 
}
</script>
	<tr>
		<td bgcolor="pink">식재료 썸네일</td><td align="left">											
		<input type="file" name="ingredient_thumbimg"  id ="ingredient_thumbimg" size="10" style="width: 95%;" value="${get.ingredient_thumbimg}"/>
		<button class="thumbChk" type="button" id="thumbChk" onclick="fn_thumbChk();" value="N">썸네일 중복확인</button>
		<div class="check_font" id = "thumb_check"></div> 
		</td>
	</tr>
	<tr>
		<td bgcolor="pink">식재료 양</td><td align="left">
		<form:input path="ingredient_amt" type="number" value="${get.ingredient_amt}" style="width: 95%;" placeholder="숫자만 입력해주세요" onkeypress="amtNum()"/></td>
	</tr>
<script language="javascript">
function amtNum() { 
	if((event.keyCode < 48) || (event.keyCode > 57 )) {
		alert('숫자만 입력해주세요');
		event.returnValue = false;
		return false;	
	} else {
		return true;
	} 
}
</script>
</table>
<hr> 
<!--    				 식재료 디테일      				 		 -->	
<table border="1" cellpadding="0" cellspacing="0" style="width:100%; height: 502px;">
<h2>Ingredeint 디테일 등록</h2>
	<tr>
		<td bgcolor="pink" width="70">식재료 원산지</td><td align="left">
		<select name="ingredient_country" id="select1">
      		<option value="국산">국산</option>
			<option value="미국산">미국산</option>
			<option value="스페인">스페인산</option>
			<option value="필리핀">필리핀산</option>
			<option value="태국">태국산</option>
			<option value="중국산">중국산</option>
			<option value="영국">영국산</option>
			<option value="핀란드">핀란드산</option>
			<option value="인도">인도산</option>
		</select>
		</td>
	</tr>
	<tr>
		<td bgcolor="pink">생산지/수입지</td><td align="left">
		<form:input path="ingredient_productimporter" size="10" style="width: 95%;" value="${get2.ingredient_productimporter}" placeholder="생산지/수입지를 적어주세요"/></td>
	</tr>
	<tr>
		<td bgcolor="pink">식재료 중량</td><td align="left">
		<input type="text" step="10" id="ingredient_weight" name="ingredient_weight" value="${get2.ingredient_weight}" style="width: 95%;" placeholder="특수문자와 영문은 안됩니다" value="g" onkeypress="weightNum(event)"/>
		<span>(단위 : 개)</span>
		</td>
	</tr>
<script language="javascript">
function weightNum() { 
	if((event.keyCode < 48) || (event.keyCode > 57 )) {
		alert('숫자만 입력해주세요');
		event.returnValue = false;
		return false;	
	} else {
		return true;
	} 
}
</script>
	<tr>
		<td bgcolor="pink"><label for="calen">제조년월</label></td><td align="left">								
		<label for="calen"><input type="date" id="ingredient_mnfctDate" name="ingredient_mnfctDate"  onclick="fn_dateChk()" size="10" style="width: 95%;" required/></label>	
		</td>
	</tr>
	<div class="check"></div>
<script type="text/javascript">
function doLife(srcE, targetId)
{
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);
    if(val == '육류')
    {
        addOption('제조일로부터 20일', targetE);
        addOption('제품별도표시일까지 / 제조일로부터 냉동 24개월', targetE);
        addOption('제품별도표시일까지 / 제조일로부터 냉동 12개월', targetE);
        addOption('제조일로부터 12개월', targetE);
        addOption('제조일로부터 10일(냉장보관)', targetE);
        addOption('제조일로부터 150일', targetE);
    }
    else if(val == '소고기')
    {
    	addOption('제조일로부터 20일', targetE);
        addOption('제품별도표시일까지 / 제조일로부터 냉동 24개월', targetE);
        addOption('제품별도표시일까지 / 제조일로부터 냉동 12개월', targetE);
        addOption('제조일로부터 12개월', targetE);
        addOption('제조일로부터 10일(냉장보관)', targetE);
        addOption('제조일로부터 150일', targetE);
    }
    else if(val == '닭고기')
    {
    	addOption('제조일로부터 20일', targetE);
        addOption('제품별도표시일까지 / 제조일로부터 냉동 24개월', targetE);
        addOption('제품별도표시일까지 / 제조일로부터 냉동 12개월', targetE);
        addOption('제조일로부터 12개월', targetE);
        addOption('제조일로부터 10일(냉장보관)', targetE);
        addOption('제조일로부터 150일', targetE);
    }
    else if(val == '해산물')
    {
      	addOption('수령일 포함 최소 2일 이상 남은 제품을 보내드립니다. 케이퍼&홀스래디쉬소스:수령일 포함 최소 3개월 이상 남은 제품을 보내드립니다. 자연에서 갈아만든생와 사비와 사시미 간장소스:수령일 포함 최소 3개월 이상 남은 제품을 보내드립니다.', targetE);
        addOption('제조일로부터 냉동보관 1년', targetE);
        addOption('냉동 유통시 제조일로부터 2년 (해동 시 제조일로부터 3일)', targetE);
        addOption('냉동보관시 12개월', targetE);
        addOption('제조일로부터 냉동보관 1년', targetE);
        addOption('주문시 준비, 냉장7일, 냉동6개월', targetE);
    }
    else if(val == '야채')
    {
    	addOption('제조일로부터 냉장 3일', targetE);
        addOption('제조일로부터 냉장 3일까지 / 별도표시일까지', targetE);
        addOption('신선제품으로 별도의 유통기한이 없으나 가급적 빠른섭취하시기 바랍니다.', targetE);
        addOption('주문일 기준 3일 이내 포장된 상품 순차배송', targetE);
        addOption('주문접수 후 2일 이내 포장된 상품으로 발송 / 신선식품 특성상 빠른섭취를 권장 합니다.', targetE);
    }
    else if(val == '과일')
    {
    	addOption('주문건 확인 후 2~4일이내 포장 된 상품으로 발송 / 신선식품 특성 상 정해진 유통기한은 없으나, 빠른섭취를 권장 합니다.', targetE);
        addOption('주문 확인 후 당일 작업', targetE);
        addOption('신선식품이므로 정해진 유통기한은 없으나 가급적 빠르게 섭취', targetE);
        addOption('주문접수 후1일이내 포장된 상품발송/상품수령후3일이내', targetE);
        addOption('상시수확 / 신선식품으로 최대한 빠른 섭취를 권장드립니다.', targetE);
    }
    else if(val == '견과류')
    {
    	addOption('별도표시', targetE);
        addOption('제조일로부터6개월/별도표기', targetE);
    }
    else if(val == '기타')
    {
    	addOption('도정일로부터 2년 / 도정하지 않으면 5년', targetE);
        addOption('보관 방법에 따라 상이함', targetE);
    }
}

function addOption(value, e)
{
    var o = new Option(value);
    try
    {
        e.add(o);
    }
    catch(ee)
    {
        e.add(o, null);
    }
}
function removeAll(e)
{
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i)
    {
        e.remove(1);
    }
}
</script>
	<tr>
		<td bgcolor="pink" width="70">식재료 유통기한</td><td align="left">
		<select name="ingredient_life" id="ingredient_life" onChange="doLife(this, 'ingredient_selLife')">
      		 <option value="육류">육류</option>
        	 <option value="소고기">소고기</option>
        	 <option value="닭고기">닭고기</option>
        	 <option value="해산물">해산물</option>
        	 <option value="야채">야채</option>
        	 <option value="과일">과일</option>
        	 <option value="견과류">견과류</option>
        	 <option value="기타">기타</option>
		</select>
		  <form:select path="ingredient_selLife" id="ingredient_selLife" name="ingredient_selLife">
			<form:option value="default">유통기한 방법</form:option>		
			<form:options items="${ingredient_selLife}"/>
		</form:select>  
		</td>
	</tr>
<script type="text/javascript">
function doFoodType(srcE, targetId)
{
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    
    removeAll(targetE);
    if(val == '육류')
    {
    	addOption('가공육', targetE);
        addOption('포장육', targetE);
        addOption('냉동육', targetE);       
    }
    else if(val == '소고기')
    {
    	addOption('가공육', targetE);
        addOption('포장육', targetE);
        addOption('냉동육', targetE);
    }
    else if(val == '닭고기')
    {
    	functionName('가공육', targetE);
    	functionName('포장육', targetE);
    	functionName('냉동육', targetE);
    	functionName('냉장육', targetE);
    }
    else if(val == '해산물')
    {
    	addOption('가공육', targetE);
        addOption('포장육', targetE);
        addOption('냉동육', targetE);
        addOption('냉장육', targetE);
    }
    else if(val == '야채')
    {
    	addOption('없음', targetE);
    }
    else if(val == '과일')
    {
    	addOption('없음', targetE);
    }
    else if(val == '견과류')
    {
    	addOption('없음', targetE);
    }
    else if(val == '기타')
    {
    	addOption('없음', targetE);
    	addOption('정제', targetE);
    }
    
    console.log("444");
}

var functionName = function addOption2(value, e)
{
	console.log(value);
    var o = new Option(value);
    
    try
    {
        e.add(o);
        console.log(e);
    }
    catch(ee)
    {
        e.add(o, null);
        console.log("222");
    }
}
function removeAll(e)
{
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i)
    {
        e.remove(1);
    }
}
</script>	
	<tr>
		<td bgcolor="pink">가공방법</td><td align="left">
		<select name="ingredient_foodType" id="ingredient_foodType" onchange="doFoodType(this, 'ingredient_selFoodType')">
			 <option value="육류">육류</option>
        	 <option value="소고기">소고기</option>
        	 <option value="닭고기">닭고기</option>
        	 <option value="해산물">해산물</option>
        	 <option value="야채">야채</option>
        	 <option value="과일">과일</option>
        	 <option value="견과류">견과류</option>
        	 <option value="기타">기타</option>
		</select>
		<form:select path="ingredient_selFoodType" id="ingredient_selFoodType" name="ingredient_selFoodType" >
			<form:option value="default">가공방법</form:option>	
			<form:options items="${ingredient_selFoodType}" />
		</form:select> 
		</td>
	</tr>
<script type="text/javascript">
function doStorage(srcE, targetId)
{
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    
    removeAll(targetE);
    if(val == '육류')
    {
        addOption('-2도 ~ -5도 냉장보관', targetE);
        addOption('-18도이하 냉동보관', targetE);
    }
    else if(val == '소고기')
    {
    	 addOption('-2도 ~ -5도 냉장보관', targetE);
         addOption('-18도이하 냉동보관', targetE);
    }
    else if(val == '닭고기')
    {
    	 addOption('-2도 ~ -5도 냉장보관', targetE);
         addOption('-18도이하 냉동보관', targetE);
    }
    else if(val == '해산물')
    {
      	addOption('냉동보관', targetE);
        addOption('즉시 섭취 또는 냉동 보관을 권장합니다.', targetE);
        addOption('냉장보관', targetE);
        addOption('수시로 어획하여 반건조하는 제품입니다 / 받은 후 냉동 3개월까지 보관가능.', targetE);
        addOption('받은 후 냉동 3개월까지 보관가능', targetE);
        addOption('냉동보관 10개월', targetE);
    }
    else if(val == '야채')
    {
    	addOption('박스를 개봉한 후 서늘한 곳에 보관', targetE);
        addOption('박스를열어 냉장실에 보관하세요. 신선식품 특성상 가급적 빠른섭취 부탁드립니다.', targetE);
        addOption('통풍이 잘되는 서늘한 곳에 신문지를 덮고 보관 / 냉장보관시 개별포장하여 보관', targetE);
        addOption('냉장보관', targetE);
        addOption('신선식품 특성상 가급적 빠른섭취 권장합니다.', targetE);
    }
    else if(val == '과일')
    {
    	addOption('직사광선을 피해 습기없는 서늘한 곳에 보관 ( 박스보관 추천 ) / 냉장보관 권장 (후숙하면서 드시는 과일)', targetE);
        addOption('신선식품 특성상 가급적 빠른섭취권장', targetE);
        addOption('냉장보관', targetE);
        addOption('수령 후 냉장 또는 상온보관', targetE);
        addOption('상온에서 약 5~7일 보관이 가능하나 가급적 신선도 유지를 위해 0~5도씨 냉장보관!.겨울철에는 개봉전 약 1~2시간 정도 상온 보관 후 개봉!', targetE);
    }
    else if(val == '견과류')
    {
    	addOption('차갑고 건조한 곳에 밀봉하여 보관(냉동보관 추천)', targetE);
        addOption('직사광선을 피해 습기없는 서늘한 곳에 보관 ( 박스보관 추천 )', targetE);
        addOption('구매후 냉장,냉동보관 / 장기간 보관시 냉동보관', targetE);
    }
    else if(val == '기타')
    {
    	addOption('냉장보관이나 통풍이 잘 되는 실온', targetE);
        addOption('차갑고 건조한 곳에 밀봉하여 보관(냉장/냉동보관 추천)', targetE);
        addOption('서늘한곳 또는 냉장보관', targetE);
    }
}

function addOption(value, e)
{
    var o = new Option(value);
    try
    {
        e.add(o);
    }
    catch(ee)
    {
        e.add(o, null);
    }
}
function removeAll(e)
{
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i)
    {
        e.remove(1);
    }
}
</script>
	<tr>
		<td bgcolor="pink">보관방법</td><td align="left">
		<select name="ingredient_storage" id="ingredient_storage" onchange="doStorage(this, 'ingredient_selStorage')">
      		<option value="육류">육류</option>
        	<option value="소고기">소고기</option>
        	<option value="닭고기">닭고기</option>
        	<option value="해산물">해산물</option>
        	<option value="야채">야채</option>
        	<option value="과일">과일</option>
        	<option value="견과류">견과류</option>
        	<option value="기타">기타</option>
		</select>
		<form:select path="ingredient_selStorage" name = "ingredient_selStorage" id="ingredient_selStorage">
			<form:option value="default">식재료 보관방법</form:option>
			<form:options items="${ingredient_selStorage}"/>
		</form:select> 
		</td>
	</tr>
	<tr>
		<td bgcolor="pink">포장재질</td><td align="left">
		<select name="ingredient_pckmtr" id="select1">
      		<option value="열성형진공포장">열성형진공포장</option>
			<option value="PE비닐">PE비닐</option>
			<option value="폴리에틸렌">폴리에틸렌</option>
			<option value="(내면):용기:PP,상단필름:PE">(내면):용기:PP,상단필름:PE</option>
			<option value="PP,PE(내면)">PP,PE(내면)</option>
			<option value="PP(내면)">PP(내면)</option>
			<option value="용기-PP, 소스파우치-PE(내면)">용기-PP, 소스파우치-PE(내면)</option>
			<option value="용기-PP, 투명원형용기-PET , 참기름파우치-PE">용기-PP, 투명원형용기-PET , 참기름파우치-PE</option>
		</select>
		</td>
	</tr>
	<tr>
		<td bgcolor="pink">영양분</td><td align="left">
		<select name="ingredient_nutrient" id="select1">
      		<option value="육류100%">육류100%</option>
			<option value="소고기100%">소고기100%</option>
			<option value="닭고기100%">닭고기100%</option>
			<option value="해산물100%">해산물100%</option>
			<option value="야채100%">야채100%</option>
			<option value="과일100%">과일100%</option>			
			<option value="견과류100%">견과류100%</option>
			<option value="기타100%">.</option>
		</select>
		</td>
	</tr>
	<tr>
		<td bgcolor="pink">알레르기 성분</td><td align="left">
		<select name="ingredient_allergy" id="select1">
      		<option value="소고기 함유">소고기 함유</option>
			<option value="돼지고기 함유">돼지고기 함유</option>
			<option value="닭고기 함유">닭고기 함유</option>
			<option value="해산물 함유">해산물 함유</option>
			<option value="야채 함유">야채 함유</option>
			<option value="과일 함유">과일 함유</option>			
			<option value="견과류 함유">견과류 함유</option>
			<option value="기타 함유">기타 알레르기</option>
		</select>
		</td>
	</tr>
<hr>
  </table> 
  
<!--    식재료 멀티       -->
  <table border="1" cellpadding="0" cellspacing="0" style="width:100%; height: 502px;">
<hr>
	<h2>Ingredint 멀티 등록</h2>
	<tr>
		<td bgcolor="pink">다중 이미지</td><td align="left">
		<input type="file" name="ingredient_multi_img"  multiple = "multiple" size="10" style="width: 95%;" value="아무나맨" placeholder="특수문자는 되지 않습니다" onkeypress="multiImg(event)"/></td>
	</tr>
<script language="javascript">
function multiImg(e) { 
	var code= (window.event) ? event.keyCode : e.which;
	if ((event.keyCode > 32) && (event.keyCode < 48 ))  nAllow(e); 	
	if ((event.keyCode > 57) && (event.keyCode < 65 ))  nAllow(e); 		
	if ((event.keyCode > 90) && (event.keyCode < 97))   nAllow(e); 	
	if ((event.keyCode > 122) && (event.keyCode < 127)) nAllow(e); 
}
function nAllow(e) {
	alert('특수문자는 사용할 수 없습니다!!');
	if (navigator.appName != "Netscape") {
		event.returnValue = false;
	} else {
		e.preventDefault();
	}
}
</script>
		<td bgcolor="pink" colspan="2" align="center">
		<input type="submit" id="submit" value="등록하깅"/></td>
	</tr> 
 </table>  
</form:form> 
<hr>
<a href="getBoardList.do">글 목록 가기</a>
</center>
</body>
</html>