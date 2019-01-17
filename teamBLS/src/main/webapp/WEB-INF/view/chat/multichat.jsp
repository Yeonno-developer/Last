<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<title>Socket.io Chat Example</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<head>
<meta charset="EUC-KR">
<style type="text/css">
div.test1 {
	width: 1060px;
	margin: auto;
	margin-bottom: 25px;
}
</style>
<title>Socket.IO chat</title>
<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<hr style="border-top: 1px solid gray;">
	<div class="test1">
		<h1>실시간 채팅</h1>
	</div>
	<div class="test1" style="height: 1000px">
	<c:if test="${sessionScope.loginUser.userId!=null}">
		<iframe name="userId" src="http://192.168.0.157:3000?id=${sessionScope.loginUser.userId}"
			style="width: 1000px; height: 1000px; border:0px;">
		</iframe>
	</c:if>
 	<c:if test="${sessionScope.loginUser.userId==null}">
		<iframe sandbox="/" src="http://192.168.0.157:3000?id=${sessionScope.loginUser.userId}"
			style="width: 1000px; height: 1000px; border:0px;">
		</iframe>
	</c:if> 
	</div>
</body>
</html>
