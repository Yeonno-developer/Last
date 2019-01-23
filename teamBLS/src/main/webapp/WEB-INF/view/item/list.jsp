<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
      height:800px;
      }
      .list_common{
      float: left;
      height:90%;
      }
      .prev1 {
         padding-top : 13%;
         margin : 10px;
         height:90%;
      }
      .next1 {
         padding-top :13%;   
         margin : 10px;
         height:90%;
      }
      .thumb lazy {width:318px;
      height:165px;
      
      }
      .hp_allkill {
      margin-left: 360px;
      }
   </style>

   <script>
    function prev2(pagenum) {
       if(pagenum == 0){
          alert("첫번째 페이지 입니다.");
          location.href="../item/list.shop?ft=${ft}&pagenum=1";
       }else {
       location.href="../item/list.shop?ft=${ft}&pagenum=${pagenum-1}";
    }
    }
    
    function next2(pagenum) {
       
       if(${maxpage == pagenum}){
          if(${ft != null}){
          alert("마지막 페이지 입니다.");
          location.href="../item/list.shop?ft=${ft}&pagenum=${pagenum}";
          }
          else {
         location.href="../item/list.shop?ft=현대모비스&pagenum=${pagenum}";
          }
       } else {   
       location.href="../item/list.shop?ft=${ft}&pagenum=${pagenum+1}";
       }
    }
    
   </script>
</head>
<body>
<ul class="high">
      <li class="inhigh" style="margin-left:250px;margin-right:10px;"><a href="../item/list.shop?ft=현대모비스&pagenum=1">| 울산 현대 모비스 |</a></li>
      <li class="inhigh" style="margin-left:10px;margin-right:10px;"><a href="../item/list.shop?ft=전자랜드&pagenum=1">| 인천 전자랜드 |</a></li>
      <li class="inhigh" style="margin-left:10px;margin-right:10px;"><a href="../item/list.shop?ft=부산KT&pagenum=1">| 부산 KT |</a></li>
      <li class="inhigh" style="margin-left:10px;margin-right:10px;"><a href="../item/list.shop?ft=안양KGC&pagenum=1">| 안양 KGC |</a></li>
      <li class="inhigh" style="margin-left:10px;margin-right:10px;"><a href="../item/list.shop?ft=전주KCC&pagenum=1">| 전주 KCC |</a></li>
      <li class="inhigh" style="margin-left:10px;margin-right:10px;"><a href="../item/list.shop?ft=원주DB&pagenum=1">| 원주 DB |</a></li>
      <li class="inhigh" style="margin-left:10px;margin-right:10px;"><a href="../item/list.shop?ft=창원LG&pagenum=1">| 창원 LG |</a></li>
      <li class="inhigh" style="margin-left:10px;margin-right:10px;"><a href="../item/list.shop?ft=고양오리온&pagenum=1">| 고양 오리온 |</a></li>
      <li class="inhigh" style="margin-left:10px;margin-right:10px;"><a href="../item/list.shop?ft=서울SK&pagenum=1">| 서울 SK |</a></li>
      <li class="inhigh" style="margin-left:10px;margin-right:10px;"><a href="../item/list.shop?ft=서울삼성&pagenum=1">| 서울 삼성 |</a></li>
</ul>


   <div class="hp_allkill">
      <h1><a href="create.shop">상품등록</a></h1>
   <div class="wrap" align="center">
   <div class="prev1 list_common" style="margin-bottom:250px;"><button onclick="prev2(${pagenum-1})"><img src="../picture/left.png" width="60"></button></div>
      <div class="item_list_wrap list_common">
      <c:set var="i" value="1"/>
         <c:forEach items="${itemList}" var="item">
            <c:if test="${i%3 == 1}">
               <ul class="item_list">
            </c:if>
            <li>
               <div class="inner">
                  <a href="detail.shop?id=${item.id}"> <img class="thumb lazy"
                     src="../picture/uniform/${item.pictureUrl}" data-original=".jpg"
                     style="display: inline;"> <span class="title">${item.name }</span>
                  </a>
                  <div class="info">
                     <em class="prices"></em> <span class="pirce"> <strong>${item.price}<span>원</span>
                     </strong>
                     </span> <span class="jjim"> <span class="jjim2"> <img
                           src="../picture/heart.jpg" alt="찜하기"> 찜하기 <strong></strong>
                     </span>
                     <c:if test="${sessionScope.loginUser.userId == 'admin' ||  sessionScope.loginUser.ft == item.ft}">
                     <a href="../item/update.shop?id=${item.id}&pictureUrl=${item.pictureUrl}">수정하기</a>
                     <a href="../item/delete.shop?id=${item.id}">삭제하기</a>
                     </c:if>
                     </span>
                  </div>
               </div>
            </li>
      <c:set var="i" value="${i+1}"/>
            <c:if test="${i % 3 == 1}">
               </ul>               
            </c:if>
            </c:forEach>
</div>
      <div class="next1 list_common"><button onclick="next2(${pagenum+1})"><img src="../picture/right.png" width="60"></button></div>
      </div>
      </div>
</body>
</html>