<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CRAWING을 이용한 SCREEN</title>
<style type="text/css">
.info_mid{
margin-left: 360px;
margin-bottom: 50px;
margin-right : 360px;
width : 1200px;
height : 300px;
}
.info_full{
width : 940px;
padding: 20px;
background: #bababa url("${path}/picture/teams/team_bg.jpg") no-repeat 0 -65px;
overflow: hidden;
margin-left: 130px;
}
.info_box{
overflow: hidden;
width: 900px;
padding: 20px;
background: #fff;
}
.pageheader {
	margin-left : 360px;
	margin-right : 360px;
    overflow: hidden;
    padding: 0 69px 0 60px;
    height: 116px;
    line-height: 116px;
}
.pageheader h5{
	padding-left: 70px;
	font-size: 30px;
    font-weight: 500;
    color: #252525;
}
.info_box_box {
margin-left : 150px;
    width: 550px;
    overflow: hidden;

}
.info_box_box dl {
font: 12px/1.4 'NotoSansKR', Dotum, '돋움', Gulim, '굴림', Arial, Helvetica, sans-serif;
color: #666;
}
.info_box_box dl dt{
	margin-left : 50px;
    float: left;
    width: 90px;
    color: #33519a;
    font-weight: bold;
}
.info_box_box dl dd{
font-weight: bold;
}
.info_box_box img{
border: 1px solid #e1e1e1;
}
.info_top{

margin-left: 760px;
margin-right: 360px;
width : 1200px;
height: 150px;
}
.pinfo_menu{
border : 1px solid gray;
width : 200px;
height : 80px;
float: left;
padding-top: 25px;
padding-left: 20px;
padding-right: 20px;
font-size: 18px;
text-align :center;
}
.record_table{

}
</style>
<script type="text/javascript">
window.onload=function(){
	document.getElementById("season").style.display = "none";
	document.getElementById("game").style.display = "block";
	
}
function disp_div(id) {
	document.getElementById("season").style.display = "none";
	document.getElementById("game").style.display = "none";
	document.getElementById(id).style.display = "block";
}
function list_disp(id) {
	var disp = document.getElementById(id);
	if(disp.style.display == 'block') {
		disp.style.display = "none";
	} else {
		disp.style.display = "block";
	}
}
</script>
</head>
<body>
<div class="pageheader">
<h5>등록선수</h5>
</div>
<div class="info_mid">
<div class="info_full">
<div class="info_box">
<div class="info_box_box">
<div style="float: left;"><img src="${path}/picture/team_players/${param.pCode}.jpg"></div>
<c:forEach var="i" begin="0" end="5">
<div><dl><dt>${pinfo.psu[i]}</dt><dd>${pinfo.pco[i]}</dd></dl></div>
</c:forEach>
</div>
</div>
</div>
</div>
	<div  class="info_top">
		<div><a href="javascript:disp_div('season')">
			<div class="pinfo_menu" style="margin-left: 0px; left: 0px;">
			시즌별 기록</div></a>
			<a href="javascript:disp_div('game')">
			<div class="pinfo_menu" style="margin-left: 0px; left: 200px;">
			경기별 기록</div></a>
		</div>
	</div>
<div class="record_table"> <!-- 테이블 단 -->
<div id="season">
<c:forEach items="${seasonrecord}" var="v">
${v}
</c:forEach>
</div>
<div id="game">
<c:forEach items="${gamerecord}" var="v">
${v}
</c:forEach>
</div>
</div>
</body>
</html>