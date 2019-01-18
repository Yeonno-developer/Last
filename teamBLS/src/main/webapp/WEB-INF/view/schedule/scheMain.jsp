<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Basketball Schedule</title>
<style type="text/css">
div#tMian {
	width: 1060px;
	margin: auto;
	margin-bottom: 25px;
}
</style>
<style type="text/css">
table {
	padding: 20px 0px 100px 0px;
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

table {
	font: 13px/1.4 'NotoSansKR', Dotum, '돋움', Gulim, '굴림', Arial, Helvetica,
		sans-serif;
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
	</script>
	<script type="text/javascript">
	$(function () {
		//현재 표시되는 년도와 달을 select box와 동기화 (submit 할시 값 유지)
		$('select[name=SchYear] > option[value=' + '${SchYear}' + ']').attr('selected', true);
		$('select[name=SchMonth] > option[value=' + '${SchMonth}' + ']').attr('selected', true);
	});

	function fun_search() {
		$('Select[name=SchYear]').val();
		$('Select[name=SchMonth]').val();
 		$('form').submit();
	}
	</script>
	<hr style="border-top: 1px solid gray;">
	<div id="tMian" style="margin-top: 20px">
		<form method="post" action="CrowlingSchduleF.shop">
		<div class="w3-row">
			<div class="w3-col s10">
				<h1>Basketball Schedule</h1>
			</div>
			<div class="w3-col s1" style="padding-top: 50px">
				<select id="SchYear" name="SchYear" onchange="fun_search()">
					<c:forEach items="${year}" var="y">
						<option value="${y}">${y}년</option>
					</c:forEach>
				</select>
			</div>
			<div class="w3-col s1" style="padding-top: 50px;">
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