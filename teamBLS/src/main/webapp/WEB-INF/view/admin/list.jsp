<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
.list_table{
margin : 50px 200px 50px 200px;

}

</style>
<script type="text/javascript">
	function allchkbox(chk){
		var chks = document.getElementsByName("idchks");
		for(var i=0;i < chks.length;i++){
			chks[i].checked = chk.checked;
		}
	}
</script>
</head>
<body>
<div class="list_table">
<table border="1" style="border-collapse: collapse; width:100%;" class="w3-table-all">
<tr><th>���̵�</th>
	<th>�̸�</th>
	<th>��ȭ��ȣ</th>
	<th>�̸���</th>
	<th>�����ȣ</th>
	<th>�ּ�</th>
	<th>���ּ�</th>
	<th>�����ϴ� ��</th>
	<th>�����ϴ� ����</th>
	<th>���</th></tr>
<c:forEach items="${userlist}" var="user">
<tr><td>${user.userId}</td>
<td>${user.userName}</td>
<td>${user.tel}</td>
<td>${user.email}</td>
<td>${user.postcode}</td><td>${user.addr}</td><td>${user.addr1}</td><td>${user.ft}</td><td>${user.fp}</td>
	<td><a href="../user/updateForm.shop?id=${user.userId}">����</a>
		<a href="../user/delete.shop?id=${user.userId}">����</a>
		</td>
</c:forEach>
</table>
</div>
</body>
</html>