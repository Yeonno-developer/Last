<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %> 
<!doctype html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>http://www.blueb.co.kr</title>
	
<style>
@import url(http://fonts.googleapis.com/css?family=Open+Sans);
.btn { display: inline-block; *display: inline; *zoom: 1; padding: 4px 10px 4px; margin-bottom: 0; font-size: 13px; line-height: 18px; color: #333333; text-align: center;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); vertical-align: middle; background-color: #f5f5f5; background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6); background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6)); background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6); background-image: -o-linear-gradient(top, #ffffff, #e6e6e6); background-image: linear-gradient(top, #ffffff, #e6e6e6); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff, endColorstr=#e6e6e6, GradientType=0); border-color: #e6e6e6 #e6e6e6 #e6e6e6; border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25); border: 1px solid #e6e6e6; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px; -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); cursor: pointer; *margin-left: .3em; }
.btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] { background-color: #e6e6e6; }
.btn-large { padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; }
.btn:hover { color: #333333; text-decoration: none; background-color: #e6e6e6; background-position: 0 -15px; -webkit-transition: background-position 0.1s linear; -moz-transition: background-position 0.1s linear; -ms-transition: background-position 0.1s linear; -o-transition: background-position 0.1s linear; transition: background-position 0.1s linear; }
.btn-primary, .btn-primary:hover { text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; }
.btn-primary.active { color: rgba(255, 255, 255, 0.75); }
.btn-primary { background-color: #4a77d4; background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4); background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de), to(#4a77d4)); background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4); background-image: -o-linear-gradient(top, #6eb6de, #4a77d4); background-image: linear-gradient(top, #6eb6de, #4a77d4); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de, endColorstr=#4a77d4, GradientType=0);  border: 1px solid #3762bc; text-shadow: 1px 1px 1px rgba(0,0,0,0.4); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5); }
.btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] { filter: none; background-color: #4a77d4; }
.btn-block { width: 100%; display:block; }

* { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }

html { width: 100%; height:100%; overflow:hidden; }

body { 
	width: 100%;
	height:100%;
	font-family: 'Open Sans', sans-serif;
	background: #092756;
	background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
}
.join { 
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -400px 0 0 -150px;
	width:300px;
	height:500px;
}
.join h1 { color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center; }

input { 
	width: 100%; 
	margin-bottom: 10px; 
	background: rgba(0,0,0,0.3);
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	color: #fff;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
	border: 1px solid rgba(0,0,0,0.3);
	border-radius: 4px;
	box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
	-webkit-transition: box-shadow .5s ease;
	-moz-transition: box-shadow .5s ease;
	-o-transition: box-shadow .5s ease;
	-ms-transition: box-shadow .5s ease;
	transition: box-shadow .5s ease;
}
input:focus { box-shadow: inset 0 -5px 45px rgba(100,100,100,0.4), 0 1px 1px rgba(255,255,255,0.2); }
select {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  appearance: none;
  outline: 0;
  box-shadow: none;
  border: 0 !important;
  background: #2c3e50;
  background-image: none;
}
/* Custom Select */
.select {
box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
  position: relative;
  display: block;
  width: 300px;
  height: 3em;
  line-height: 3;
  background: #2c3e50;
  overflow: hidden;
  border-radius: .25em;
  margin-bottom: 10px;
}
select {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0 0 0 .5em;
  color: #fff;
  cursor: pointer;
  background : rgba(0,0,0,0.3);
}
select::-ms-expand {
  display: none;
}
/* Arrow */
.select::after {
  content: '\25BC';
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  padding: 0 1em;
  background: rgba(0,0,0,0.3);
  pointer-events: none;
}
/* Transition */
.select:hover::after {
  color: #f39c12;
}
.select::after {
  -webkit-transition: .25s all ease;
  -o-transition: .25s all ease;
  transition: .25s all ease;
}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript">

var chkId = function() {
	if(passchek == false) {
		alert("아이디를 올바르게 입력하세요");
		passchekId = false;
	}
	else {
		$.post(ctx + "/member/IdCheck", {id:$("#jId").val() }, function(data, status) {
		if(status == "success") {
			if(data == true) {
				alert("사용할 수 있는 아이디 입니다.")
				passchekId = true;
			}
			else {
				alert("사용할 수 없는 아이디 입니다.");
			}
		}
		else if(status == "error") {
			alert("잠시 후에 다시 시도해 주세요");
		}
		else {
			alert("잠시 후에 다시 시도해 주세요");
			}
		});
	}
}

function pwchk(){ //비밀번호 확인
	   var f1 = document.forms[0];
	   var pw1 = f1.password.value;
	   var pw2 = f1.passwordcheck.value;
	   if(pw1!=pw2){
	      document.getElementById('pwchk').style.color = "red";
	       document.getElementById('pwchk').innerHTML = "동일한 암호를 입력하세요."; 
	   }else{
	       document.getElementById('pwchk').style.color = "black";
	       document.getElementById('pwchk').innerHTML = "암호가 확인 되었습니다."; 
	   }
	}  
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("addr").value = roadAddr;
	                var guideTextBox = document.getElementById("guide");
	            }
	        }).open();
	    }
	</script>
