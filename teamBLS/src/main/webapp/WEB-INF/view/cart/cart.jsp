<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ���</title>
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
				<!-- ��ٱ��� Ÿ��Ʋ �̹��� layer-->
				
<div class="auction-title">
	<h2>		
		<img id="CartTitleLayer1_CartTitleImage1" src="../picture/cart.png">
	</h2>
</div>
				<!-- ��ٱ��� ����Ʈ Layer -->
<div class="order-tbl3">
	<table style="width: 1200px; border-bottom: 1px solid #444444;">
		<tbody>				
		 <c:set var="tot" value="${0}" />
      <c:forEach items="${cart.itemSetList}" var="itemSet" varStatus="stat">
							<tr >
								<!-- ��ǰ �̹��� TD -->							
								<td>
									<div class="img-box">											 										
										<a><img src="../picture/unifrom/${itemSet.item.pictureUrl}" width="60" height="60"></a>
									</div>							
								</td>
								
								<!-- ��ǰ���� TD -->
								<td class="line">
									<span class="subject_1">										
											<img id="CartItemList1_Brand_B510600394" src="../picuture/${itemSet.item.pictureUrl }.jpg" class="vopt" value="False" style="display:none">
											<h1>${itemSet.item.name}</h1>										
									</span>
									<ul class="b_list">																	
																				
										<li id="CartItemList1_li_ItemGroup_4248704033" name="CartItemList1_li_ItemGroup_B510600394" cartno="4248704033">
											<div id="4248704033">
												
												<span class="title type1" title="">	
													<h3>${itemSet.item.name} / ${itemSet.item.price }�� / ${itemSet.quantity }</h3>								
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
								<td><a href="cartDelete.shop?index=${stat.index }" align="center" >����</a></td>
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
						<img src="http://pics.auction.co.kr/myauction/txt_rebasket04.gif" alt="���������ݾ�">
					</th>
				</tr>
			</thead>
			<tbody style=" align:center;">
				<tr class="money" style="align:center;">
					<td class="final" style=" align:center;">
						<div style="width:100%; position:relative; text-align:center;"">
							<span id="CartTotalBar1_ResultSum" >${tot}</span>
							<span class="won">��</span>
						</div>

					</td>
					<!-- ������ �����ʵ���� ���� -->
				</tr>
			</tbody>
		</table>
	</div>
</div>
	</div>

	<div class="btn" align="right" style="margin-right:380px;">
		<input type="image" name="CartAllButtonBar1$Button_AllOrder" id="CartAllButtonBar1_Button_AllOrder" src="http://pics.auction.co.kr/pc/vip/btn_order_buy.png" alt="�ֹ� ����">
		<input type="image" src="../picture/return.PNG" onclick="returning()" alt="���ư���">
		<a href="#" id="CartAllButtonBar1_Estimation" name="False" style="display:none">
		<input type="image" id="CartAllButtonBar1_Estimation" src="http://pics.auction.co.kr/myauction/btn_estimate_print2.gif">
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
</body>
</html>