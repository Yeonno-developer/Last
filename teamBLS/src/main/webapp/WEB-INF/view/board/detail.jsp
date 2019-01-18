<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Board Content</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
div.w3-row {
	width: 1100px;
	margin: auto;
	margin-top: 25px;
	margin-bottom: 25px;
}


img#backImg {
	width: 300px;
	margin-left: 800px;
	margin-top: 170px;
}

.f {
	width: 1060px;
	margin-left: 410px;
	margin-top: -1px;
}

table {
	border-collapse: collapse;
	margin-bottom: 25px;
}

th {
	border-top: 3px solid;
	border-bottom: 3px solid;
}

td.bo {
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
	<div class="f">
		<table>
		 <tr>
		  <td class="w3-xlarge">
		   ${board.subject}
		  </td>
		 </tr>
		 <tr>
		  <td colspan="2" align="left" style="padding-top: 30px"
			class="w3-lobster font-effect-brick-sign w3-small">
			<c:forEach items="${sessionScope.teamCode}" var="test">
				<c:if test="${test.value==param.tcode}">  Team Board ${test.key}</c:if>
			</c:forEach>
		  </td>
		 </tr>
		</table>
		<table>
			<tr align="center" valign="middle" bordercolor="#212121">
				<th width="14%" height="26">Writer</th>
				<th width="17%" height="26">Date</th>
			<tr align="center" valign="middle" bordercolor="#db9130">
				<%--
							<td height="23">${boardcnt}
							<c:set var="boardcnt" value="${boardcnt -1}" />
							<td align="left">
							--%>
				<td align="center" class="bo">${board.name}</td>
				<td align="center" class="bo"><fmt:formatDate value="${board.regdate}"
						pattern="yyyy-MM-dd" /></td>
				<td align="center" class="bo">${board.readcnt}</td>
			</tr>

			<%-- 
				<tr align="center" height="26">
					<td colspan="5"><c:if test="${ pageNum > 1}">
							<a href="javascript:list(${pageNum -1})" class="w3-button"
								onmouseover="this.style.backgroundColor='#e5e5e5'"
								onmouseout="this.style.backgroundColor=''">Before</a>
						</c:if> <c:if test="${ pageNum <=1}">
							<button class="w3-button w3-hover-white">Before</button>
						</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a==pageNum}">
								<button class="w3-button w3-brown">${a}</button>
							</c:if>
							<c:if test="${a!=pageNum}">
								<a href="javascript:list(${a})" class="w3-button"
									onmouseover="this.style.backgroundColor='#e5e5e5'"
									onmouseout="this.style.backgroundColor=''">${a}</a>
							</c:if>
						</c:forEach> <c:if test="${pageNum < maxpage}">
							<a href="javascript:list(${pageNum+1})" class="w3-button"
								onmouseover="this.style.backgroundColor='#e5e5e5'"
								onmouseout="this.style.backgroundColor=''">After</a>
						</c:if> <c:if test="${pageNum >= maxpage}">
							<button class="w3-button w3-hover-white">After</button>
						</c:if></td>
				</tr>
				 --%>

			<tr>
				<c:if test="${!empty sessionScope.loginUser}">
					<td colspan="3" align="right"><a
						href="write.shop?tcode=${param.tcode}" class="w3-button"
						onmouseover="this.style.backgroundColor='#e5e5e5'"
						onmouseout="this.style.backgroundColor=''">Write</a></td>
				</c:if>
			</tr>
		</table>
	</div>
</body>
</html>