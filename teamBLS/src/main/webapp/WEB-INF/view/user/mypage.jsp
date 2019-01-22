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
/* 탭 */
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
        // 탭의 각 요소를 jQuery 객체 화
        var $tabList    = $(this).find('.tabs-nav'),   // 탭의 목록
            $tabAnchors = $tabList.find('a'),          // 탭 (링크)
            $tabPanels  = $(this).find('.tabs-panel'); // 패널
        // 탭이 클릭되었을 때의 처리
        // 인자로 이벤트 객체를 받는다.
        $tabList.on('click', 'a', function (event) {
            // 링크 클릭에 대한 기본 동작을 취소
            event.preventDefault();
            // 클릭 된 탭을 jQuery 오브젝트화
            var $this = $(this);
            // 만약 이미 선택된 탭이라면 아무것도하지 않고 처리를 중지
            if ($this.hasClass('active')) {
                return;
            }
            // 모든 탭의 선택 상태를 해제 한,
            // 클릭 된 탭을 선택 상태로
            $tabAnchors.removeClass('active');
            $this.addClass('active');
            // 모든 패널을 일단 비 표시로하고
            // 클릭 된 탭에 대응하는 패널을 표시
            $tabPanels.hide();
            $($this.attr('href')).show();
        });
        // 첫 번째 탭을 선택 상태로
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
<li><a href="#work01">회원정보</a></li>
<li><a href="#work02">구매정보</a></li>
</ul>
<ul class="tabs-up">
<li><a href="updateForm.shop?id=${user.userId}">회원정보수정</a></li>
<li><c:if test="${loginUser.userId != 'admin'}">
    <a href="delete.shop?id=${user.userId }">회원탈퇴</a>
            </c:if>
            <c:if test="${loginUser.userId == 'admin'}">
               <a href="../admin/list.shop">회원목록</a>
            </c:if></li>
             <li><a href="logout.shop?">로그아웃</a></li>
</ul>

</div>
	<div class="tabs-panel" id="work01">
	<div class="info_user_team" style="float: left;">
	<c:choose>
	<c:when test="${user.ft =='전자랜드'}">
	
	<h2>&nbsp;인천전자랜드 엘리펀츠</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_65.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='부산KT'}">
	
	<h2>&nbsp;부산 KT 소닉붐</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_06.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='안양KGC'}">
	
	<h2>&nbsp;안양 KGC 인삼공사</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_70.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='전주KCC'}">
	
	<h2>&nbsp;전주 KCC 이지스</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_60.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='원주DB'}">
	
	<h2>&nbsp;원주 DB 프로미</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_16.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='창원LG'}">
	
	<h2>&nbsp;창원 LG 세이커스</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_50.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='고양오리온'}">
	
	<h2>&nbsp;고양 오리온 오리온스</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_30.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='서울SK'}">
	<div style="float: left;">
	
	</div>
	<h2>&nbsp;서울 SK 나이츠</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_55.gif" style="height: 200px">
	</div>
	</c:when>
	<c:when test="${user.ft =='서울삼성'}">
	
	<h2>서울 삼성 썬더스</h2>
	<div style="float: left;">
	<img src="${path}/picture/teams/info_logo/logo_35.gif" style="height: 200px">
	</div> 
	</c:when>
	<c:when test="${user.ft =='현대모비스'}">
	
	<h2>&nbsp;울산 현대모비스 피버스</h2>
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
                  <tr><td colspan="2">회원 정보 </td> </tr>
                  <tr><td>아이디</td><td>${user.userId }</td></tr>
                  <tr><td>이름</td><td>${user.userName }</td></tr>
                  <tr><td>전화번호</td><td>${user.tel }</td></tr>
                  <tr><td>이메일</td><td>${user.email }</td></tr>
                  <tr><td>우편번호</td><td>${user.postcode }</td></tr>
                  <tr><td>주소</td><td>${user.addr }</td></tr>
                  <tr><td>상세주소</td><td>${user.addr1 }</td></tr>
                  <tr><td>좋아하는 팀</td><td>${user.ft }</td></tr>
                  <tr><td>좋아하는 선수</td><td>${user.fp }</td></tr>
               </table>
	</div>
	</div>       
<div id="work02" class="tabs-panel">
   <table border="1" style="width:100%">
      <tr>
         <td colspan="3" align="center"><b>주문 목록</b>
      </tr>
      <tr><th>주문 번호</th><th>주문 일자</th><th>총주문금액</th></tr>
      <c:forEach items="${salelist}" var="sale" varStatus="stat">
         <tr>
            <td align="center">
            <a href="javascript:list_disp('saleLine${stat.index}')">${sale.saleId}</a>
            </td>
            <td align="center"><fmt:formatDate value="${sale.updateTime }" pattern="yyyy-MM-dd"/>
            </td>
            <td align="right">${sale.totAmount}원</td>
         </tr>
         <tr>
            <td colspan="3" align="center">
               <div id="saleLine${stat.index }" style="display: none;"> 
                  <table border="1" style="width:90%">
                     <tr>
                        <th width="25%">상품명</th>
                        <th width="25%">상품가격</th>
                        <th width="25%">구매수량</th>
                        <th width="25%">상품총액</th>
                     </tr>
                     <c:forEach items="${sale.itemList}" var="saleItem">
                        <tr>
                           <td align="center" class="title"> ${saleItem.item.name}</td>
                           <td align="right">${saleItem.item.price}원</td>
                           <td align="right">${saleItem.quantity}개</td>
                           <td align="right">${saleItem.item.price * saleItem.quantity}원</td>
                        </tr>
                     </c:forEach>
                  </table>
               </div></td></tr></c:forEach></table></div>
</div>
</body>
</html>