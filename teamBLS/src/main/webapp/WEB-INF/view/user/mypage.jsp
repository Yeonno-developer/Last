<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- /WEB-INF/view/user/mypage.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>My page</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
/* �� */
.work-section{
margin-top : 100px;
margin-left: 360px;
margin-bottom: 100px;
}
.work-section .tabs-nav {
	margin-top : 0px;
	float : left;
    letter-spacing: 1px;
    -webkit-box-shadow: inset 1px 0 rgb(255, 255, 255);
            box-shadow: inset 1px 0 rgb(255, 255, 255);
}
.work-section .tabs-nav li {
	font-size : 25px;
    position: relative;
    -webkit-box-shadow: 1px 0 rgb(255, 255, 255);
            box-shadow: 1px 0 rgb(255, 255, 255);
    list-style:none;
    width: 172px;
}
.work-section .tabs-nav a {
    display: block;
    padding: 0 1.36em;
    position: relative;
    text-decoration:none;
}
.work-section .tabs-nav a:hover,
.work-section .tabs-nav a.active {
    background-color: rgb(51, 51, 51);
    color: rgb(255, 255, 255);
}
.work-section .tabs-nav a.active:after {
    background: url(../img/sprites.png) no-repeat 0 0;
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    width: 37px;
    height: 19px;
    margin-left: -18px;
}
.tabs-panel{
margin-left : 250px;
margin-top : -89px;
width: 1000px;
height : 300px;
}
.info_user_team{
margin-top: -89px;
width: 550px !important;
height : 300px;
background: #bababa url(/teamBLS/picture/teams/team_bg.jpg) no-repeat 0 0;
}
.info_user_team h2{
color: white;
}
.work-section .tabs-up {
	margin-top : 0px;
	float : left;
    letter-spacing: 1px;
    -webkit-box-shadow: inset 1px 0 rgb(255, 255, 255);
            box-shadow: inset 1px 0 rgb(255, 255, 255);
}
.work-section .tabs-up li {
	font-size : 25px;
    position: relative;
    -webkit-box-shadow: 1px 0 rgb(255, 255, 255);
            box-shadow: 1px 0 rgb(255, 255, 255);
    list-style:none;
    width: 172px;
}
.work-section .tabs-up a {
    display: block;
    padding: 0 1.36em;
    position: relative;
    text-decoration:none;
}
.work-section .tabs-up a:hover,
.work-section .tabs-up a.active {
    background-color: rgb(51, 51, 51);
    color: rgb(255, 255, 255);
}
.info_user_tinfo{
margin-left : 237.98px;
width: 300px;
height: 200px;
background: white;
}
.info_user_my td{
width: 50%;
}
</style>
<script type="text/javascript">
$(function () {
    /*
     * Tabs
     */
    $('#work').each(function () {
        // ���� �� ��Ҹ� jQuery ��ü ȭ
        var $tabList    = $(this).find('.tabs-nav'),   // ���� ���
            $tabAnchors = $tabList.find('a'),          // �� (��ũ)
            $tabPanels  = $(this).find('.tabs-panel'); // �г�
        // ���� Ŭ���Ǿ��� ���� ó��
        // ���ڷ� �̺�Ʈ ��ü�� �޴´�.
        $tabList.on('click', 'a', function (event) {
            // ��ũ Ŭ���� ���� �⺻ ������ ���
            event.preventDefault();
            // Ŭ�� �� ���� jQuery ������Ʈȭ
            var $this = $(this);
            // ���� �̹� ���õ� ���̶�� �ƹ��͵����� �ʰ� ó���� ����
            if ($this.hasClass('active')) {
                return;
            }
            // ��� ���� ���� ���¸� ���� ��,
            // Ŭ�� �� ���� ���� ���·�
            $tabAnchors.removeClass('active');
            $this.addClass('active');
            // ��� �г��� �ϴ� �� ǥ�÷��ϰ�
            // Ŭ�� �� �ǿ� �����ϴ� �г��� ǥ��
            $tabPanels.hide();
            $($this.attr('href')).show();
        });
        // ù ��° ���� ���� ���·�
        $tabAnchors.eq(0).trigger('click');
    });
});
function list_disp(id){
    var disp = document.getElementById(id);
    if(disp.style.display == 'block'){
       disp.style.display = "none";
    } else {
       disp.style.display = "block";
    }
 }
