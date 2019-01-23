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




<style type="text/css">
h1#scro {
	font-size: 30px;
	color: #fff;
	text-transform: uppercase;
	font-weight: 300;
	text-align: center;
	margin-bottom: 15px;
}

table#scro {
	width: 100%;
	table-layout: fixed;
}

.tbl-header {
	background-color: rgba(255, 255, 255, 0.3);
}

.tbl-content {
	height: 300px;
	overflow-x: auto;
	margin-top: 0px;
	border: 1px solid rgba(255, 255, 255, 0.3);
}

td.scro {
	padding: 2px 5px 2px 0px;
	text-align: right;
	vertical-align: middle;
	font-weight: 100;
	font-size: 12px;
	border-color: bdbebe;
	border-bottom: solid 1px rgba(255, 255, 255, 0.1);
	border-bottom: 1px solid;
}

td.scrt {
	padding: 2px 0px 2px 5px;
	text-align: left;
	vertical-align: middle;
	font-weight: 500;
	border-color: bdbebe;
	font-size: 15px;
	border-bottom: solid 1px rgba(255, 255, 255, 0.1);
	border-bottom: 1px solid;
}

/* demo styles */
@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

/* for custom scrollbar for webkit browser*/
::-webkit-scrollbar {
	width: 6px;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}

::-webkit-scrollbar-thumb {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
}
</style>





</head>
<body>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$(document).ready(function() {
				if(${sessionScope.loginUser==null}){
					$("#post").attr("disabled",true);
					$("input").attr("disabled",true)
 						.attr("placeholder","Please Login");
				}
			});
			 $("#post").click(function(){
				    if($("#content").val()==''){
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
	<script type="text/javascript">
		function fun_delR(delnum) {
			var del=delnum;
			 document.getElementById('delnum').value=del;
			document.getElementById('download').style.display='block';
		}

		function fun_delD(delnum) {
			var del=delnum;
			 document.getElementById('delnum').value=del;
			document.getElementById('download').style.display='block';
		}
	</script>
	<div id="download" class="w3-modal w3-animate-opacity">
		<div class="w3-modal-content" style="padding: 32px">
			<form id="ff" action="delete.shop" method="post">
				<div class="w3-container w3-white">
					<h2 class="w3-wide">Delete Check</h2>
					<p>
						<input class="w3-input w3-border" name="pass" type="password" placeholder="Please Input Pass">
						<input name="delnum" id="delnum" type="hidden" value="">
						<input name="num" type="hidden" value="${param.num}">
						<input name="tcode" type="hidden" value="${param.tcode}">
					</p>
					<div style="text-align:right;">
					<button type="button" class="w3-button w3-black w3-margin-bottom"
						onclick="document.getElementById('ff').submit()">Delete</button>
					<button type="button" class="w3-button w3-red w3-margin-bottom"
						onclick="document.getElementById('download').style.display='none'">cancle</button>
					</div>
				</div>
			</form>
		</div>
	</div>


	<hr style="border-top: 1px solid gray;">
	<div class="f w3-row" style="margin-bottom: 30px; margin-top: 30px">
		<div class="f w3-col s6">
			<table>
				<tr>
					<th style="vertical-align: bottom; text-align: left;"><h1>${board.subject}</h1></th>
					<th style="vertical-align: bottom; text-align: right;"><fmt:formatDate
							value="${board.regdate}" pattern="yyyy-MM-dd" /></th>
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
					<td colspan="2" class="bo" style="height: 380px; vertical-align: top;">${board.content}</td>
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
					<td align="left" style="padding: 20px 0px 20px 0px;"
						class="w3-lobster font-effect-brick-sign w3-large bo"><c:forEach
							items="${sessionScope.teamCode}" var="test">
							<c:if test="${test.value==param.tcode}">  Team Board ${test.key}</c:if>
						</c:forEach></td>
					<td align="right" class="bo">
					 <c:if test="${sessionScope.loginUser.userId==board.name}">
						<a href="update.shop?num=${board.num}" class="w3-button">수정</a>
						<a class="w3-button" onclick="fun_delD(${board.num})"> Del</a>
					</c:if>
						<a class="w3-button" href="list.shop?tcode=${board.tcode}">List</a>
					</td>
				</tr>
			</table>
		</div>
		<div class="w3-col s6" style="margin-top: 40px">
			<form:form action="reply.shop?tcode=${param.tcode}" method="post"
				name="f" id="nextpa" modelAttribute="board">
				<input type="hidden" name="num" value="${board.num}">
				<input type="hidden" name="ref" value="${board.ref}">
				<input type="hidden" name="reflevel" value="${board.reflevel}">
				<input type="hidden" name="refstep" value="${board.refstep}">
				<input type="hidden" name="subject" value="reply">
				<input type="hidden" name="name"
					value="${sessionScope.loginUser.userId}">
				<div class="w3-col m12">
					<div class="w3-card w3-round w3-white" style="padding-bottom: 12px">
						<div class="w3-row-padding"
							style="padding: 32px 16px 0px 16px; margin: 16px 16px 0px 16px">

							<div class="w3-half">
								<label>Comment</label> <input class="w3-input w3-border"
									type="text" id="content" name="content" placeholder="Comment">
							</div>
							<div class="w3-half">
								<label>Pass</label> <input class="w3-input w3-border"
									name="pass" id="pass" type="password" placeholder="Pass">
							</div>
							<button type="button" id="post"
								class="w3-button w3-theme w3-margin w3-padding">
								<i class="fa fa-pencil"></i> Post
							</button>
							<span class="w3-padding-large w3-right" style="margin-top: 20px"><b>Comments</b>
								<span class="w3-tag">${ccount}</span></span>
						</div>
						<div class="w3-row tbl-content"
							style="padding: 8px 8px 8px 8px; margin: 16px 16px 16px 16px; border: 1px solid; border-color: #d3d4d5">
							<table cellpadding="0" cellspacing="0" border="0" id="scro">
								<tbody>
									<c:forEach items="${boardreply}" var="boardt">
										<tr>
											<td class="scrt" colspan="2" style="background-color: #e1e2e2">${boardt.name}</td>
											<td class="scro" style="background-color: #e1e2e2"><fmt:formatDate
													value="${boardt.regdate}" pattern="yyyy.MM.dd" /></td>
										</tr>
										<tr>
											<td class="scrt" colspan="2">${boardt.content}</td>
											<td class="scro"><c:if
													test="${sessionScope.loginUser.userId==boardt.name}">
													<%-- <a href="update.shop?num=${board.num}" class="w3-button">수정</a> --%>
													<%-- <a href="delete.shop?num=${board.num}" class="w3-button">Del</a> --%>
													<a class="w3-button" onclick="fun_delR(${boardt.num})">
														Del</a>
												</c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>