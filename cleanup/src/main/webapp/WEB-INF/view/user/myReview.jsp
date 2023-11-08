<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view//include/link.jsp"%>
<link rel="stylesheet" href="/css/user/myReview.css">
<link rel="stylesheet" href="/css/modal.css" >
<link rel="stylesheet" href="/css/user/modal_review.css">

<%@ include file="/WEB-INF/view//include/header.jsp"%>
 <script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "1585b715-156f-4b19-87ec-55dfdca6e1c7"
  });
</script>
<main>
	<section id="main">

		<h1>이용후기 목록</h1>

		<h2>세탁소 이용후기</h2>

		<ul class="comment">

			<c:forEach items="${myReviewList }" var="myReviewList" >
				<li>
				<input type="hidden" value="${myReviewList }" class="review" >
					<div class="myReview">
						<div class="btn_box">
							<button class="modify_btn">수정하기</button>
							<button class="delete_btn">삭제</button>
							<input type="hidden" value="${myReviewList.orderNum }" class="review_order_num">
							<input type="hidden" value="${myReviewList.score }" class="review_score">
							<input type="hidden" value="${myReviewList.reviewImg }" class="review_img">
							<input type="hidden" value="${myReviewList.storeId }" class="review_store_id">
							<input type="hidden" value="${myReviewList.reviewContent }" class="review_review_content">
						</div>
						
						<div class="title">
							<h3>${myReviewList.storeName }</h3>
 
 							<c:forEach begin="0" end="4" var="i">
 								<c:if test="${myReviewList.score >= i}">
 									<i class="fas fa-star"></i>
 								</c:if> 
 								<c:if test="${myReviewList.score < i}">
 									<i class="far fa-star"></i>
 								</c:if> 
 							
 							</c:forEach>
							<span><fm:formatDate value="${myReviewList.regiDate }" pattern="yyyy-MM-dd" /></span>
						</div>

						<c:if test="${!empty myReviewList.reviewImg }">
							<div class="img_box">
								<img alt="이미지" src="${myReviewList.reviewImg }">
							</div>
						</c:if>

						<div class="text">${myReviewList.reviewContent }</div>
					</div> 
					
					<c:if test="${!empty myReviewList.bossComment }">
						<div class="boss_comment">
							<h3>운영자</h3>
							<div>${myReviewList.bossComment }</div>
						</div>
					</c:if>
				</li>
			</c:forEach>


		</ul>

	</section>
</main>


	<%@ include file="/WEB-INF/view/include/nav.jsp"%>

	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
	
	<%@ include file="/WEB-INF/view/modal/modal_review.jsp"%>

	<script src="/js/user/myReview.js"></script>



</body>
</html>