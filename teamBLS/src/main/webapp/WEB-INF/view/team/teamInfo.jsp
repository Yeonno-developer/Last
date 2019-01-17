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
height : 500px;
display:none;
}
.info_menu {
	width: 1200px;
	margin-left: 10px;
}
.info_menu_su {
	width: 200px;
	height: 50px;
}
.info_su {
	float: left;
	width: 120px;
	margin-left: 50px;
}
.info_con {
	margin-left: 400px;
	width: 360px;
}
.info_img {
	border-top-left-radius: 1px; border : solid;
	border-color: gray;
	align-content: center;
	width: 200px;
	height: 200px;
	border: solid;
}
.info_top{
margin-top : 50px;
margin-left: 660px;
margin-right: 360px;
width : 1200px;
height: 150px;

}
.info_top_menu{
border : 1px solid gray;
width : 200px;
height : 50px;
float: left;
padding-top: 11px;
padding-left: 20px;
padding-right: 20px;
font-size: 18px;
text-align :center;
}
.info_full{
width : 840px;
padding: 100px 20px 20px 20px;
background: #bababa url("${path}/picture/teams/team_bg.jpg") no-repeat 0 0;
overflow: hidden;
margin-left: 180px;
}
.plist {
float: left;
border: outset 0.7px;
margin: 7px;
}
.player_img{
background: no-repeat 0 0;
width: 117px;
padding: 7px 7px 7px 7px;
margin-right: 6px;
}
.info_box{
width: 800px;
padding: 20px;
background: #fff;
}
.record_table{
margin-left: 490px !important;
width: 940px !important;
height: 500px;
margin-bottom: 20px;
}
.record_table table{
color :#1b2637;
border-collapse : collapse;
padding: 20px 20px 20px 0px;
margin-bottom: 20px;
}
tr{
height: 50px;
}
th{
border-top: 2px solid;
border-bottom: 1px solid;
}
th td{
border-bottom-style: none !important;
}
 td{
 text-align: center;
 border-bottom: 1px solid #dbdbdb;
 color: #666;
 font: 12px/1.4 'NotoSansKR', Dotum, '돋움', Gulim, '굴림', Arial, Helvetica, sans-serif;
 }
 tfoot{
 	text-align: center;
    border-bottom: 1px solid #999999;
    border-right: 1px solid #dbdbdb;
    font-weight: 300;
    font-size: 14px;
    color: #666;
    background: #f7f7f7;
    padding: 14px 0 13px 0;
 }
</style>

