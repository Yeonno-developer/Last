<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>����� �˻�</title>
<script type="text/javascript"
   src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ea2633155fc8b442f8cc095a5798ccf&libraries=services"></script>
<script src="https://d3js.org/d3.v3.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>

<style type="text/css">
#main {
   max-width: 1200px;
   margin-left :350px ;
} 

#SearchAndMap {
   width: 1200px;
   height: 900px;
}
 
#search {
   width: 570px;
   height: 80px;
   vertical-align: middle;
}

#map_wrap {
   width: 570px;
   height: 500px;
}

.buttons {
    -webkit-appearance: button;

}
option {
   font-size: large;
}
<%-- ���� ����, ���� ��� ���� ������ --%>
.half1{
 float: left;
  width: 570px;
/*   padding: 15px; */
} 
.half2{
 float: right;
  width: 570px;
/*   padding: 15px;  */
}
.
<%-- ��Ʈ ���� css--%>
.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}

.x.axis path {
  display: none;
} 
  .tooltip1 {
      position: absolute;
    display: none;
    width: auto;
    height: auto;
    background: none repeat scroll 0 0 white;
    border: 0 none;
    border-radius: 8px 8px 8px 8px;
    box-shadow: -3px 3px 15px #888888;
    color: black;
    font: 12px sans-serif;
    padding: 5px;
    text-align: center;
  } 
<%-- pie chart --%>
.arc2 text ,.arc3 text {
  font: 25px;
  text-anchor: middle;
}
.arc2 path , .arc3 path {
  stroke: #fff;
}
/* .textmiddle{
    text-shadow: -3px 3px 15px #888888;
    font: sans-serif;
} */

.tooltip2,.tooltip3 {
    position: absolute;
    display: none;
    width: auto;
    height: auto;
    background: none repeat scroll 0 0 white;
    border: 0 none;
    border-radius: 8px 8px 8px 8px;
    box-shadow: -3px 3px 15px #888888;
    color: black;
    font: 12px sans-serif;
    padding: 5px;
    text-align: center;
} 

</style>
</head>
<body>
   <div id="main">
      <div id="SearchAndMap">
         <div class="half1">
         <div id="search">
            <div style="text-align: center; width: 100%; height: 80px; background: #f7f7f7; border : solid 1px #dbdbdb;">
               <div style="width: 100%; height: 40px; margin:auto 0; display: inline-block;">
                  <div style="width: 30%; height:36px; margin : 2px 0; float: left;">
                     <font style="margin-top: 4px;">��&nbsp;&nbsp;</font> <select style="margin-top: 4px;" name="gu" id="gu">
                        <option value="">����</option>
                        <option>������</option>
                        <option>������</option>
                        <option>���ϱ�</option>
                        <option>������</option>
                        <option>���Ǳ�</option>
                        <option>������</option>
                        <option>���α�</option>
                        <option>��õ��</option>
                        <option>�����</option>
                        <option>������</option>
                        <option>���빮��</option>
                        <option>���۱�</option>
                        <option>������</option>
                        <option>���빮��</option>
                        <option>���ʱ�</option>
                        <option>������</option>
                        <option>���ϱ�</option>
                        <option>���ı�</option>
                        <option>��õ��</option>
                        <option>��������</option>
                        <option>��걸</option>
                        <option>����</option>
                        <option>���α�</option>
                        <option>�߱�</option>
                        <option>�߶���</option>
                     </select>
                  </div>
                  <div style="width: 30%; height:36px; margin : 2px 0; float: left;">
                     <font style="margin-top: 4px;">����&nbsp;&nbsp;</font> <select  style="margin-top: 4px;" name="type" id="type">
                        <option value="">����</option>
                        <option>����</option>
                        <option>������</option>
                        <option>�ΰ�</option>
                        <option>���Ρ���ü��</option>
                        <option>��ȸ��������</option>
                        <option>����</option>
                        <option>����</option>
                     </select>
                  </div>
                  <div style="width: 39%; height:36px; margin : 2px 0; float: left;">
                     <font style="margin-top: 4px;">��� ����&nbsp;&nbsp;</font> <select style="margin-top: 4px;" name="bus" id="bus">
                        <option value="">����</option>
                        <option>�</option>
                        <option>�̿</option>
                     </select> &nbsp;&nbsp;&nbsp;&nbsp;

               </div>
               <div style="width: 100%; height: 40px;">
               <a>��� �׸��� �ʼ������� �����ϼž��մϴ�.</a>&nbsp;&nbsp;&nbsp;&nbsp;<button class="buttons" id="searchs">��ȸ</button>
                  </div>
               </div>
            </div>
         </div>
         <!-- </form> -->
         <div id="map_wrap" align="center" class="map_wrap">
            <div id="map" style="width: 100%; height: 100%; margin: 10px 0"
               align="center"></div>
            <div class="bar1" style="height:285px;  margin-top:10px; border:solid 1px #ccc; ">
           <svg class="legends" style=" position:relative; z-index:2;"></svg>
          <div class="tooltip3" style=" z-index:3;"></div>
            <svg class="svg3" style=" position:relative; top:-20px; z-index:2;"></svg>
         <div class="tooltip2" style=" z-index:3;"></div>
            <svg class="svg2" style=" position:relative; top:-20px; z-index:2;"></svg>
        
         </div>
         </div>
         <!-- map_wrap�� �� -->
         <!-- �׷��� �� �ı� �Խ��� ��� -->
      <!-- SearchAndMap -->
   </div>
   <div class="half2">
         <div class="bar2" style="height:470px; width:570px;text-align:center;" id="chart">
         <div class="tooltip1"  style=" z-index:3;"></div>
            <svg class="svg1" style=" z-index:2;"></svg>  
         </div>
          <div class="bar3" style="height:400px; width:570px; text-align:center; border:solid 1px #ccc; margin-top : 15px;">
            <div id="reviews" style="position:relative;width:570px; height : 400px; z-index:2;"></div> 
         </div> 
      </div>
   </div>
   </div>
   <%-- ������ ������ �մϴ�. --%>
