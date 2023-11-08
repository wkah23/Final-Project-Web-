<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
	<link rel="stylesheet" href="/css/modal.css" >
	<link rel="stylesheet" href="/css/layout/nav.css" >
	<link rel="stylesheet" href="/css/order/orderList.css">
    <link rel="stylesheet" href="/css/user/modal_review.css">
<%@ include file="/WEB-INF/view/include/header.jsp" %>
 <script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "1585b715-156f-4b19-87ec-55dfdca6e1c7"
  });
</script>    

    
	<div class="wrap">
    
		<c:if test="${!empty orderList }">
			<style>body {background: #fff; } </style> 
		    <section class="title">
		        <h1>세탁 의뢰 내역</h1>
		    </section>
		</c:if>    
		
		<c:if test="${empty orderList }" >
       		<img alt="이미지" src="/img/temp.png" class="temp_img"> 
       	</c:if> 
	       
	       
       <c:if test="${fn:length(orderList) >0 }"> 	
	    <main>
	        <div class="order_list">
        		<ul id="order_list">
	        	<c:forEach begin="0" end="${fn:length(orderList)-1 }" var="i">
                    <li>
                    	<div class="img_box">
                    		<a href="/store/detail/${orderList[i].storeId }" >
                    			<img src="${orderList[i].storeImg }" alt="이미지">
                   			</a>
                   		</div>
                    
                    
                    	<div class="info_box">
                    		<span>
                    			<fm:formatDate value="${orderList[i].orderDate }" pattern="M월d일" />
	                   			<span>${orderList[i].deleveryStatus}</span> 
                    		</span>

                           	<h2>
                           		<a href="/store/detail/${orderList[i].storeId }" >
                           			${orderList[i].storeName }
                           		</a>
                           	</h2>
                           	 
                            <span class="info">
	                       	 	<a href="/store/detail/${orderList[i].storeId }" >
	                       	 	
	                           		<c:set value="${fn:length(cartList[i] )}" var="cart" />
	                           		<c:if test="${cart > 1 }">
	                           			<span>${cartList[0][0].foodName } 외 ${cart -1 }개</span>
	                           		</c:if>
	                           		<c:if test="${cart <= 1 }">
		                                <span>${cartList[0][0].foodName } ${cartList[0][0].amount }개 </span>
	                           		</c:if>     
	                                <span><fm:formatNumber value="${orderList[i].totalPrice + orderList[i].deleveryTip - orderList[i].usedPoint }" pattern="###,###" /> 원</span>
		                        </a>
                             </span>
                        </div>
                        
                        <div class="review_btn_box">
	                        <button class="order_detail">상세보기</button>
	                        <c:if test="${!empty user }">
	                        
                    			<input type="hidden" class="order_num" value="${orderList[i].orderNum }">
	                        	<input type="hidden" class="store_id" value="${orderList[i].storeId }">
	                        	
	                        	<c:if test="${empty orderList[i].reviewContent }">
		                        	<button class="review regi">후기 쓰기</button>
	                        	</c:if>
	                        	<c:if test="${!empty orderList[i].reviewContent }">
		                        	<button class="review modify">후기 수정</button>
		                        	<input type="hidden" value="${orderList[i].reviewContent }" class="review_content" >
		                        	<input type="hidden" value="${orderList[i].score }" class="review_score" >
		                        	<input type="hidden" value="${orderList[i].reviewImg}" class="review_img" name="store_img">
	                        	</c:if>
		                        	
	                        </c:if>
                        </div>
					</li>
        	</c:forEach>
        	
            </ul>
        </div>
        <%@ include file="/WEB-INF/view/include/pageBox.jsp" %>
    </main>
    </c:if>
</div>

    <!-- 하단 메뉴 -->
	<%@ include file="/WEB-INF/view/include/nav.jsp" %>
    <!-- 하단 메뉴 -->

    <!-- 푸터 -->
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    <!-- 푸터 -->
	
	<%@ include file="/WEB-INF/view/modal/modal_review.jsp" %>
	
	
	<script type="text/javascript" src="/js/order/orderList.js" ></script>
	
	
</body>
</html>