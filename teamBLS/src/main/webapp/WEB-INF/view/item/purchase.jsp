<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문 전 상품 목록 보기</title>
<style type="text/css">
table {width:90%; border-collpase: collapse;}
th, td {border : 3px solid #bcbcbc; text-align : center; padding : 8px;}
th {background-color: #4CAF50; color:white; text-align: center;}
td {background-color: #f2f2f2;}
td.title {background-color : # e2e2e2; color:blue};
</style>
<script>

</script>
</head>
<body>
<form action="item/payment" method="post" >
 <table>
	<tr><td width="30%" class="title">구매자 ID</td>
	<td width="70%">${sessionScope.loginUser.userId }</td></tr>
	<tr><td width="30%" class="title">이름</td>
	<td width="70%">${sessionScope.loginUser.userName }</td></tr>
	<tr><td width="30%" class="title">우편번호</td>
	<td width="70%">${sessionScope.loginUser.postcode }</td></tr>
	<tr><td width="30%" class="title">주소</td>
	<td width="70%">${sessionScope.loginUser.addr}${sessionScope.loginUser.addr1}</td></tr>
	<tr><td width="30%" class="title">전화번호</td>
	<td width="70%">${sessionScope.loginUser.tel }</td></tr>
	<tr><td width="30%" class="title">이메일</td>
	<td width="70%">${sessionScope.loginUser.email }</td></tr>
</table><br><br>
<h2>구매 할 상품 목록</h2>
<table>
	<tr><td>상품명</td><td>상품가격</td><td>수량</td><td>총금액</td>
	<tr><td>${name}</td>
	    <td>${price}원</td>
	    <td>${quantity}</td>
	    <td>${price * quantity}</td></tr>
	<tr><td colspan="4" style="text-align: right">총금액:
		<fmt:formatNumber value="${price * quantity }"	pattern="#,###"/>원
	</td></tr>
	<tr><td colspan="4">
	<input type="submit" value="결제하기" /> &nbsp;
	<a href="../item/list.shop">상품록록</a>
	</td></tr>
</table> 
</form>
</body>
</html>