<script type="text/javascript">
      // ���� ������ �ʿ��� ����
      var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
      mapOption = {
         center : new daum.maps.LatLng(37.56682, 126.97865), // ������ �߽���ǥ
         level : 2, // ������ Ȯ�� ����
         mapTypeId : daum.maps.MapTypeId.ROADMAP
      // ��������
      };
      // ������ �����Ѵ� 
      var map = new daum.maps.Map(mapContainer, mapOption);

      //������ Ȯ�� ��� ��Ʈ���� �����Ѵ�
      var zoomControl = new daum.maps.ZoomControl();

      // ������ ������ Ȯ�� ��� ��Ʈ���� �߰��Ѵ�
      map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
      //������ ��Ŀ ��ü���� ���� �迭 ��ü
      var markers = [];
      var infos = [];
      var codes =[];
      var is = [];
</script>
<c:if test="${!empty sessionScope.loginUser}"> <!-- �α��� �Ͽ� ����� �˻����� ���� �� �ּ� ���� �ݰ� 1km�� ����� ������ 10�� ��� -->
<script>
$(document).ready(function() { 
   var geocoder = new daum.maps.services.Geocoder();
      geocoder.addressSearch('${sessionScope.loginUser.addr2}', function(result, status) {
        if (status === daum.maps.services.Status.OK) {
         var data ={
               "lat" : result[0].y,
               "lon" : result[0].x
         }
         $.ajax({
            url : "autoMarker.child",
            type : "post",
            data : data,
            dataType : "json",
            success : function(data){
               if (data.autoMarkerList.length == 0){
                  alert("�ݰ� �ȿ� ������� �����ϴ�.")
               }
               hideMarkers();
               for (var i = 0; i < data.autoMarkerList.length; i++) {
                  var Map = map;
                  var coords = new daum.maps.LatLng(
                           data.autoMarkerList[i].lat,data.autoMarkerList[i].lon      
                           );
                     
                  var marker = new daum.maps.Marker({
                      map:Map,
                      position:coords
                   });
                   marker.setMap(map);
                   var content = '<div class="labelWish" style="opacity:0.5; width:500px; height:100px;margin-top : 15px;"><span class="centerWish">';
/*                      if(data.autoMarkerList[i].bus == '�'){
                     content += "<img src='../decorator/bus2.png' style='width:20px; height:20px;'>";   
                     }
 */                       content += "[<strong>"+data.autoMarkerList[i].type+"</strong>]<strong>"+data.autoMarkerList[i].name+'</strong>&nbsp;&nbsp;<button id="compare" style="border:0; outline: 0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:graph('+data.autoMarkerList[i].code+')">��Ʈ ����</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="review" style="border:0; outline:0; background:rgba(148, 193, 96,1); color:white;" onclick="javascript:review('+data.autoMarkerList[i].code+')">�ı�</button><br>��ȭ��ȣ: '+data.autoMarkerList[i].tel+'<br>�ּ�:'+data.autoMarkerList[i].addr;
                      if(data.autoMarkerList[i].bus == '�'){
                         content += "<br><img src='../decorator/bus2.png' style='width:20px; height:20px;'>";   
                         }
                       content+='</span></div>';
                  var infowindow = new daum.maps.InfoWindow({
                         position : coords, 
                         content : content,
                         removable:true
                     }); 
                  infos.push(infowindow);
                  markers.push(marker);
                  codes.push(data.autoMarkerList[i].code);
                  is.push(i);
                    map.setCenter(coords);    
                     // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
                     // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�                
                     (function(marker, infowindow, codes,is) { 
                         // ��Ŀ�� mouseover �̺�Ʈ�� ����ϰ� ���콺 ���� �� ���������츦 ǥ���մϴ� 
                         daum.maps.event.addListener(marker, 'click', function() {
                            AnotherMarkers();
                             infowindow.open(map, marker);
                         });

                     })(marker, infowindow);
                  
               }
               function makeOverListener( map, marker, infowindow) { 
                  return function() {
                       infowindow.open(map, marker);
                   };
               }
               
               // ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
               function makeOutListener(infowindow) {
                   return function() {
                       infowindow.close();
                   };
               }
            }
         })   
       }; 
   })      
})
</script>
</c:if>
<script>//���� select �� ��ȸ ��
      $("#searchs").click(function() {
         var gu = $("#gu").val();
         var type = $("#type").val();
         var bus = $("#bus").val();
         var data = {
            "gu" : gu,
            "type" : type,
            "bus" : bus
         }
         $.ajax({
            url : "search.child",
            type : "post",
            data : data,
            dataType : "json", // ajax ������� �޴� Ÿ��
            success : function(data) {
               if (data.daycarelist.length == 0){
                  alert("���ǿ� ��ġ�ϴ� ������� �����ϴ�.")
               }
               hideMarkers();
               for (var i = 0; i < data.daycarelist.length; i++) {
                  
                  var Map = map;
                  var coords = new daum.maps.LatLng(
                           data.daycarelist[i].lat,data.daycarelist[i].lon      
                           );
                     
                  var marker = new daum.maps.Marker({
                      map:Map,
                      position:coords
                   });
                   marker.setMap(map);
                   
                   var content = '<div class="labelWish" style="opacity:0.5; width:400px; height:100px;margin-top : 15px;"><span class="centerWish">'
                     +"<font >"+data.daycarelist[i].name+'</strong>&nbsp;&nbsp;<button id="compare" style="border:0; outline: 0; background:rgba(76, 103, 140,1); color:white;" onclick="javascript:graph('+data.daycarelist[i].code+')">��Ʈ ����</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="review" style="border:0; outline:0; background:rgba(76, 103, 140,1); color:white;" onclick="javascript:review('+data.daycarelist[i].code+')">�ı�</button><br>'+data.daycarelist[i].tel+'<br>'+data.daycarelist[i].addr+'</span></div>';
                  var infowindow = new daum.maps.InfoWindow({
                         position : coords, 
                         content : content,
                         removable:true
                     }); 
                  infos.push(infowindow);//�迭�� �߰�
                  markers.push(marker);//�迭�� �߰�
                    map.setCenter(coords);
                     // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
                     // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�                
                     (function(marker, infowindow) { 
                         // ��Ŀ�� mouseover �̺�Ʈ�� ����ϰ� ���콺 ���� �� ���������츦 ǥ���մϴ� 
                         daum.maps.event.addListener(marker, 'click', function() {
                            AnotherMarkers();
                             infowindow.open(map, marker);
                         });

                     })(marker, infowindow);
               } //for�� ������ �κ�
               // ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
               function makeOverListener( map, marker, infowindow) { 
                  return function() {
                       infowindow.open(map, marker);
                   };
               }
               
               // ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
               function makeOutListener(infowindow) {
                   return function() {
                       infowindow.close();
                   };
               }


            }
         });
      })
