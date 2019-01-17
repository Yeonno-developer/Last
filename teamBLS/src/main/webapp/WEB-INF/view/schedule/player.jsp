<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head>
<meta charset="EUC-KR">
<title>Player Rank</title>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript"
	src="https://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript"
	src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
<style type="text/css">
div#main {
	width: 1060px;
	margin: auto;
	margin-bottom: 25px;
}

table {
	border-collapse: collapse;
	border-top: 1px solid #444444;
	margin-bottom: 62px;
	width: 250px;
	margin-top: 5px
}

td {
	border-bottom: 1px solid #444444;
	padding: 5px;
}

</style>
</head>
<body>
	<hr style="border-top: 1px solid gray;" class="w3-padding">
	<div id="main" class="w3-row">
	<h1>Player Rank</h1>
		<div class="w3-col s2">
			<c:forEach items="${pcode}" var="name" varStatus="startc">
				<c:if test="${startc.index%5==0}">
					<a href="${path}/team/pl.shop?pCode=${name}">
						<img src="${path}/picture/team_players/${name}.jpg" class=" w3-border" style="margin: 26px 10px 40px 0px; padding:10px; height: 185px">
					</a>
				</c:if>
			</c:forEach>
		</div>
		<div class="w3-col s3" style="margin-right: 25px; padding-top: 22px;">
			<table>
				<c:forEach items="${Pkey}" var="start" varStatus="startc">
					<c:if test="${startc.first}">
						<c:set var="i" value="${startc.index}" />
						<c:set var="imgr" value="0" />
						<c:set var="r" value="1" />
					</c:if>
					<c:if test="${i%5==0}">
						<c:set var="st" value="${i}" />
						<c:set var="end" value="${i+4}" />
							<c:forEach items="${Pkey}" var="key" varStatus="varc"
								begin="${st}" end="${end}">
								<c:if test="${varc.index%5==0}">
									<tr><img src="${path}/picture/rank/tit_sub_s0${imgr}.gif"></tr>
									<c:set var="imgr" value="${imgr+1}" />
								</c:if>
								<c:if test="${varc.first}">
									<tr>
								</c:if>
								<c:if test="${varc.index%5==0}">
									<c:set var="r" value="1" />
								</c:if>
									<td style="width: 20px;">${r}.</td>
									<td colspan="2" style="text-align: left;">${varc.current}</td>
								<c:forEach items="${Pvalue}" var="value" varStatus="valuec"
									begin="${st}" end="${end}">
									<c:if test="${varc.index==valuec.index}">
										<td style="text-align: right;">${valuec.current}</td>
									</tr>
									<tr>
									</c:if>
								</c:forEach>
								<c:set var="r" value="${r+1}" />
							</tr>
							</c:forEach>
						</tr>
					</c:if>
					<c:set var="i" value="${i+1}" />
					<c:if test="${startc.index%5==0}">
						</table>
						<table>
					</c:if>
				</c:forEach>
			</table>
		</div>
		<div class="w3-col s5">
			<c:forEach items="${Pkey}" var="start" varStatus="startc">
				<c:if test="${startc.first}">
					<c:set var="i" value="${startc.index}" />
				</c:if>
				<c:if test="${i%5==0}">
					<div id="chart${i}" style="height: 250px; width: 450px;"></div>
					<script type="text/javascript">
			   		var randomColorFactor=function(){
			   			return Math.round(Math.random()*255);
			   		}
			   		var randomColor=function(opacity){
			   			return "rgba("+randomColorFactor()+","
			   			+randomColorFactor()+","	+randomColorFactor()+","
			   			+(opacity||'.3')+")";
			   		};
					if (${i%5==0||i==0}){
					var dom = document.getElementById("chart${i}");
					<c:set var="st" value="${i}" />
					<c:set var="end" value="${i+4}" />
					}
					var myChart = echarts.init(dom);
					var app = {};
					option = null;
					option = {
						color : [ randomColor(1) ],
						tooltip : {
							trigger : 'axis',
							axisPointer : {
								type : 'shadow'
							}
						},
						grid : {
							left : '1%',
							right : '1%',
							bottom : '1%',
							containLabel : true
						},
						xAxis : [ {
							type : 'category',
							data : [<c:forEach items="${Pkey}" var="key" varStatus="varc" begin="${st}" end="${end}">"${varc.current}"<c:if test="${varc.index!=end}">,</c:if></c:forEach>],
							axisTick : {
								alignWithLabel : true
							}
						} ],
						yAxis : [ {
							type : 'value'
						} ],
						series : [ {
							name : 'test',
							type : 'bar',
							data : [<c:forEach items="${Pvalue}" var="value" varStatus="valuec" begin="${st}" end="${end}">"${valuec.current}"<c:if test="${valuec.index!=end}">,</c:if></c:forEach>]} ]
					};
					;
					if (option && typeof option === "object") {
						myChart.setOption(option, true);
					}
				</script>
				</c:if>
				<c:set var="i" value="${i+1}" />
			</c:forEach>
		</div>
	</div>

</body>
</html>