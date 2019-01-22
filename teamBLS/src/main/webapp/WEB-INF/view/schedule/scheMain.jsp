<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Basketball Schedule</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<style type="text/css">
div#tMian {
	width: 1060px;
	margin: auto;
	margin-bottom: 25px;
}
</style>
<style type="text/css">
table {
	padding: 10px 0px 50px 0px;
}

th {
	background-color: #4c4f55;
	height: 30px;
}

td {
	max-width: 150px;
	min-width: 150px;
	border-top: 1px solid #ddd;
	position: relative;
	padding: 10px;
	padding-top: 15px;
	padding-bottom: 15px;
	vertical-align: top;
	border: 1px solid #ddd;
	display: table-cell;
	text-align: right;
}

.n_calendar, .calendar_list, table.calendar_tb, td, span.date_num2 {
	font-weight: bold;
	color: #333;
	top: 8px;
}

.date_num1, .date_num2 {
	font-size: large;
}

.date_num1, .date_num2 {
	color: red;
}

span {
	color: #6BCAE5;
}

table {
	font: 13px/1.4 'NotoSansKR', Dotum, '돋움', Gulim, '굴림', Arial, Helvetica,
		sans-serif;
	color: #666;
}

#title {
	font-family: 'Do Hyeon', sans-serif;
	color: #666;
}
</style>
</head>

<body>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).on('click', 'a[target="_top"]', function(e) {
			e.preventDefault();
		});
		$(function(){
			
			$('#b').click(function(){
				var y=$('select[name=SchYear]').val();
				var m=$('select[name=SchMonth]').val();
				if(m==01){
					$("select[name=SchYear] > option:selected")
				        .prop("selected", false)
				        .next()
				        .prop("selected", true);
					$('select[name=SchMonth] > option[value=12]')
						.attr('selected', true);
				} else{
				$("select[name=SchMonth] > option:selected")
			        .prop("selected", false)
			        .prev()
			        .prop("selected", true);
				}
			});
			$('#a').click(function(){
				var y=$('select[name=SchYear]').val();
				var m=$('select[name=SchMonth]').val();
				if(m==12){
					$("select[name=SchYear] > option:selected")
				        .prop("selected", false)
				        .prev()
				        .prop("selected", true);
					$('select[name=SchMonth] > option[value=01]')
					.attr('selected', true);
				} else {
				$("select[name=SchMonth] > option:selected")
			        .prop("selected", false)
			        .next()
			        .prop("selected", true);
				}
			});
		});
	</script>
	<script type="text/javascript">
		$(function() {
			//현재 표시되는 년도와 달을 select box와 동기화 (submit 할시 값 유지)
			$('select[name=SchYear] > option[value=' + '${SchYear}' + ']')
					.attr('selected', true);
			$('select[name=SchMonth] > option[value=' + '${SchMonth}' + ']')
					.attr('selected', true);
		});

		function fun_search() {
			$('select[name=SchYear]').val();
			$('select[name=SchMonth]').val();
			$('form').submit();
		}
	</script>

	<hr style="border-top: 1px solid gray;">
	<div id="tMian" style="margin-top: 20px">
		<form method="post" action="CrowlingSchduleF.shop">
			<h1>Basketball Schedule</h1>
			<div class="w3-row">
				<div class="w3-col s5" style="margin-left: 380px">
					<div class="w3-xxlarge" id="title">
						<button class="w3-button" id="b">
							<i class="fas fa-angle-left"></i>
						</button>
						${SchYear}년 ${SchMonth}월
						<button class="w3-button" id="a">
							<i class="fas fa-angle-right"></i>
						</button>
					</div>
				</div>
				<div class="w3-col s1" style="padding: 40px 0px 0px 30px; margin-left: 60px; text-align: right;">
					<select id="SchYear" name="SchYear" onchange="fun_search()">
						<c:forEach items="${year}" var="y">
							<option value="${y}">${y}년</option>
						</c:forEach>
					</select>
				</div>
				<div class="w3-col s1" style="padding-top: 40px; text-align: right;">
					<select id="SchMonth" name="SchMonth" onchange="fun_search()">
						<c:forEach items="${month}" var="m">
							<option value="${m}">${m}월</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</form>
		${schedule}
	</div>
</body>
</html>