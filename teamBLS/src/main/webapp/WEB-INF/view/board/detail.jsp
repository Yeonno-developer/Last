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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
div.w3-row {
	width: 1100px;
	margin-top: 25px;
	margin-bottom: 25px;
}

table {
	border-collapse: collapse;
	border-top: 1px solid #444444;
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
	<div class="w3-main w3-padding-32"
		style="margin-left: 410px; margin-right: 410px;">
		<div class="w3-card-4 w3-margin w3-padding-large w3-white">
			<div class="w3-row">
				<div class="w3-col s7 w3-xxxlarge">
					Title: <b>${board.subject}</b>
				</div>
				<div class="w3-col s3 w3-right-align">
					<fmt:formatDate value="${board.regdate}" pattern="YYYY.MM.HH" />
				</div>
			</div>
			<div class="w3-container">
				<h5>
					Writer : ${board.name} <span class="w3-opacity"> </span>
				</h5>
			</div>
			<c:if test="${!empty board.fileurl}">
			<img src="../file/${board.fileurl}" alt="Nature" style="width: 100%">
			</c:if>
			<div class="w3-container">
				<p></p>
				<div class="w3-row">
					<!-- 
					<div class="w3-col m8 s3">
						<p>
							<button class="w3-button w3-padding-large w3-white w3-border">
								<b>READ MORE</b>
							</button>
						</p>
					</div>
					 -->
					<div class="w3-col s6">
						<a href="reply.shop?num=${board.num}" class="w3-button">Ans</a> <a
							href="update.shop?num=${board.num}" class="w3-button">수정</a> <a
							href="delete.shop?num=${board.num}" class="w3-button">Del</a> <a
							href="list.shop" class="w3-button">List</a>
					</div>
					<div class="w3-col m4 w3-hide-small">
						<p>
							<span class="w3-padding-large w3-right"><b>Comments</b> <span
								class="w3-tag">${ccount}</span></span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="w3-row-padding w3-margin w3-padding">
			<form:form action="reply.shop" method="post" name="f"
				modelAttribute="board">
				<input type="hidden" name="num" value="${board.num}">
				<input type="hidden" name="ref" value="${board.ref}">
				<input type="hidden" name="reflevel" value="${board.reflevel}">
				<input type="hidden" name="refstep" value="${board.refstep}">
				<input type="hidden" name="subject" value="reply">
				<input type="hidden" name="name"
					value="${sessionScope.loginUser.userId}">
				<div class="w3-col m12">
					<div class="w3-card w3-round w3-white">
						<div class="w3-row-padding w3-margin w3-padding-16">
							<div class="w3-half">
								<label>Reply</label> <input class="w3-input w3-border"
									type="text" name="content" placeholder="Reply">
							</div>
							<div class="w3-half">
								<label>Pass</label> <input class="w3-input w3-border"
									name="pass" type="password" placeholder="Pass">
							</div>
							<button type="button"
								class="w3-button w3-theme w3-margin w3-padding"
								onclick="javascript:document.f.submit()">
								<i class="fa fa-pencil"></i> Post
							</button>
						</div>
						<div class="w3-row w3-margin w3-padding"
							style="padding-top: -100px; margin-bottom: 20px">
							<c:forEach items="${boardreply}" var="boardt">
								<div>${boardt.name}</div>
								<div>
									<fmt:formatDate value="${boardt.regdate}" pattern="YYYY.MM.HH" />
								</div>
								<div>${boardt.content}</div>

							</c:forEach>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>