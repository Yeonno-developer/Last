<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ���</title>
</head>
<style>

</style>
<body>
<div id="contents">
<div id="contents2">
				<!-- ��ٱ��� Ÿ��Ʋ �̹��� layer-->
				
<div class="auction-title">
	<h2>		
		<img id="CartTitleLayer1_CartTitleImage1" src="http://pics.auction.co.kr/myauction/buy/2012/title_basket_step.gif">
	</h2>
</div>
				<!-- ��ٱ��� ����Ʈ Layer -->
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
								<!-- ��ǰ �̹��� TD -->							
								<td border="1px solid red;">
									<div class="img-box">											 										
										<a><img src="../picture/${itemSet.item.pictureUrl}.jpg" width="60" height="60"></a>
									</div>							
								</td>
								
								<!-- ��ǰ���� TD -->
								<td class="line">
									<span class="subject_1">										
											<img id="CartItemList1_Brand_B510600394" src="../picuture/${itemSet.item.pictureUrl }.jpg" class="vopt" value="False" style="display:none">
											${itemSet.item.name }										
									</span>
									<ul class="b_list">																	
																				
										<li id="CartItemList1_li_ItemGroup_4248704033" name="CartItemList1_li_ItemGroup_B510600394" cartno="4248704033">
											<div id="4248704033">
												
												<input type="checkbox" id="CartItemList1_check_4248704033" title="��ǰ����" value="4248704033">
												<span class="title type1" title="">	
													${itemSet.item.name} / ${itemSet.item.price }�� / ${itemSet.quantity }									
												</span>												
												<span class="b_won">													
													<div class="price01" id="CartItemList1_BeforeDiscountPrice_4248704033">${itemSet.item.price * itemSet.quantity}��</div>	<!--SellingPrice�� �������� �ٲ���� -->													
                                                    <div class="quantity" id="CartItemList1_LotteSale_Delete_4248704033" value="False" name="4248704033" style="display:none">${itemSet.quantity }</div>
													<div class="price02" id="CartItemList1_LotteSale_Price_4248704033" value="False" name="4248704033" style="display:none">${itemSet.item.price * itemSet.quantity}</div>
													<!-- ���� ������ �� �� ��� -->															
												</span>
												<a onclick="SelectACart(this.id);" id="CartItemList1_CartBundleShippingList_CartItemGroupList_0_CartList_0_Button_ADelete_0" class="b_del" alternatetext="aDeleteLinkButton" href="javascript:__doPostBack('CartItemList1$CartBundleShippingList$ctl00$CartItemGroupList$ctl00$CartList$ctl00$Button_ADelete','')"></a>
												<div class="b_slist" id="CartItemList1_Div_ProdOption_4248704033">												
													<!-- �߰����� �����Ͱ� ���� �κ� -->
													
												</div>
												
											</div>
										</li>
																						
									</ul>
								</td>
								<td><a href="" align="center" >����</a></td>
							</tr>
							 <c:set var="tot"
            value="${tot + (itemSet.item.price * itemSet.quantity)}" />						
      </c:forEach>
	</tbody></table>
	
	
	
</div>
				<!-- �ٷο��� & ��� ���̾� -->
				

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
					<th colspan="2" scope="col"><img src="http://pics.auction.co.kr/myauction/txt_rebasket01.gif" alt="��ǰ�ݾ�"></th>
					
					<th colspan="2" scope="col" class="layer">
					</th>
					<th scope="col">
						<img src="http://pics.auction.co.kr/myauction/txt_rebasket04.gif" alt="���������ݾ�">
					</th>
				</tr>
			</thead>
			<tbody>
				<tr class="money">
					<td>
						<span id="CartTotalBar1_ProductSum">${tot}</span>
						<span class="won">��</span>
					</td>
					<td>
						<img src="http://pics.auction.co.kr/myauction/ico_total.gif" alt="���������ݾ���">
					</td>
					<td class="final">
						<div style="width:100%; position:relative;">
							<span id="CartTotalBar1_ResultSum">${tot}</span>
							<span class="won">��</span>
						</div>

					</td>
					<!-- ������ �����ʵ���� ���� -->
				</tr>
			</tbody>
		</table>
		<hr size="100">
	</div>
</div>
	</div>

	<div class="btn">
		<input type="image" name="CartAllButtonBar1$Button_AllOrder" id="CartAllButtonBar1_Button_AllOrder" src="http://pics.auction.co.kr/pc/vip/btn_order_buy.png" alt="�ֹ� ����">

		
		<a href="#" id="CartAllButtonBar1_Estimation" name="False" style="display:none">
			<input type="image" id="CartAllButtonBar1_Estimation" src="http://pics.auction.co.kr/myauction/btn_estimate_print2.gif" style="border-width: 0px;">
		</a>
	</div>
</div>

<!--
	�߿�!!) 
	���� �����ϴ� ���������� �� ������ ��!!
	�Ʒ� ��ũ��Ʈ�� �ʼ�!!
	�ȱ׷��� ��ũ��Ʈ ������. 
	������ �̸����� ������ ����ǰ�, �ߺ����� ��ũ��Ʈ ȣ�� �Ǳ⶧���� ������ �ʿ��� ������.
	<script type="text/javascript" src="//script.auction.co.kr/common/ats_iac.js"></script>
-->
				</div>
			</div>
</body>
</html>