<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<title>Socket.io Chat Example</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<head>
<meta charset="EUC-KR">
    <title>Socket.IO chat</title>
	<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <h3>Socket.io Chat Example</h3>
    <form class="form-inline">
      <div class="form-group">
        <label for="msgForm">Message: </label>
        <input type="text" class="form-control" id="msgForm">
      </div>
      <button type="submit" class="btn btn-primary">Send</button>
    </form>
    <div id="chatLogs"></div>
  </div>
  <script src="http://localhost:3000/socket.io/socket.io.js"></script>
<script>
  $(function(){
    // socket.io 서버에 접속한다
    var socket = io("http://localhost:8080/teambls/chat/test1.shop");

    // 서버로 자신의 정보를 전송한다.
    socket.emit("login", {
      // name: "ungmo2",
      name: makeRandomName(),
      userid: "ungmo2@gmail.com"
    });

    // 서버로부터의 메시지가 수신되면
    socket.on("login", function(data) {
      $("#chatLogs").append("<div><strong>" + data + "</strong> has joined</div>");
    });

    // 서버로부터의 메시지가 수신되면
    socket.on("chat", function(data) {
      $("#chatLogs").append("<div>" + data.msg + " : from <strong>" + data.from.name + "</strong></div>");
    });

    // Send 버튼이 클릭되면
    $("form").submit(function(e) {
      e.preventDefault();
      var $msgForm = $("#msgForm");

      // 서버로 메시지를 전송한다.
      socket.emit("chat", { msg: $msgForm.val() });
      $msgForm.val("");
    });

    function makeRandomName(){
      var name = "";
      var possible = "abcdefghijklmnopqrstuvwxyz";
      for( var i = 0; i < 3; i++ ) {
        name += possible.charAt(Math.floor(Math.random() * possible.length));
      }
      return name;
    }
  });
  </script>
</body>
</html>
