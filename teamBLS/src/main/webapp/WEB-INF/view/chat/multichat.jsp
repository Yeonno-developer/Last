<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<title>Socket.io Chat Example</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="EUC-KR">
<style type="text/css">
div.test1 {
	width: 1060px;
	margin: auto;
	margin-bottom: 25px;
}
</style>
<title>Socket.IO chat</title>
<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<hr style="border-top: 1px solid gray;">
	<div class="test1">
		<h1>Realtime Chatting</h1>
	</div>
	
	<div class="test1" style="height: 2000px">
		<iframe name="userId" src="http://192.168.0.157:3000?id=${sessionScope.loginUser.userId}"
			style="width: 1000px; height: 500px; border:0px;">
		</iframe>
<%-- 		<iframe name="userId" src="http://192.168.0.157:4000${path}/chat/index1.html" --%>
		<iframe name="userId" src="http://192.168.0.157:4000"
			style="width: 1000px; height: 1000px; border:0px;">
		</iframe>
		<div>
		<!-- 
		  <div id="app">
		    <div class="container">
		      <h1>Let's vote Team!</h1>
		      <ul class="list-group">
		        <story v-for="(story, index) in stories"
		          :key="index"
		          :story="story"
		          :favorite="favorite"
		          @update="updateFavorite">
		        </story>
			   </ul>
			  </div>
			</div>
			 <div id="app2">
			   <div class="container">
			     <h1>Let's vote Team!</h1>
			     <ul class="list-group">
			       <story v-for="(test, index) in stories"
			         :key="index"
			         :story="test"
			         :favorite="favorite"
			         @update="updateFavorite">
			       </story>
			   </ul>
			  </div>
			</div>
			 -->
		</div>
	</div>
	<!-- 
	<template id="story-template">
	  <li class="list-group-item">
	    "{{ story.writer }}"	 upvotes {{ story.upvotes }}.
	    <button v-show="!story.voted" @click="upvote" class="btn btn-default">
	      Upvote
	    </button>
	    <button v-show="!isFavorite" @click="markAsFavorite" class="btn btn-primary">
	      Favorite
	  </button>
	  <span v-show="isFavorite" class="glyphicon glyphicon-star pull-right" aria-hidden="true"></span>
	  </li>
	</template>
	<template id="test-template">
	  <li class="list-group-item">
	    {{ test.writer }} 	upvotes {{ test.upvotes }}.
	    <button v-show="!story.voted" @click="upvote" class="btn btn-default">
	      Upvote
	    </button>
	    <button v-show="!isFavorite" @click="markAsFavorite" class="btn btn-primary">
	      Favorite
	  </button>
	  <span v-show="isFavorite" class="glyphicon glyphicon-star pull-right" aria-hidden="true"></span>
	  </li>
	</template>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.0.0-rc.8/vue.js"></script>
	<script type="text/javascript">
	Vue.component('story', {
	  template: "#story-template",
	  props: ['story', 'favorite'],
	  methods:{
	    upvote: function () {
	      this.story.upvotes += 1;
	      this.story.voted = true;
	    },
	    markAsFavorite: function () {
	      // 'update' is just the name of the custom event
	      // it could be anything. ex: fav-update
	      this.$emit('update', this.story)
	    },
	  },
	  computed:{
	    isFavorite: function () {
	      return this.story === this.favorite;
	    },
	  }
	});
	
	new Vue({
	  el: '#app',
	  data: {
	    stories: [
	      {
	        writer: 'Team',
	        upvotes: 0,
	        voted: false,
	      },
	    ],
	    favorite: {}
	  },
	  methods:{
	      updateFavorite: function (story) {
	        this.favorite = story;
	      },
	    },
	})
	</script>
	
	<script type="text/javascript">
	Vue.component('test', {
		  template: "#test-template",
		  props: ['test', 'favorite'],
		  methods:{
		    upvote: function () {
		      this.story.upvotes += 1;
		      this.story.voted = true;
		    },
		    markAsFavorite: function () {
		      // 'update' is just the name of the custom event
		      // it could be anything. ex: fav-update
		      this.$emit('update', this.story)
		    },
		  },
		  computed:{
		    isFavorite: function () {
		      return this.story === this.favorite;
		    },
		  }
		});
		
		new Vue({
		  el: '#app2',
		  data: {
		    stories: [
		      {
		        writer: 'Player',
		        upvotes: 28,
		        voted: false,
		      },
		    ],
		    favorite: {}
		  },
		  methods:{
		      updateFavorite: function (story) {
		        this.favorite = story;
		      },
		    },
		})
	</script>
	-->
</body>
</html>
