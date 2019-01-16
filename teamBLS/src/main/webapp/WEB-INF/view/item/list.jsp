<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품목록</title>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
 <link rel="stylesheet" type="text/css" href="http://script.auction.co.kr/pc/style/css/hp.css" />
	<style>
		ul.high {
			background-color: #FFDAB9;
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
			align:center;
		}
		li.inhigh { float: left; 
		}
		li.inhigh a {
			display: block;
			background-color: #FFDAB9;
			color: #000000;
			padding: 8px;
			text-decoration: none;
			text-align: center;
			font-weight: bold;
		}
		li.inhigh a:hover {
			background-color: #CD853F;
			color: white;
		}
		.wrap {
		padding : 20px;
		margin : 10px;
		height:1500px;
		}
		.list_common{
		float: left;
		height:90%;
		}
		.prev1 {
			padding-top : 50%;
			margin : 10px;
			height:90%;
		}
		.next1 {
			padding-top : 50%;	
			margin : 10px;
			height:90%;
		}
	</style>

   <script>
    function prev(pagecount) {
    	alert(pagecount);

    	location.href="../item/list.shop?pagecount="+pagecount;
    }
    
   </script>
</head>
<body>
<a href="create.shop">상품등록</a>
<ul class="high">
		<li class="inhigh"><a href="../item/list.shop?type=1">| 울산 현대 모비스 |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=2">인천 전자랜드 |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=3">부산 KT |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=4">안양 KGC |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=5">전주 KCC |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=6">원주 DB |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=7">창원 LG |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=8">고양 오리온 |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=9">서울 SK |</a></li>
		<li class="inhigh"><a href="../item/list.shop?type=10">서울 삼성 |</a></li>
</ul>
	<div class="hp_allkill" style="margin: 0 auto;">
		<div class="allkill_title">
			<h6>
				<a href="../item/list.shop">BLS</a>
			</h6>
			<a href="../item/list.shop" class="bt_more">더보기</a>
	</div>
	<div class="wrap" align="center">
	<div class="prev1 list_common">asdfasdf</div>
		<div class="item_list_wrap list_common">
			<c:forEach items="${itemList }" var="item">
				<c:if test="${item.id % 3 == 1}">
					<ul class="item_list">
				</c:if>
				<li>
					<div class="inner">
						<a href="detail.shop?id=${item.id}"> <img class="thumb lazy"
							src="../picture/${item.pictureUrl}" data-original=".jpg"
							style="display: inline;"> <span class="title">${item.name }</span>
						</a>
						<div class="info">
							<em class="prices">가격</em> <span class="pirce"> <strong>${item.price}<span>원</span>
							</strong>
							</span> <span class="jjim"> <span class="jjim2"> <img
									src="../picture/heart.jpg" alt="찜하기"> 찜하기 <strong></strong>
							</span>
							</span>
						</div>
					</div>
				</li>
				<c:if test="${item.id % 3 == 0}">
					</ul>
				</c:if>
			</c:forEach>
</div>
		<div class="next1 list_common">asdf</div>
		</div>
		</div>
</body>
</html>