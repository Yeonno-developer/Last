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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lobster&effect=brick-sign">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.f {
	width: 1060px;
	margin: auto;
}

table {
	border-collapse: collapse;
	margin-bottom: 25px;
	width: 500px;
}

th {
	border-bottom: 3px solid;
	padding: 0px 15px 0px 15px;
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
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script><script>
		$(document).ready(function() {
			$(document).ready(function() {
				if(${sessionScope.loginUser==null}){
					$("#post").attr("disabled",true);
					$("input").attr("disabled",true)
 						.attr("placeholder","Please Login");
				}
			});
			 $("#post").click(function(){
				    if($("#comment").val()==''){
				    	alert("Please enter comment");
				    	return false;
				    }  
				    if($("#pass").val()==''){
				    	alert("Please enter pass");
				    	return false;
				    } 
				    $("#nextpa").submit();
			});
		});
	</script>
	<script type="text/javascript">
		$(window).on("load resize ", function() {
		  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
		  $('.tbl-header').css({'padding-right':scrollWidth});
		}).resize();
	</script>
	<hr style="border-top: 1px solid gray;">
	<div class="f w3-row" style="margin-bottom: 30px; margin-top: 30px">
		<div class="f w3-col s6">
		<table>
			<tr>
				<th style="vertical-align:bottom; text-align: left;"><h1>${board.subject}</h1></th>
				<th style=" vertical-align:bottom; text-align: right;"><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></th>
			<tr>
				<%--
							<td height="23">${boardcnt}
							<c:set var="boardcnt" value="${boardcnt -1}" />
							<td align="left">
							--%>
				<td class="bo">${board.name}</td>
				<td class="bo">${board.readcnt}</td>
			</tr>
			<tr>
				<td class="bo" style="height: 300px; vertical-align: top;">${board.name}</td>
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
			  <td colspan="2" align="left" style="padding: 20px 0px 20px 0px;"
				class="w3-lobster font-effect-brick-sign w3-large bo">
				<c:forEach items="${sessionScope.teamCode}" var="test">
					<c:if test="${test.value==param.tcode}">  Team Board ${test.key}</c:if>
				</c:forEach>
			  </td>
			</tr>
		</table>
		</div>
		<div class="w3-col s6" style="margin-top: 40px">
			<form:form action="reply.shop?tcode=${param.tcode}" method="post" name="f" id="nextpa"
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
						<div class="w3-row-padding" style="padding: 32px 16px 0px 16px;margin: 16px 16px 0px 16px">
						
							<div class="w3-half">
								<label>Comment</label> <input class="w3-input w3-border"
									type="text" id="comment" name="Comment" placeholder="Comment">
							</div>
							<div class="w3-half">
								<label>Pass</label> <input class="w3-input w3-border"
									name="pass" id="pass" type="password" placeholder="Pass">
							</div>
							<button type="button" id="post"
								class="w3-button w3-theme w3-margin w3-padding">
								<i class="fa fa-pencil"></i> Post
							</button>
							<span class="w3-padding-large w3-right" style="margin-top: 20px"><b>Comments</b> <span
								class="w3-tag">${ccount}</span></span>
						</div>
						<div class="w3-row "
							style="padding: 16px 16px 22px 24px; margin: 0px 16px 0px 16px">
							<c:forEach items="${boardreply}" var="boardt">
								<div class="w3-row">
									<div class="w3-col s2">
										${boardt.name}
									</div>
									<div class="w3-col s10" style="text-align: right; padding-right:15px">
										<fmt:formatDate value="${boardt.regdate}" pattern="YYYY.MM.HH" />
									</div>
								</div>
								<div class="w3-row" style="text-align: right; ">
									<c:if test="${sessionScope.loginUser.userId==boardt.name}">
										<a	href="update.shop?num=${board.num}" class="w3-button">����</a>
										<a	href="delete.shop?num=${board.num}" class="w3-button">Del</a>
									</c:if>
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