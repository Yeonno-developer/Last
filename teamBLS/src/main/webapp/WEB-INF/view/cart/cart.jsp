<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니</title>
</head>
<style>

</style>
<body>
<div id="contents">
<div id="contents2">
				<!-- 장바구니 타이틀 이미지 layer-->
				
<div class="auction-title">
	<h2>		
		<img id="CartTitleLayer1_CartTitleImage1" src="http://pics.auction.co.kr/myauction/buy/2012/title_basket_step.gif">
	</h2>
</div>
				<!-- 장바구니 리스트 Layer -->
<div class="order-tbl3">
	<table>
		<colgroup>
			<col width="75px;">
			<col width="467px;">
			<col width="95px;">
			<col width="95px;">
			<col width="78px;">
			<col width="90px">
		</colgroup>
	</table>
	<table border="border-collapse:collapse">
	<colgroup>
		<col width="75px;">
		<col width="467px;">
		<col width="95px;">
		<col width="95px;">
		<col width="78px;">
		<col width="90px">
	</colgroup>
					
							<tbody>				
								 <c:set var="tot" value="${0}" />
      <c:forEach items="${cart.itemSetList}" var="itemSet" varStatus="stat">
							<tr>
								<!-- 상품 이미지 TD -->							
								<td border="1px solid red;">
									<div class="img-box">											 										
										<a><img src="../picture/${itemSet.item.pictureUrl}.jpg" width="60" height="60"></a>
									</div>							
								</td>
								
								<!-- 상품정보 TD -->
								<td class="line">
									<span class="subject_1">										
											<img id="CartItemList1_Brand_B510600394" src="../picuture/${itemSet.item.pictureUrl }.jpg" class="vopt" value="False" style="display:none">
											${itemSet.item.name }										
									</span>
									<ul class="b_list">																	
																				
										<li id="CartItemList1_li_ItemGroup_4248704033" name="CartItemList1_li_ItemGroup_B510600394" cartno="4248704033">
											<div id="4248704033">
												
												<input type="checkbox" id="CartItemList1_check_4248704033" title="상품선택" value="4248704033">
												<span class="title type1" title="">	
													${itemSet.item.name} / ${itemSet.item.price }원 / ${itemSet.quantity }									
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
								<td><a href="" align="center" >삭제</a></td>
							</tr>
							 <c:set var="tot"
            value="${tot + (itemSet.item.price * itemSet.quantity)}" />						
      </c:forEach>
	</tbody></table>
	
	
	
</div>
				<!-- 바로옥션 & 계산 레이어 -->
				

<div class="uxb-total-p agg-banner-area">
	<div class="r-cont">
			<hr size="20">
		<table class="total">
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
					<th colspan="2" scope="col"><img src="http://pics.auction.co.kr/myauction/txt_rebasket01.gif" alt="상품금액"></th>
					
					<th colspan="2" scope="col" class="layer">
					</th>
					<th scope="col">
						<img src="http://pics.auction.co.kr/myauction/txt_rebasket04.gif" alt="최종결제금액">
					</th>
				</tr>
			</thead>
			<tbody>
				<tr class="money">
					<td>
						<span id="CartTotalBar1_ProductSum">${tot}</span>
						<span class="won">원</span>
					</td>
					<td>
						<img src="http://pics.auction.co.kr/myauction/ico_total.gif" alt="최종결제금액은">
					</td>
					<td class="final">
						<div style="width:100%; position:relative;">
							<span id="CartTotalBar1_ResultSum">${tot}</span>
							<span class="won">원</span>
						</div>

					</td>
					<!-- 수많은 히든필드들이 존재 -->
				</tr>
			</tbody>
		</table>
		<hr size="100">
	</div>
</div>
	</div>

	<div class="btn">
		<input type="image" name="CartAllButtonBar1$Button_AllOrder" id="CartAllButtonBar1_Button_AllOrder" src="http://pics.auction.co.kr/pc/vip/btn_order_buy.png" alt="주문 결제">

		
		<a href="#" id="CartAllButtonBar1_Estimation" name="False" style="display:none">
			<input type="image" id="CartAllButtonBar1_Estimation" src="http://pics.auction.co.kr/myauction/btn_estimate_print2.gif" style="border-width: 0px;">
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
				</div>
			</div>
</body>
</html>