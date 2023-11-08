<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "1585b715-156f-4b19-87ec-55dfdca6e1c7"
  });
</script>    
    <c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}" />
    <c:choose>
	    <c:when test="${fn:split(uri, '/')[0] == 'admin'}">
	    	<c:set var="path" value="/admin/management" />
	    </c:when>
	    <c:otherwise>
	    	<c:set var="path" value="/store" />
	    </c:otherwise>
    </c:choose>
    
    
    
    
<li>
	<div class="img_box">
		<a href="${path }/detail/${storeList.id }"><img src="${storeList.storeImg }" alt="이미지"></a>
	</div>

	<div class="info_box">
	
		<h2><a href="${path }/detail/${storeList.id }">${storeList.storeName }</a></h2>
		
		<a href="${path }/detail/${storeList.id }">
			<span>
				<span>만족도 ${storeList.score }</span>
				
				<span class="score_box">
					<c:forEach begin="0" end="4" var="i">
						<c:if test="${Math.round(storeList.score) > i }">
							<i class="far fas fa-star"></i>
						</c:if>
						<c:if test="${Math.round(storeList.score) <= i }">
							<i class="far fa-star"></i>
						</c:if>
					</c:forEach>
				</span>
			</span>
			
		<span>
			<span>리뷰 ${storeList.reviewCount }</span>
			<!--<span>사장님 댓글 ${storeList.bossCommentCount }</span>-->
		</span>
		
		<span>
			<span>기본의뢰금액 <fm:formatNumber value="${storeList.minDelevery }" pattern="###,###" />원</span>
			<!--<span>배달팁 <fm:formatNumber value="${storeList.deleveryTip }" pattern="###,###" />원</span>-->
		</span>
		<!--<span>배달시간 ${storeList.deleveryTime }분</span>-->
		</a>
	</div>
		
	<c:if test="${!storeList.isOpen}">
		<div class="is_open">
			<a href="/store/detail/${storeList.id }">영업 시간 종료</a>
		</div>
	</c:if>
</li>