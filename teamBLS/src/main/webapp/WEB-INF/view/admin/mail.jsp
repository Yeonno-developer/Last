<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메일 보내기</title>
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script type="text/javascript">
	function naveridchk(f){
		if(f.naverid.value == ""){
			alert("네이버 아이디를 입력하세요");
			f.naverid.focus();
			return false;
		}
		if(f.naverpw.value == ""){
			alert("네이버 비밀번호를 입력하세요");
			f.naverpw.focus();
			return false;
		}
	}
</script>
</head>
<body>
<h2>메일보내기</h2>
<form action="mail.shop" name="mailform" method="post" enctype="multipart/form-data" onsubmit="return naveridchk(this)">
네이버 메일 주소:<input type="text" name="naverid">
네이버 메일 비밀번호:<input type="password" name="naverpw">	
	<table border="1" style="border-collapse:collapse; width: 100%">
		<tr><td>보내는 사람</td><td>${loginUser.email }</td></tr>
		<tr><td>받는사람</td>
		<td><input type="text" name="recipient" size="100" 
		value='<c:forEach items="${userList}" var="user">${user.userName} &lt;${user.email}&gt;,</c:forEach>'></td></tr>
		<tr><td>제목</td><td><input type="text" name="title" size="100"></td></tr>
		<tr><td>메세지형식</td>
			<td><select name="mtype"><option value="text/html; charset=euc-kr">HTML</option>
				<option value="text/plain; charset=euc-kr">TEXT</option></select></td></tr>
		<tr><td>첨부파일1</td><td><input type="file" name="file1"></td></tr>
		<tr><td>첨부파일2</td><td><input type="file" name="file1"></td></tr>
		<tr><td colspan="2">
			<textarea rows="10" cols="120" name="contents"></textarea>
			<script type="text/javascript">CKEDITOR.replace('contents')</script>
		</td></tr>
		<tr><td colspan="2" align="center">
			<input type="submit" value="메일보내기">
		</td></tr>
	</table>
</form>
</body>
</html>