<script type="text/javascript">
window.onload=function(){
	document.getElementById("tinfo").style.display = "none";
	document.getElementById("trecord").style.display = "none";
	document.getElementById("pinfo").style.display = "block";
	
}
function disp_div(id) {
	document.getElementById("tinfo").style.display = "none";
	document.getElementById("pinfo").style.display = "none";
	document.getElementById("trecord").style.display = "none";
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
	<div  class="info_top">
		<div><a href="javascript:disp_div('pinfo')">
			<div class="info_top_menu" style="margin-left: 0px; left: 0px;">
			팀소개</div></a>
			<a href="javascript:disp_div('tinfo')">
			<div class="info_top_menu" style="margin-left: 0px; left: 200px;">
			선수소개</div></a>
			<a href="javascript:disp_div('trecord')">
			<div class="info_top_menu" style="margin-left: 0px; left: 400px;">
			팀기록실</div></a>
		</div>
	</div>
	
	<div id="pinfo" class="info_mid">
		<div class="info_full">
		<div class="info_box">
			<div style="float: left;">
				<img class="info_img"
					src="${path}/picture/teams/info_logo/logo_${param.tcode}.gif">
			</div>
			<div>
				<div class="info_su">구단주</div>
				<div class="info_con">${teaminfo.infotxt1}</div>
			</div>
			<div>
				<div class="info_su">구단주 대행</div>
				<div class="info_con">
				<c:if test="${teaminfo.infotxt2 == ''}">
				-
				</c:if>
				<c:if test="${teaminfo.infotxt2 != ''}">
				${teaminfo.infotxt2}
				</c:if>
				</div>
				
			</div>
			<div>
				<div class="info_su">단장</div>
				<div class="info_con">${teaminfo.infotxt3}</div>
			</div>
			<div>
				<div class="info_su">감독</div>
				<div class="info_con">${teaminfo.infotxt4}</div>
			</div>
			<div>
				<div class="info_su">코치</div>
				<div class="info_con">${teaminfo.infotxt5}</div>
			</div>
			<div>
				<div class="info_su">주소</div>
				<div class="info_con">${teaminfo.infotxt6}</div>
			</div>
			<div>
				<div class="info_su">연고지 / 모기업</div>
				<div class="info_con">${teaminfo.infotxt7}</div>
			</div>
			<div>
				<div class="info_su">전화 / 팩스</div>
				<div class="info_con">${teaminfo.infotxt8}</div>
			</div>
		</div>
		</div>
</div>
<div id="tinfo"class="info_mid">
							<div style="margin-left: 100px;">
								<c:forEach items="${pCode}" var="pcode">
										<c:if test="${pcode.value==param.tcode}">
											<a href="${path}/team/pl.shop?pCode=${pcode.key}"><div class="plist">
											<div class="player_img">
											<img src="${path}/picture/team_players/${pcode.key}.jpg" style="width: 110px; height: 138px;">
											</div>
											</div></a>
										</c:if>
								</c:forEach>
							</div>
</div>
<div id="trecord">

<table class="record_table"> <!-- 테이블1 -->
<c:set var="size1" value="${table1.size}"/>
<tr>
<th>배번</th><th>선수</th><th>G</th><th>Min.</th><th>2P</th>
<th>2PA</th><th>%</th><th>3P</th><th>3PA</th><th>%</th>
<th>FG%</th><th>FT</th><th>FTA</th><th>%</th>
</tr>
<c:forEach var="i" begin="0" end="${size1-2}">
<tr>
<td>${table1.num[i]}</td>
<td>${table1.name[i]}</td>
<td>${table1.G[i]}</td>
<td>${table1.Min[i]}</td>
<td>${table1.P2[i]}</td>
<td>${table1.PA2[i]}</td>
<td>${table1.Per1[i]}</td>
<td>${table1.P3[i]}</td>
<td>${table1.PA3[i]}</td> 
<td>${table1.Per2[i]}</td> 
<td>${table1.FG[i]}</td> 
<td>${table1.FT[i]}</td>
<td>${table1.FTA[i]}</td>
<td>${table1.Per3[i]}</td>
</tr>
</c:forEach>
<tfoot><tr><c:forEach items="${table1.foot}" var="fo">
<td>${fo}</td>
</c:forEach></tr></tfoot>
</table>
<table class="record_table"> <!-- 테이블2 -->
<c:set var="size2" value="${table2.size}"/>
<tr>
<th rowspan="2">배번</th><th rowspan="2">선수</th><th colspan="2">REBOUNDS</th>
<th rowspan="2">RPG</th><th rowspan="2">Ast</th>
<th rowspan="2">APG</th><th rowspan="2">w/FT</th><th rowspan="2">w/oFT</th>
</tr><tr><th>Off</th><th>Def</th></tr>


<c:forEach var="i" begin="0" end="${size2-2}">
<tr>
<td>${table2.num[i]}</td>
<td>${table2.name[i]}</td>
<td>${table2.Off[i]}</td>
<td>${table2.Def[i]}</td>
<td>${table2.RPG[i]}</td>
<td>${table2.Ast[i]}</td>
<td>${table2.APG[i]}</td>
<td>${table2.wFT[i]}</td>
<td>${table2.woFT[i]}</td>
</tr>
</c:forEach>
<tfoot><tr><c:forEach items="${table2.foot}" var="fo">
<td>${fo}</td>
</c:forEach></tr></tfoot>
</table >
<table class="record_table"> <!-- 테이블1 -->
<c:set var="size3" value="${table3.size}"/>
<tr>
<th>배번</th><th>선수</th><th>STL</th><th>BS</th><th>GD</th>
<th>TO</th><th>DK</th><th>DKA</th><th>PTS</th><th>PPG</th>
</tr>
<c:forEach var="i" begin="0" end="${size3-2}">
<tr>
<td>${table3.num[i]}</td>
<td>${table3.name[i]}</td>
<td>${table3.STL[i]}</td>
<td>${table3.BS[i]}</td>
<td>${table3.GD[i]}</td>
<td>${table3.TO[i]}</td>
<td>${table3.DK[i]}</td>
<td>${table3.DKA[i]}</td>
<td>${table3.PTS[i]}</td>
<td>${table3.PPG[i]}</td>
</tr>
</c:forEach>
<tfoot><tr><c:forEach items="${table3.foot}" var="fo">
<td>${fo}</td>
</c:forEach></tr></tfoot>
</table>
</div>
</body>
</html>