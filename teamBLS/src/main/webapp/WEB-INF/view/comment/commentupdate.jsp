<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<div class="w3-display-middle w3-card-4" style="margin-top:120px; padding-left: 50px; width:1100px; height:450px">
<form:form modelAttribute="comment" action="../comment/commentupdatefrom.shop">
	<input type="hidden" value="${param.comnum}" name="comnum">
	<table>
	<div style="margin-top:50px">
 	   	<tr><td width="100px">작성자</td><td width="500px"><input type="text" name="writer"></td>
			<td width="100px">비밀번호</td><td width="500px"><input type="password" name="password"></td></tr>
 	   	<tr><td colspan="4" style="padding-top:50px"><textarea  name="contents" cols="110" rows="10"></textarea></td></tr>
 	   	<tr><td><input type="submit" value="수정" class="w3-btn w3-red"></td></tr>
 	   	</div>
	</table>
</form:form>
</div>
</body>
</html>