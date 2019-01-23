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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<head>
<meta charset="EUC-KR">
<style type="text/css">
div.test1 {
	width: 1060px;
	margin: auto;
	margin-bottom: 20px;
}
</style>
<script type="text/javascript">
</script>
<title>Socket.IO chat</title>
<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
<!-- 
<script type="text/javascript">
	var btn = document.getElementById( 'btn' );       // 메시지 전송 버튼
	var child = document.getElementById( 'child' );   // iframe
	
	// 버튼 클릭하면 메시지 전달 함수 호출
	btn.addEventListener( 'click', function( e ) {
	    sendMsgToChild( '아들! 딸!' );
	});
	
	// 자식에게 메시지 전달
	function sendMsgToChild( msg ) {
	    child.contentWindow.postMessage( msg, '*' );
	}
</script>
 -->
</head>
<script type="text/javascript">


</script>
<body>
	<hr style="border-top: 1px solid gray;">
	<div class="test1">
		<h1>Realtime Chatting</h1>
	</div>

	<div class="test1" style="height: 1500px">
		<iframe name="userId" id="child"
			src="http://192.168.0.157:3000?id=${sessionScope.loginUser.userId}"
			style="width: 1000px; height: 700px; border: 0px;"> </iframe>
		<!-- 
		<iframe name="userId" src="http://192.168.0.157:4000"
			style="width: 1000px; height: 400px; border: 0px;"> </iframe>
			 -->
		<div>
			<div class="w3-col s4">
				<div>
					<div id="app">
						<div class="container">
							<h1>Let's vote Team!</h1>
							<ul class="list-group">
								<story v-for="(story, index) in stories" :key="index"
									:story="story" :favorite="favorite" @update="updateFavorite">
								</story>
							</ul>
						</div>
					</div>
				</div>
				<div>
					<div id="app2">
						<div class="container">
							<h1>Let's vote Team!</h1>
							<ul class="list-group">
								<story v-for="(test, index) in stories" :key="index"
									:story="test" :favorite="favorite" @update="updateFavorite">
								</story>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<template id="story-template">
			<li class="list-group-item">"{{ story.writer }}" upvotes {{
				story.upvotes }}.
				<button v-show="!story.voted" @click="upvote"
					class="btn btn-default" name="clickt">Upvote</button>
					<!-- 
				<button v-show="!isFavorite" @click="markAsFavorite"
					class="btn btn-primary">Favorite</button>
					 -->
					<span v-show="isFavorite"
				class="glyphicon glyphicon-star pull-right" aria-hidden="true"></span>
				<input type="hidden" v-model="story.upvotes" name="storyupvotes">
			</li>
			</template>

			<template id="test-template">
			<li class="list-group-item">{{ test.writer }} upvotes {{
				test.upvotes }}.
				<button v-show="!story.voted" @click="upvote"
					class="btn btn-default" name="clickp">Upvote</button>
					<!-- 
				<button v-show="!isFavorite" @click="markAsFavorite"
					class="btn btn-primary">Favorite</button>
					 -->
					<span v-show="isFavorite"
				class="glyphicon glyphicon-star pull-right" aria-hidden="true"></span>
				<input type="hidden" v-model="test.upvotes" name="testupvotes">
			</li>
			</template>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.0.0-rc.8/vue.js"></script>
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
	        writer: 'Mr. Weebl',
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
	<script>
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
		        writer: 'test',
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


		</div>
	</div>

<!-- 
	<script>
export default {
  data: () => ({
    show: 'line',
    values: [
      { value: 3200 },
      { value: 2600 },
      { value: 4500 },
      { value: 3040 },
      { value: 6900 },
      { value: 4910 },
      { value: 2300 }
    ]
  })
};
</script>
	<template>
	<div>
		<la-cartesian :width="300" :height="75" :data="values">
		<la-line animated v-if="show === 'line'" prop="value"></la-line> <la-area
			animated v-else-if="show === 'area'" prop="value"></la-area> <la-bar
			animated v-else prop="value"></la-bar> </la-cartesian>

		<label>Choose type:</label>
		<button @click="show = 'line'">line</button>
		<button @click="show = 'area'">area</button>
		<button @click="show = 'bar'">bar</button>
	</div>
	</template>
	 -->
</body>
</html>
