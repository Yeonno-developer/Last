<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<style>

a {
	text-decoration: none;
}
#head {
	background: #FFF;
	height: 150px;
	top: 150px;
}
#head .img {	
}

.menu1 {
background-color: white;
margin-left: 360px;
margin-right: 360px;
widht : 1200px;
height : 70px;
}

.menu1 .main_menu{
float: left;
width : 200px;
text-align: center;
font-size: 22px;
font-family: 'Noto Sans KR', sans-serif;
margin-top: 19px;
position: absolute;
align-content: center;
width : 235px;
}
.menu2 {
margin-left: 360px;
margin-right: 360px;
background-color: white;
widht : 1200px;
height : 320px;
display: none;
z-index:2;
position: absolute; 
/* relative�� ������ �ۼַ�Ʈ�� ����ش�. */
}
div.visual_side {
z-index:0;
}
.menu2 .sub_menu{
/* position: absolute; */
float: left;
width : 235px;
text-align: center;
font-size : 15px;
font-family: 'Noto Sans KR', sans-serif;
margin-top: 15px;
margin-left: 5px;
z-index:300;
}
.menu2 .sub_menu div{
padding-top : 5px;
}
header{
margin-left: 360px !important;
width: 1200px;
align-content: center;
}
hr{
margin: 0px;
}
.footer_line1{
	background-color: #0d141f;
	height: 50px;
	padding-bottom: 0;
	margin-bottom: auto;
}
.footer_line2{
	background-color: #1b2637;
	height: 200px;
	padding-bottom: 0;
	margin-bottom: auto;
}
.goodee{
float: left;
width: 300px;
margin-top: 18px;
}
.goodee_con{
color: white;
}
.goodee2{
float: left;
width: 500px;
margin-top: 18px;
}
</style>
<decorator:head />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).on('mouseover', '.menu1', function () {
    $('.menu2').slideDown(50);
});
$(document).on('mouseover', 'section,header,footer', function () {
    if (!$(this).hasClass('.menu1')) {
        $('.menu2').slideUp(50);
    }
});
</script>
</head>
<body>
	<script type="text/javascript"></script>
	<header>
		<div class="head" align="center">
			<div align="right">
				<c:if test="${empty sessionScope.loginUser}">
					<a href="${path}/user/login.shop">�α���</a>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser}">
					<a href="${path}/user/mypage.shop?id=${sessionScope.loginUser.userId}">Mypage</a>
					<a href="${path}/user/logout.shop">�α׾ƿ�</a>
				</c:if>
			</div>
			<a href="${path}/team/mainPage.shop"><img src="${path}/picture/logo.jpg"
				style="width: 200px; height: 100px; margin-bottom: 20px;"></a>
		</div>
	</header>
<hr style="border-top : 2px solid gray;">
<div class="menu1">
<div class="main_menu" style="margin-left: 0px;"><a href="${path}/schedule/CrowlingSchdule.shop">������� �� ��������</a></div>
<div class="main_menu" style="margin-left: 240px;"><a href="${path}/team/tInfo.shop?tcode=06">��������</a></div>
<div class="main_menu" style="margin-left: 480px;"><a href="${path}/board/list.shop?tcode=06">�Խ���</a></div>
<div class="main_menu" style="margin-left: 720px;"><a href="${path}/item/list.shop?pagenum=1">MALL</a></div>
<div class="main_menu" style="margin-left: 960px;"><a href="${path}/chat/multi.shop">�ǽð� �߰�</a></div>

</div>
<div class="menu2">
<div class="sub_menu" style="margin-left: 0px;"> <!-- ������� �� ����� -->
<div><a href="${path}/team/teamMain.shop">�� ����</a></div>
<div><a href="${path}/schedule/teamB.shop">�� ��</a></div>
<div><a href="${path}/schedule/playerR.shop">���� ����</a></div>
</div>
<div class="sub_menu" style="left:240px;"> <!-- �������� -->
<c:forEach items="${teamCode}" var="c">
<div ><a href="${path}/team/tInfo.shop?tcode=${c.value}">${c.key}</a></div>
</c:forEach>
</div>
<div class="sub_menu" style="left:480px;"> <!-- �Խ��� -->
<c:forEach items="${teamCode}" var="c">
<div><a href="${path}/board/list.shop?tcode=${c.value}">${c.key}</a></div>
</c:forEach>
</div>
<div class="sub_menu" style="left:720px;"> <!-- ���� -->
<div><a href="${path}/item/list.shop?pagenum=1">���� ��</a></div>
<div><a href="${path}/item/list.shop?board=1">�߰� ��</a></div>
</div>
<div class="sub_menu" style="left:960px;"> <!-- �ǽð� �߰� -->
</div>
</div>
<section>
	<decorator:body />
</section>
	<footer>
	<div class="footer_line1"></div>
	<div class="footer_line2">
<div style="float: left; height: 150px; margin-left: 460px; margin-top: 50px;">
<img src="${path}/picture/goodee.png" style="width: 300px; height: 100px;">
</div>
<div class="goodee" style="float: left; margin-left: 20px;">
	<div class="goodee_con" ><span>��������д�����&nbsp;&nbsp;</span><span style="font-size: 55px;">IT</span><span>�÷��̽�</span></div>
	<span style="margin-top : -15px !important; color: white; font-size: 40px;">���� ��ī����</span>
	</div>
	<div class="goodee2" style="margin-top: 80px;">
	<div class="goodee_con">
	<span style="font-size:25px; align-content: flex-end;">������ ��� ������ �� ������Ʈ</span><br>
	<span style="font-size:20px;">��μ�,  �ڼ���,  �̼���,  ����ȣ</span>
	</div>
	</div>
	</div>
	</footer>
</body>
</html>