</head>
<body>
	<form:form modelAttribute="user" method="post" action="userEntry.shop">
		<div class="join">
			<h1>Join</h1>
			<form:input path="userId" placeholder="아이디"/><font color="red"><form:errors path="userId" /></font>
			
			<form:input path="userName" placeholder="이름"/><form:errors path="userName" />
			
			<form:password path="password" placeholder="비밀번호"/><font color="red"><form:errors path="password" /></font>
			
			<input type="password" name="passwordcheck" placeholder="비밀번호 확인" onkeyup="pwchk()" />	
			
			<form:input path="tel" placeholder="핸드폰 번호" /><form:errors path="tel" />
			
			<form:input path="email" placeholder="이메일"/><form:errors path="email" />
			
			<form:input path="postcode" placeholder="우편번호" />
			<input type="button" onclick="sample4_execDaumPostcode()"	value="우편번호 찾기"><br>
			<form:input path="addr" placeholder="도로명주소" />
			<br> 
			<span id="guide" style="color: #999; display: none"></span>
			<form:input path="addr1" placeholder="상세주소" />
			
<div class="center-on-page">
  <div class="select">
    <form:select path="ft">
      <option>좋아하는 팀</option>
				<form:option value="현대모비스">울산 현대모비스</form:option>
				<form:option value="전자랜드">인천 전자랜드</form:option>
				<form:option value="부산KT">부산 KT</form:option>
				<form:option value="안양KGC">안양 KGC</form:option>
				<form:option value="전주KCC">전주 KCC</form:option>
				<form:option value="원주DB">원주 DB</form:option>
				<form:option value="창원LG">창원 LG</form:option>
				<form:option value="고양오리온">고양 오리온</form:option>
				<form:option value="서울SK">서울 SK</form:option>
				<form:option value="서울삼성">서울 삼성</form:option>
				</form:select>
<<<<<<< HEAD
				<form:errors path="ft"/></td>
		</tr>
		<tr height="40px">
			<td>좋아하는 선수<td>
			<td><form:input path="fp"/>
				<form:errors path="fp"/></td>
		</tr>
		<tr height="40px">
			<td>타입<td>
			<td><form:select path="type">
				<form:option value="1">기업</form:option>
				<form:option value="2">일반 회원</form:option>
				</form:select>
				<form:errors path="type"/></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="등록">
				<input type="reset" value="초기화">
			</td>
		</tr>
	</table>
</form:form>
=======
			<form:errors path="ft" />
			
  </div>
</div>

			<form:input path="fp" placeholder="좋아하는 선수" />
			<form:errors path="fp" />
<div class="center-on-page">
  <div class="select" >			
			<form:select path="type">
				<form:option value="1">기업</form:option>
				<form:option value="2">일반 회원</form:option>
			</form:select>
			<form:errors path="type" />
</div>
</div>			
			
			
			<button type="submit" class="btn btn-primary btn-block btn-large">등록</button>
			<br>
			<button type="reset" class="btn btn-primary btn-block btn-large">초기화</button>

		</div>
	</form:form>
>>>>>>> branch 'MinSuk' of https://github.com/Yeonno-developer/Last.git
</body>
</html>