<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp"%>
<link rel="stylesheet" href="/css/order/orderDetail.css">
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<script type="text/javascript" src="/js/order/orderList.js" ></script>
 <script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "1585b715-156f-4b19-87ec-55dfdca6e1c7"
  });
</script>


<section class="title">
	<h1>세탁 의뢰 상세</h1>
</section>

<main>
	<div class="detail_box">
		<div class="order_cont">
			<div>${orderDetail.deleveryStatus }</div>
			<div class="store_name">${orderDetail.storeName }</div>

			<div class="order_info">
				<div>
					의뢰한 날 :
					<fm:formatDate value="${orderDetail.orderDate }"
						pattern="yyyy년 MM월 dd일 (E) a hh:mm" />
				</div>
				<div>신청번호 : ${orderDetail.orderNum }</div>
			</div>
		</div>

		<ul class="order_menu">
			<c:forEach begin="0" end="${fn:length(cart) -1 }" var="i">
				<li>
					<div><span class="wow">서비스 내용 ▶ ${cart[i].foodName } ${amount[i] }</span></div>
					
					<ul>
						<li>배달비 <fm:formatNumber value="${cart[i].foodPrice }" />원</li>

						<c:set var="foodTotalPrice" value="${cart[i].foodPrice }" />
						<c:if test="${fn:length(cart[i].optionName) != 0}">
							<c:forEach begin="0" end="${fn:length(cart[i].optionName) -1 }" var="j">
								<li>
									<span>${cart[i].optionName[j] }</span> 
									<span><fm:formatNumber value="${cart[i].optionPrice[j] }" pattern="###,###" />원</span>
								</li>
								
								
								<c:set var="foodTotalPrice" value="${foodTotalPrice + cart[i].optionPrice[j] }" />
							</c:forEach>
						</c:if>
						<li class="menu_price_sum"><fm:formatNumber value="${foodTotalPrice }" pattern="###,###" />원</li>
					</ul>
					<hr>
				</li>
			</c:forEach>
		</ul>


		<div class="price">
			<div>
				<span>전체 의뢰 비용 </span><span><fm:formatNumber value="${orderDetail.totalPrice }" pattern="###,###" />원</span>
			</div>
			<div>
				<span>세탁소 할인 이벤트 </span><span><fm:formatNumber value="${orderDetail.deleveryTip }" pattern="###,###" />원</span>
			</div>
			<div>
				<c:if test="${orderDetail.usedPoint != 0 }">
					<span>포인트 사용 </span>
					<span>-<fm:formatNumber value="${orderDetail.usedPoint }" pattern="###,###" />원</span>
				</c:if>
			</div>
			<hr>
		</div>

		<div class="total">
			<div>
				<span>총 의뢰비용 </span>
				<span class="sum"><fm:formatNumber value="${orderDetail.totalPrice + orderDetail.deleveryTip - orderDetail.usedPoint  }" pattern="###,###" />원</span>
			</div>
			
			<div>
				<span>결제방법 </span><span>${orderDetail.payMethod }</span>
			</div>
		</div>
		<hr>
		<hr>


		<div class="address">
			<div>나의 배송 주소</div>
			<ul>
				<li>${orderDetail.deleveryAddress1 }</li>
				<li>${orderDetail.deleveryAddress2 }</li>
				<li>${orderDetail.deleveryAddress3 }</li>
			</ul>
			<hr>

		</div>

		<div>
			<div>전화번호</div>
			<div>${orderDetail.phone }</div>
			<hr>

		</div>

		<div>
			<div>요청사항</div>
			<div>${orderDetail.request }</div>
			<hr>

		</div>
	</div>
</main>



<!-- 하단 메뉴 -->
	<%-- <%@ include file="/WEB-INF/view/include/nav.jsp"%> --%>
<!-- 하단 메뉴 -->

<!-- 푸터 -->
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
<!-- 푸터 -->


</body>
</html>