//��� ��Ŀ, ���������� ���߱�
function hideMarkers() {
    for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(null);
         infos[i].close();
      }    
    
}
//Ŭ���� ���� �ܿ� �ٸ� ��Ŀ�� �����
function AnotherMarkers(){
    for (var i = 0; i < markers.length; i++) {
         infos[i].close();
         
     }    
}
<%-- �׷��� ��  ajax --%>
var dataset = []; // �ʱ� ���� ��� ��� dataset�� ����
dataset.push({"name":"����� ���",
    "values":[
      {"value":${daytotal.teacher_avg} ,"column":"���� ��"},
      {"value":${daytotal.maxchild_avg},"column":"����"}, 
      {"value":${daytotal.nowchild_avg},"column":"����"},
      {"value":${daytotal.child_per_teacher},"column":"���� �� ���� ��"}
     ]
});
</script>
<script>//������ �ε� �� ���� ���, �Խ��� �κ� ���� ���
loadBarGraph();
loadReviews();
loadPieGraph_max();
loadPieGraph_now();
function loadBarGraph(){
   var margin = {top: 20, right: 20, bottom: 30, left: 30},
    width = 540 - margin.left - margin.right,
    height = 470 - margin.top - margin.bottom;
var divTooltip = d3.select(".tooltip1");
var x0 = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1);

