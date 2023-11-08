<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/home.css">
  <script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "1585b715-156f-4b19-87ec-55dfdca6e1c7"
  });
</script>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
 	
 
 
 <div class="title">제목</div>
 <div class="content">내용</div>
 
 
 <input type=text class="input">
 <button>버튼</button>
 
 
 
 
 
<script>

$("button").click(function(){
	const data = {
		input : $(".input").val()
	}
	console.log(data);
	$.ajax({
		url: "/test2",
		type: "get",
		data : data,
	})
	.done(function(result){
		$(".title").text(result);
		$(".content").text(result);	
		
		
		
	})
	.fail(function(){
		
	})
})

	
 
</script>
 
 
</body>
 
</html>