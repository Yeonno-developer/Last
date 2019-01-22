<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>댓글 삭제</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>

	<form:form modelAttribute="comment" action="../comment/commentdeletefrom.shop">
	<input type="hidden" value="${param.comnum}" name="comnum">
	<div class="w3-card-4 w3-container w3-display-middle" style="width:1200px; height:100px; margin-top:120px">
		<table>
			<tr>
				<td>댓글 비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td ><input type="submit" value="삭제"></td>
			</tr>
		</table>
		</div>
	</form:form>
</body>
</html>