<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Board Write</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lobster&effect=brick-sign">
<style type="text/css">
table {
	width: 1060px;
	margin: auto;
	margin-top: 25px;
	border-collapse: collapse;
	margin-bottom: 25px;
}

th {
	border-top: 3px solid;
	border-bottom: 3px solid;
}

td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

.w3-lobster {
	font-family: "Lobster", Sans-serif;
}
</style>
</head>
<body>
	<hr style="border-top: 1px solid gray;">
	<form:form modelAttribute="board" action="write.shop"
		enctype="multipart/form-data" name="f">
		<input type="hidden" name="tcode" value="${param.tcode}">
		<table>
			<tr>
				<td colspan="2" align="left" style="padding-top: 10px"
					class="w3-lobster font-effect-brick-sign w3-xxlarge"><c:forEach
						items="${sessionScope.teamCode}" var="test">
						<c:if test="${test.value==param.tcode}"> ${test.key} Team Board </c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<td align="center">Writer</td>
				<td><input type="text" name="name"
					value="${sessionScope.loginUser.userId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td align="center">Pass</td>
				<td><form:password path="pass" /><font color="red"><form:errors
							path="pass" /></font></td>
			</tr>
			<tr>
				<td align="center">Subject</td>
				<td><form:input path="subject" /><font color="red"><form:errors
							path="subject" /></font></td>
			</tr>
			<tr>
				<td align="center">Content</td>
				<td><form:textarea path="content" rows="15" cols="80" /> <font
					color="red"><form:errors path="content" /></font></td>
			</tr>
			<tr>
				<td align="center">File</td>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a
					href="javascript:document.f.submit()">[게시물등록]</a> <a
					href="list.shop?tcode=${param.tcode}">[Board List]</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>