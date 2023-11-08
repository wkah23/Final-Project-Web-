<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css" >
<link rel="stylesheet" href="/css/store/likes.css" >
<link rel="stylesheet" href="/css/store/store-li.css">
<%@ include file="/WEB-INF/view/include/header.jsp" %>
 <script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "1585b715-156f-4b19-87ec-55dfdca6e1c7"
  });
</script>
	<div class="wrap">
    	<c:if test="${!empty likesList }">
	    	<style>body {background: #fff; }</style>
		    <section class="title">
		        <h1>내가 등록한 단골 세탁소</h1>
		    </section>
		</c:if>	    

	    <main>
	    	<div class="box">
	    	<c:if test="${empty likesList }">
		    	<div class="temp"><img alt="이미지" src="/img/jjim.png"> </div>
		    </c:if>
		    
			    <ul class="store">
	               	<c:set var="store_admin" value="/store" />
                	<c:forEach items="${likesList }" var="storeList">
                    	<%@ include file="/WEB-INF/view/store/store-li.jsp" %>
                    </c:forEach>
				</ul>
			</div>
		</main>
	</div>

    <!-- 하단 메뉴 -->
   	<%@ include file="/WEB-INF/view/include/nav.jsp" %>
    <!-- 하단 메뉴 -->
	
	<!-- 푸터 -->
	<%@ include file="/WEB-INF/view/include/footer.jsp" %>
	<!-- 푸터 -->
	
</body>
</html>