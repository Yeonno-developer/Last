<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니</title>
<script>
function returning() {
	location.href="../item/list.shop?pagenum=1";
}
</script>
</head>
<style>
  .tableclass {
    width: 1000px;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td, tr {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
<body>
<div id="contents" style="margin-left : 320px;">
<div id="contents2">
				<!-- 장바구니 타이틀 이미지 layer-->
				
<div class="auction-title">
	<h2>		
		<img id="CartTitleLayer1_CartTitleImage1" src="../picture/cart.png">
	</h2>
</div>
				<!-- 장바구니 리스트 Layer -->
<div class="order-tbl3">
	<table style="width: 1200px; border-bottom: 1px solid #444444;">
		<tbody>				
		 <c:set var="tot" value="${0}" />
      <c:forEach items="${cart.itemSetList}" var="itemSet" varStatus="stat">
							<tr >
								<!-- 상품 이미지 TD -->							
								<td>
									<div class="img-box">											 										
										<a><img src="../picture/unifrom/${itemSet.item.pictureUrl}" width="60" height="60"></a>
									</div>							
								</td>
								
								<!-- 상품정보 TD -->
								<td class="line">
									<span class="subject_1">										
											<img id="CartItemList1_Brand_B510600394" src="../picuture/${itemSet.item.pictureUrl }.jpg" class="vopt" value="False" style="display:none">
											<h1>${itemSet.item.name}</h1>										
									</span>
									<ul class="b_list">																	
																				
										<li id="CartItemList1_li_ItemGroup_4248704033" name="CartItemList1_li_ItemGroup_B510600394" cartno="4248704033">
											<div id="4248704033">
												
												<span class="title type1" title="">	
													<h3>${itemSet.item.name} / ${itemSet.item.price }원 / ${itemSet.quantity }</h3>								
												</span>												
												<span class="b_won">													
													<div class="price01" id="CartItemList1_BeforeDiscountPrice_4248704033">${itemSet.item.price * itemSet.quantity}원</div>	<!--SellingPrice를 최종가로 바꿔야해 -->													
                                                    <div class="quantity" id="CartItemList1_LotteSale_Delete_4248704033" value="False" name="4248704033" style="display:none">${itemSet.quantity }</div>
													<div class="price02" id="CartItemList1_LotteSale_Price_4248704033" value="False" name="4248704033" style="display:none">${itemSet.item.price * itemSet.quantity}</div>
													<!-- 선물 포장일 시 만 출력 -->															
												</span>
												<a onclick="SelectACart(this.id);" id="CartItemList1_CartBundleShippingList_CartItemGroupList_0_CartList_0_Button_ADelete_0" class="b_del" alternatetext="aDeleteLinkButton" href="javascript:__doPostBack('CartItemList1$CartBundleShippingList$ctl00$CartItemGroupList$ctl00$CartList$ctl00$Button_ADelete','')"></a>
												<div class="b_slist" id="CartItemList1_Div_ProdOption_4248704033">												
													<!-- 추가구성 리피터가 들어가는 부분 -->
													
												</div>
												
											</div>
										</li>
																						
									</ul>
								</td>
								<td><a href="cartDelete.shop?index=${stat.index }" align="center" >삭제</a></td>
							</tr>
							 <c:set var="tot"
            value="${tot + (itemSet.item.price * itemSet.quantity)}" />						
      </c:forEach>
	</tbody>
	</table>
</div>

<div class="uxb-total-p agg-banner-area">
	<div class="r-cont">
		<table class="total" style="width: 1200px; border-bottom: 1px solid #444444;">
			<colgroup>
						<col width="143px;">
						<col width="26px;">
						<col width="97px;">
						<col width="26px;">
						<col width="125px">
						<col width="26px;">
						<col width="157px">
			</colgroup>
			<thead>
				<tr>				
					<th scope="col">
						<img src="http://pics.auction.co.kr/myauction/txt_rebasket04.gif" alt="최종결제금액">
					</th>
				</tr>
			</thead>
			<tbody style=" align:center;">
				<tr class="money" style="align:center;">
					<td class="final" style=" align:center;">
						<div style="width:100%; position:relative; text-align:center;"">
							<span id="CartTotalBar1_ResultSum" >${tot}</span>
							<span class="won">원</span>
						</div>

					</td>
					<!-- 수많은 히든필드들이 존재 -->
				</tr>
			</tbody>
		</table>
	</div>
</div>
	</div>

	<div class="btn" align="right" style="margin-right:380px;">
		<input type="image" name="CartAllButtonBar1$Button_AllOrder" id="CartAllButtonBar1_Button_AllOrder" src="http://pics.auction.co.kr/pc/vip/btn_order_buy.png" alt="주문 결제">
		<input type="image" src="../picture/return.PNG" onclick="returning()" alt="돌아가기">
		<a href="#" id="CartAllButtonBar1_Estimation" name="False" style="display:none">
		<input type="image" id="CartAllButtonBar1_Estimation" src="http://pics.auction.co.kr/myauction/btn_estimate_print2.gif">
		</a>
	</div>
</div>

<!--
	중요!!) 
	광고 노출하는 페이지에서 꼭 선언할 것!!
	아래 스크립트는 필수!!
	안그러면 스크립트 에러남. 
	동일한 이름으로 여러번 선언되고, 중복으로 스크립트 호출 되기때문에 페이지 쪽에서 선언함.
	<script type="text/javascript" src="//script.auction.co.kr/common/ats_iac.js"></script>
-->
</body>
</html>