var x1 = d3.scale.ordinal();

var y = d3.scale.linear()
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x0)
    .tickSize(0)                              
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

  
var color = d3.scale.ordinal()
    .range(["#FFC321","#7FD100" ,"#0B77E8","#FF6336"]);

var svg = d3.select('#chart').select('.svg1')
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
  
  // data �ִ� �κ�   
  var data = dataset;
  
  var Names = data.map(function(d) { return d.name; });
  var columnNames = data[0].values.map(function(d) { return d.column; });
  
  x0.domain(Names);
  x1.domain(columnNames).rangeRoundBands([0, x0.rangeBand()]);
  y.domain([0,20+d3.max(data, function(name) { return d3.max(name.values, function(d) { return d.value; }); })]); 
  
  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .style('opacity','0')
      .call(yAxis)
  .append("text")
       .attr("x",50)
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .style('font-weight','bold')
      .text("�ο� ��");

  svg.select('.y').transition().duration(500).delay(1300).style('opacity','1');
  
  
  var slice = svg.selectAll(".slice")
      .data(data)
      .enter().append("g")
      .attr("class", "g")
      .attr("transform",function(d) { return "translate(" + x0(d.name) + ",0)"; });

  slice.selectAll("rect")
      .data(function(d) { return d.values; })
  .enter().append("rect")
      .attr("width", x1.rangeBand())
      .attr("x", function(d) { return x1(d.column); })
      .style("fill", function(d) { return color(d.column) })
      .attr("y", function(d) { return y(0); })
      .attr("height", function(d) { return height - y(0); })
      .on("mousemove", function(d) {  //���콺 ���� �̺�Ʈ �� �ش� ������ �� ��ȸ.
           divTooltip.style("left", d3.event.pageX + 10 + "px")
            divTooltip.style("top", d3.event.pageY - 25 + "px")
            divTooltip.style("display", "inline-block")
            divTooltip.style("opacity", "0.9")
            divTooltip.html(d.column + "<br>" + d.value);
            d3.select(this)
                .style("fill", d3.rgb(color(d.column)).brighter(1))
                .style("opacity", "0.7");
      })
      .on("mouseout", function(d) {
         divTooltip.style("display", "none")
            d3.select(this).transition().duration(250)
                .style("fill", color(d.column))
                .style("opacity", "1");
      });
  
  slice.selectAll("rect")
      .transition()
      .delay(function (d) {return Math.random()*1000;})
      .duration(1000)
      .attr("y", function(d) { return y(d.value); })
      .attr("height", function(d) { return height - y(d.value); });

  //����
  var legend = svg.selectAll(".legend")
      .data(data[0].values.map(function(d) { return d.column; }).reverse())
  .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d,i) { return "translate(0," + i * 20 + ")"; })
      .style("opacity","0");

  legend.append("rect")
      .attr("x", width)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", function(d) { return color(d); });

  legend.append("text")
      .attr("x", width - 2)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "end")
      .text(function(d) {return d; });

  legend.transition().duration(500).delay(function(d,i){ return 1300 + 100 * i; }).style("opacity","1");
   
}
function loadReviews() {
   $.ajax({
      url : "reviewsOnload.child",
      type : "post",
      data : {"bType":2},
      success: function(data){
         $('.bar3').css('border','');
         $('#text3').remove();
         $('#reviews').css('top','0px');
         $('#reviews').html(data);
      }
   })
}
function loadPieGraph_max(){
    d3.selectAll(".svg3 > *").remove(); 
    var tooltip = d3.select(".tooltip3");

    var width = 270,
        height = 270,
        radius = Math.min(width-50, height-50) / 2;

    var color = d3.scale.ordinal()
        .range(["#74c493", "#e9d78e", "#e16552", "#a34974", "#5698c4","#447c69","#9163b6"]);

    var arc = d3.svg.arc()
        .outerRadius(radius - 10)
        .innerRadius(radius - 55);

    var pie = d3.layout.pie()
        .sort(null)
        .startAngle(1.1*Math.PI)
        .endAngle(3.1*Math.PI)
        .value(function(d) { return d.value; });
        

    var svg = d3.select("body").select(".svg3")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
   
   d3.json("../decorator/total_maxchild.json", function(error, data) {    
         var dataset=[
            {"type":data[0].values[0].column,"value":data[0].values[0].value},
            {"type":data[0].values[1].column,"value":data[0].values[1].value},
            {"type":data[0].values[2].column,"value":data[0].values[2].value},
            {"type":data[0].values[3].column,"value":data[0].values[3].value},
            {"type":data[0].values[4].column,"value":data[0].values[4].value},
            {"type":data[0].values[5].column,"value":data[0].values[5].value},
            {"type":data[0].values[6].column,"value":data[0].values[6].value}
         ]
     var g = svg.selectAll("arc")
           .attr("class", "arc3")
           .data(pie(dataset))
           .enter().append("g");

      g.append("path")
       .style("fill", function(d) { return color(d.data.type); })
        .transition().delay(function(d,i) {
       return i * 250; }).duration(500)
       .attrTween('d', function(d) {
          var i = d3.interpolate(d.startAngle+0.1, d.endAngle);
          return function(t) {
             d.endAngle = i(t); 
             return arc(d);
             }
          }); 
      g.append("text")
          .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
          .attr("dy", ".35em")
         .transition()
         .delay(500);
     
    svg.append("text")
     .attr("text-anchor", "middle")
     .attr('font-size', '1em')
     .attr('y', 130)
     .text("����� ����");
    
    svg.append("text")
    .attr('class','textmiddle')
     .attr("text-anchor", "middle")
     .attr('font-size', '2em')
     .attr('y', 15)
     .text(data[0].gu);
    
    d3.select(".svg3").selectAll("path").on("mousemove", function(d) {
          tooltip.style("left", d3.event.pageX+10+"px");
          tooltip.style("top", d3.event.pageY-25+"px");
          tooltip.style("display", "inline-block");
          tooltip.html((d.data.type)+" ���� ��:"+(d.data.value)+"��");
    });
         
    d3.select(".svg3").selectAll("path").on("mouseout", function(d){
       tooltip.style("display", "none");
    });
    
    var legend = d3.select('.legends').attr('width',570).attr('height',20).selectAll(".legend3")
     .data(dataset.map(function(d) { return d.type; }).reverse())
    .enter().append("g")
     .attr("class", "legend3")
     .attr("transform", function(d,i) { return "translate("+(i*86+20)+",0 )"; })
     .style("opacity","1");

 legend.append("rect")
     .attr("x", 16)
     .attr("y",8)
     .attr("width", 13)
     .attr("height", 13)
     .style("fill", function(d) { return color(d); });
 
 legend.append("text")
     .attr("x",-7)
     .attr("y", 14)
     .attr('font-size', '0.8em')
     .attr("dy", ".35em")
     .style("text-anchor", "middle")
     .text(function(d) {
        if(d=='��ȸ��������') return '��ȸ����';
        else if(d=='���Ρ���ü ��') return '���δ�ü';
        return d; });
         
     function type(d) {
      d.value = +d.value;
      return d;
    }      
   });
}
function loadPieGraph_now(){
    d3.selectAll(".svg2 > *").remove(); 
    var tooltip = d3.select(".tooltip2");

    var width = 270,
        height = 270,
        radius = Math.min(width-50, height-50) / 2;

    var color = d3.scale.ordinal()
        .range(["#74c493", "#e9d78e", "#e16552", "#a34974", "#5698c4","#447c69","#9163b6"]);

    var arc = d3.svg.arc()
        .outerRadius(radius - 10)
        .innerRadius(radius - 55);

    var pie = d3.layout.pie()
        .sort(null)
        .startAngle(1.1*Math.PI)
        .endAngle(3.1*Math.PI)
        .value(function(d) { return d.value; });
        

    var svg = d3.select("body").select(".svg2")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
   
   d3.json("../decorator/total_nowchild.json", function(error, data) {       
         var dataset=[
            {"type":data[0].values[0].column,"value":data[0].values[0].value},
            {"type":data[0].values[1].column,"value":data[0].values[1].value},
            {"type":data[0].values[2].column,"value":data[0].values[2].value},
            {"type":data[0].values[3].column,"value":data[0].values[3].value},
            {"type":data[0].values[4].column,"value":data[0].values[4].value},
            {"type":data[0].values[5].column,"value":data[0].values[5].value},
            {"type":data[0].values[6].column,"value":data[0].values[6].value}
         ]
     var g = svg.selectAll("arc")
            .attr("class", "arc2")
            .data(pie(dataset))
            .enter().append("g");

      g.append("path")
       .style("fill", function(d) { return color(d.data.type); })
        .transition().delay(function(d,i) {
       return i * 250; }).duration(500)
       .attrTween('d', function(d) {
          var i = d3.interpolate(d.startAngle+0.1, d.endAngle);
          return function(t) {
             d.endAngle = i(t); 
             return arc(d);
             }
          }); 
      g.append("text")
          .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
          .attr("dy", ".35em")
         .transition()
         .delay(500);

     svg.append("text")
      .attr("text-anchor", "middle")
      .attr('font-size', '1em')
      .attr('y', 130)
      .text("����� ����");
     
     svg.append("text")
         .attr('class','textmiddle')
        .attr("text-anchor", "middle")
        .attr('font-size', '2em')
        .attr('y', 15)
        .text(data[0].gu);
          
    d3.select(".svg2").selectAll("path").on("mousemove", function(d) {
          tooltip.style("left", d3.event.pageX+10+"px");
          tooltip.style("top", d3.event.pageY-25+"px");
          tooltip.style("display", "inline-block");
          tooltip.html((d.data.type)+" ���� ��:"+(d.data.value)+"��");
    });
         
    d3.select(".svg2").selectAll("path").on("mouseout", function(d){
       tooltip.style("display", "none");
    });
     function type(d) {
      d.value = +d.value;
      return d;
    } 
              
   });   
}
</script>
<script>
//ù���� ��Ʈ(Ŭ����)
function graph(a){
   var code = a;
   var data = {
      "code" : code
   }
   $.ajax({
      url : "graph.child",
      type : "post",
      data : data,
      dataType : "json", // ajax ������� �޴� Ÿ��
      success : function(data) { 
      NowChildPieChart(data.daycare.gu); 
      MaxChildPieChart(data.daycare.gu); 
      d3.selectAll(".svg1 > *").remove(); 
      if(dataset.length == 1){
         dataset.push(
               {"name":data.daycare.name,
                   "values":[
                        {"value":data.daycare.teachercnt,"column":"���� ��"},
                        {"value":data.daycare.maxchild,"column":"����"},
                        {"value":data.daycare.nowchild,"column":"����"},
                        {"value":data.daycare.child_per_teacher,"column":"���� �� ���� ��"}
                       ]
                  });   
      }else{
         dataset.pop(); 
         dataset.push(
            {"name":data.daycare.name,
                "values":[
                     {"value":data.daycare.teachercnt,"column":"���� ��"},
                     {"value":data.daycare.maxchild,"column":"����"},
                     {"value":data.daycare.nowchild,"column":"����"},
                     {"value":data.daycare.child_per_teacher,"column":"���� �� ���� ��"}
                    ]
               });   
      }
      var margin = {top: 20, right: 20, bottom: 30, left: 30},
          width = 540 - margin.left - margin.right,
          height = 470 - margin.top - margin.bottom;
      var divTooltip = d3.select(".tooltip1");
      var x0 = d3.scale.ordinal()
          .rangeRoundBands([0, width], .1);

      var x1 = d3.scale.ordinal();

      var y = d3.scale.linear()
          .range([height, 0]);

      var xAxis = d3.svg.axis()
          .scale(x0)
          .tickSize(0)                              
          .orient("bottom");

      var yAxis = d3.svg.axis()
          .scale(y)
          .orient("left");
   
        
      var color = d3.scale.ordinal()
          .range(["#FFC321","#7FD100" ,"#0B77E8","#FF6336"]);

      var svg = d3.select('#chart').select('.svg1')
          .attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.top + margin.bottom)
        .append("g")
          .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
        
         // data �ִ� �κ�   
         var data = dataset;
         
        var Names = data.map(function(d) { return d.name; });
        var columnNames = data[0].values.map(function(d) { return d.column; });
        
        x0.domain(Names);
        x1.domain(columnNames).rangeRoundBands([0, x0.rangeBand()]);
        y.domain([0, 20+d3.max(data, function(name) { return d3.max(name.values, function(d) { return d.value; }); })]); 
        
        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis);

        svg.append("g")
            .attr("class", "y axis")
            .style('opacity','0')
            .call(yAxis)
        .append("text")
             .attr("x",50)
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .style('font-weight','bold')
            .text("�ο� ��");

        svg.select('.y').transition().duration(500).delay(1300).style('opacity','1');
        
        
        var slice = svg.selectAll(".slice")
            .data(data)
            .enter().append("g")
            .attr("class", "g")
            .attr("transform",function(d) { return "translate(" + x0(d.name) + ",0)"; });

        slice.selectAll("rect")
            .data(function(d) { return d.values; })
        .enter().append("rect")
            .attr("width", x1.rangeBand())
            .attr("x", function(d) { return x1(d.column); })
            .style("fill", function(d) { return color(d.column) })
            .attr("y", function(d) { return y(0); })
            .attr("height", function(d) { return height - y(0); })
            .on("mousemove", function(d) {  //���콺 ���� �̺�Ʈ �� �ش� ������ �� ��ȸ.
                 divTooltip.style("left", d3.event.pageX + 10 + "px")
                   divTooltip.style("top", d3.event.pageY - 25 + "px")
                   divTooltip.style("display", "inline-block")
                   divTooltip.style("opacity", "0.9")
                   divTooltip.html(d.column + "<br>" + d.value);
                   d3.select(this)
                       .style("fill", d3.rgb(color(d.column)).brighter(1))
                       .style("opacity", "0.7");
            })
            .on("mouseout", function(d) {
               divTooltip.style("display", "none")
                   d3.select(this).transition().duration(250)
                       .style("fill", color(d.column))
                       .style("opacity", "1");
            });
        
        slice.selectAll("rect")
            .transition()
            .delay(function (d) {return Math.random()*1000;})
            .duration(1000)
            .attr("y", function(d) { return y(d.value); })
            .attr("height", function(d) { return height - y(d.value); });

        //����
        var legend = svg.selectAll(".legend")
            .data(data[0].values.map(function(d) { return d.column; }).reverse())
        .enter().append("g")
            .attr("class", "legend")
            .attr("transform", function(d,i) { return "translate(0," + i * 20 + ")"; })
            .style("opacity","0");

        legend.append("rect")
            .attr("x", width)
            .attr("width", 18)
            .attr("height", 18)
            .style("fill", function(d) { return color(d); });

        legend.append("text")
            .attr("x", width - 2)
            .attr("y", 9)
            .attr("dy", ".35em")
            .style("text-anchor", "end")
            .text(function(d) {return d; });

        legend.transition().duration(500).delay(function(d,i){ return 1300 + 100 * i; }).style("opacity","1");
      }});
   
}
//�߰� pie chart (2017 ���� ���� ���� ��)
function NowChildPieChart(guname){//guname�� �Ƿ�����
    d3.selectAll(".svg2 > *").remove(); 
    var tooltip = d3.select(".tooltip2");

    var width = 270,
        height = 270,
        radius = Math.min(width-50, height-50) / 2;

    var color = d3.scale.ordinal()
        .range(["#74c493", "#e9d78e", "#e16552", "#a34974", "#5698c4","#447c69","#9163b6"]);

    var arc = d3.svg.arc()
        .outerRadius(radius - 10)
        .innerRadius(radius - 55);

    var pie = d3.layout.pie()
        .sort(null)
        .startAngle(1.1*Math.PI)
        .endAngle(3.1*Math.PI)
        .value(function(d) { return d.value; });
        

    var svg = d3.select("body").select(".svg2")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
   
   d3.json("../decorator/total_nowchild.json", function(error, data) {
    for (var i=1; i<data.length;i++){
       if(guname == data[i].gu){
          console.log(data[i].gu);          
         var dataset=[
            {"type":data[i].values[0].column,"value":data[i].values[0].value},
            {"type":data[i].values[1].column,"value":data[i].values[1].value},
            {"type":data[i].values[2].column,"value":data[i].values[2].value},
            {"type":data[i].values[3].column,"value":data[i].values[3].value},
            {"type":data[i].values[4].column,"value":data[i].values[4].value},
            {"type":data[i].values[5].column,"value":data[i].values[5].value},
            {"type":data[i].values[6].column,"value":data[i].values[6].value}
         ]
     var g = svg.selectAll("arc")
            .attr("class", "arc2")
            .data(pie(dataset))
            .enter().append("g");

      g.append("path")
       .style("fill", function(d) { return color(d.data.type); })
        .transition().delay(function(d,i) {
       return i * 250; }).duration(500)
       .attrTween('d', function(d) {
          var i = d3.interpolate(d.startAngle+0.1, d.endAngle);
          return function(t) {
             d.endAngle = i(t); 
             return arc(d);
             }
          }); 
      g.append("text")
          .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
          .attr("dy", ".35em")
         .transition()
         .delay(500);

     svg.append("text")
      .attr("text-anchor", "middle")
      .attr('font-size', '1em')
      .attr('y', 130)
      .text("����� ����");
     
     svg.append("text")
         .attr('class','textmiddle')
        .attr("text-anchor", "middle")
        .attr('font-size', '2em')
        .attr('y', 15)
        .text(data[i].gu);
          
    d3.select(".svg2").selectAll("path").on("mousemove", function(d) {
          tooltip.style("left", d3.event.pageX+10+"px");
          tooltip.style("top", d3.event.pageY-25+"px");
          tooltip.style("display", "inline-block");
          tooltip.html((d.data.type)+" ���� ��:"+(d.data.value)+"��");
    });
         
    d3.select(".svg2").selectAll("path").on("mouseout", function(d){
       tooltip.style("display", "none");
    });
    
     

     function type(d) {
      d.value = +d.value;
      return d;
    } 
          
          }
       }             
   });   
}
//�߰� pie chart (2017 ���� ���� ���� ��)
function MaxChildPieChart(guname){//guname�� �Ƿ�����
    d3.selectAll(".svg3 > *").remove(); 
    var tooltip = d3.select(".tooltip3");

    var width = 270,
        height = 270,
        radius = Math.min(width-50, height-50) / 2;

    var color = d3.scale.ordinal()
        .range(["#74c493", "#e9d78e", "#e16552", "#a34974", "#5698c4","#447c69","#9163b6"]);

    var arc = d3.svg.arc()
        .outerRadius(radius - 10)
        .innerRadius(radius - 55);

    var pie = d3.layout.pie()
        .sort(null)
        .startAngle(1.1*Math.PI)
        .endAngle(3.1*Math.PI)
        .value(function(d) { return d.value; });
        

    var svg = d3.select("body").select(".svg3")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
   
   d3.json("../decorator/total_maxchild.json", function(error, data) {
    for (var i=1; i<data.length;i++){
       if(guname == data[i].gu){
          console.log(data[i].gu);          
         var dataset=[
            {"type":data[i].values[0].column,"value":data[i].values[0].value},
            {"type":data[i].values[1].column,"value":data[i].values[1].value},
            {"type":data[i].values[2].column,"value":data[i].values[2].value},
            {"type":data[i].values[3].column,"value":data[i].values[3].value},
            {"type":data[i].values[4].column,"value":data[i].values[4].value},
            {"type":data[i].values[5].column,"value":data[i].values[5].value},
            {"type":data[i].values[6].column,"value":data[i].values[6].value}
         ]
     var g = svg.selectAll("arc")
           .attr("class", "arc3")
           .data(pie(dataset))
           .enter().append("g");

      g.append("path")
       .style("fill", function(d) { return color(d.data.type); })
        .transition().delay(function(d,i) {
       return i * 250; }).duration(500)
       .attrTween('d', function(d) {
          var i = d3.interpolate(d.startAngle+0.1, d.endAngle);
          return function(t) {
             d.endAngle = i(t); 
             return arc(d);
             }
          }); 
      g.append("text")
          .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
          .attr("dy", ".35em")
         .transition()
         .delay(500);
     
    svg.append("text")
     .attr("text-anchor", "middle")
     .attr('font-size', '1em')
     .attr('y', 130)
     .text("����� ����");
    
    svg.append("text")
    .attr('class','textmiddle')
     .attr("text-anchor", "middle")
     .attr('font-size', '2em')
     .attr('y', 15)
     .text(data[i].gu);
    
    d3.select(".svg3").selectAll("path").on("mousemove", function(d) {
          tooltip.style("left", d3.event.pageX+10+"px");
          tooltip.style("top", d3.event.pageY-25+"px");
          tooltip.style("display", "inline-block");
          tooltip.html((d.data.type)+" ���� ��:"+(d.data.value)+"��");
    });
         
    d3.select(".svg3").selectAll("path").on("mouseout", function(d){
       tooltip.style("display", "none");
    });
    
    var legend = d3.select('.legends').attr('width',570).attr('height',20).selectAll(".legend3")
     .data(dataset.map(function(d) { return d.type; }).reverse())
    .enter().append("g")
     .attr("class", "legend3")
     .attr("transform", function(d,i) { return "translate("+(i*86+20)+",0 )"; })
     .style("opacity","1");

 legend.append("rect")
     .attr("x", 16)
     .attr("y",8)
     .attr("width", 13)
     .attr("height", 13)
     .style("fill", function(d) { return color(d); });
 
 legend.append("text")
     .attr("x",-7)
     .attr("y", 14)
     .attr('font-size', '0.8em')
     .attr("dy", ".35em")
     .style("text-anchor", "middle")
     .text(function(d) {
        if(d=='��ȸ��������') return '��ȸ����';
        else if(d=='���Ρ���ü ��') return '���δ�ü';
        return d; });
         
     function type(d) {
      d.value = +d.value;
      return d;
    } 
          
       }
    }        
        
   });
   
}
//�ش� ������� ���� �ֽż� �ı�Խ��� ���
function review(code){
   $.ajax({
      url : "reviews.child",
      type : "post",
      data : {"code" : code, "bType":2},
      success : function(data) {
         $('.bar3').css('border','');
         $('#text3').remove();
         $('#reviews').css('top','0px');
         $('#reviews').html(data);
      }});
}
</script>
</body>
</html>