</script>
</head>
<body>
<div class="work-section" id="work">
<div class="inner">
<ul class="tabs-nav" style="float: none;">
<li><a href="#work01">ȸ������</a></li>
<li><a href="#work02">��������</a></li>
</ul>
<ul class="tabs-up">
<li><a href="updateForm.shop?id=${user.userId}">ȸ����������</a></li>
<li><c:if test="${loginUser.userId != 'admin'}">
    <a href="delete.shop?id=${user.userId }">ȸ��Ż��</a>
            </c:if>
            <c:if test="${loginUser.userId == 'admin'}">
               <a href="../admin/list.shop">ȸ�����</a>
            </c:if></li>
             <li><a href="logout.shop?">�α׾ƿ�</a></li>
</ul>

</div>
	<div class="tabs-panel" id="work01">
	<div class="info_user_team" style="float: left;">
	<c:choose>
	<c:when test="${user.ft =='���ڷ���'}">
	
	<h2>&nbsp;��õ���ڷ��� ��������</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_65.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='�λ�KT'}">
	
	<h2>&nbsp;�λ� KT �Ҵк�</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_06.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='�Ⱦ�KGC'}">
	
	<h2>&nbsp;�Ⱦ� KGC �λ����</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_70.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='����KCC'}">
	
	<h2>&nbsp;���� KCC ������</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_60.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='����DB'}">
	
	<h2>&nbsp;���� DB ���ι�</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_16.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='â��LG'}">
	
	<h2>&nbsp;â�� LG ����Ŀ��</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_50.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='��������'}">
	
	<h2>&nbsp;��� ������ �����½�</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_30.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='����SK'}">
	<div style="float: left;">
	
	</div>
	<h2>&nbsp;���� SK ������</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_55.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='����Ｚ'}">
	
	<h2>���� �Ｚ �����</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_35.gif" style="height: 200px">
	</div> 
	</c:when>
	<c:when test="${user.ft =='������'}">
	
	<h2>&nbsp;��� ������ �ǹ���</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_10.gif" style="height: 200px">
	</div>
	</c:when>
	</c:choose>
	<div class="info_user_tinfo">
	
	</div>
	</div>
	<div class="info_user_my" >
               <table border="1" style="width:400px;">
                  <tr><td colspan="2">ȸ�� ���� </td> </tr>
                  <tr><td>���̵�</td><td>${user.userId }</td></tr>
                  <tr><td>�̸�</td><td>${user.userName }</td></tr>
                  <tr><td>��ȭ��ȣ</td><td>${user.tel }</td></tr>
                  <tr><td>�̸���</td><td>${user.email }</td></tr>
                  <tr><td>�����ȣ</td><td>${user.postcode }</td></tr>
                  <tr><td>�ּ�</td><td>${user.addr }</td></tr>
                  <tr><td>���ּ�</td><td>${user.addr1 }</td></tr>
                  <tr><td>�����ϴ� ��</td><td>${user.ft }</td></tr>
                  <tr><td>�����ϴ� ����</td><td>${user.fp }</td></tr>
               </table>
	</div>
	</div>       
<div id="work02" class="tabs-panel">
   <table border="1" style="width:100%">
      <tr>
         <td colspan="3" align="center"><b>�ֹ� ���</b>
      </tr>
      <tr><th>�ֹ� ��ȣ</th><th>�ֹ� ����</th><th>���ֹ��ݾ�</th></tr>
      <c:forEach items="${salelist}" var="sale" varStatus="stat">
         <tr>
            <td align="center">
            <a href="javascript:list_disp('saleLine${stat.index}')">${sale.saleId}</a>
            </td>
            <td align="center"><fmt:formatDate value="${sale.updateTime }" pattern="yyyy-MM-dd"/>
            </td>
            <td align="right">${sale.totAmount}��</td>
         </tr>
         <tr>
            <td colspan="3" align="center">
               <div id="saleLine${stat.index }" style="display: none;"> 
                  <table border="1" style="width:90%">
                     <tr>
                        <th width="25%">��ǰ��</th>
                        <th width="25%">��ǰ����</th>
                        <th width="25%">���ż���</th>
                        <th width="25%">��ǰ�Ѿ�</th>
                     </tr>
                     <c:forEach items="${sale.itemList}" var="saleItem">
                        <tr>
                           <td align="center" class="title"> ${saleItem.item.name}</td>
                           <td align="right">${saleItem.item.price}��</td>
                           <td align="right">${saleItem.quantity}��</td>
                           <td align="right">${saleItem.item.price * saleItem.quantity}��</td>
                        </tr>
                     </c:forEach>
                  </table>
               </div></td></tr></c:forEach></table></div>
</div>
</body>
</html>