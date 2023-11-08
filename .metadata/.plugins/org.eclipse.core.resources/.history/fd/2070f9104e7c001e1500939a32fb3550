<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/user/myPage.css">
 
<%@ include file="/WEB-INF/view/include/header.jsp" %>
  <script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "1585b715-156f-4b19-87ec-55dfdca6e1c7"
  });
</script>

	<div class="wrap"> 
 
	<section class="title">
      <c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal.user.nickname ne null}">
           <h1>${SPRING_SECURITY_CONTEXT.authentication.principal.user.nickname }님, 언제나 깨끗함과 편리함을 선물해드립니다.</h1> 
      </c:if>                                                            
      <c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal.user.nickname eq null}">
           <h1>언제나 깨끗함과 편리함을 선물해드립니다.</h1> 
      </c:if>
       </section>
	    <!-- 콘텐츠 -->
	    <main>
	    	<div class="container">
	    	
		    	<div class="grid_box">
		    		<div class="login_box">
	    				 <c:if test="${empty SPRING_SECURITY_CONTEXT }">
	                         <a href="/login"><span>로그인을 해주세요</span></a>
	                    </c:if>
	                    
	                    
	                    <c:if test="${!empty SPRING_SECURITY_CONTEXT }">
                            <c:set var="nickname" value="${SPRING_SECURITY_CONTEXT.authentication.principal.user.nickname }" />
	                        <a href="/user/myInfo"><span class="nickname" data-nickname=${nickname } >${nickname }</span></a>
							<button type="button" class="logout">로그아웃</button>
	                    </c:if>
		    		</div>
    		
		    		<div>
						<a href="/likes/store">
							<span class="img_box">
								<img src="/img/icon44.png" alt="찜한가게">
							</span>
							<span>자주 이용하는 세탁소</span>
						</a>
		    		</div>
		    		
		    		
		    		<div>
						<a href="/orderList">
							<span class="img_box">
								<img src="/img/icon55.png" alt="주문내역">
							</span>
							<span>의뢰 내역서</span>
						</a>
		    		</div>
		    		
		    		
		    		<div>
						<a href="/user/myReview" onclick="return loginCheck()" >
							<span class="img_box">
								<img src="/img/icon66.png" alt="리뷰관리">
							</span>
							<span>이용 후기</span>
						</a>
		    		</div>
		    		
		    		<div>
						<a href="/user/point" onclick="return loginCheck()" >
							<span class="img_box">
								<img src="/img/icon11.png" alt="포인트">
							</span>
							<span>나의 포인트</span>
						</a>
		    		</div>
		    		
		    	</div>
	    		
	    	</div>
	    </main>
	    
    </div>
    
    <!-- 콘텐츠 -->
 
 
    <!-- 하단 메뉴 -->
	<%@ include file="/WEB-INF/view/include/nav.jsp" %>
    <!-- 하단 메뉴 -->
 
    <!-- 푸터 -->
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    <!-- 푸터 -->
 
    <script type="text/javascript">
 
        $(".updating").click(function () {
            swal("업데이트 준비 중 입니다");
        })
 
        $(".logout").click(function () {
            location.href = "/logout";
        })
        
        function loginCheck(){
        	const nickname = $(".nickname").data("nickname");
        	if(!nickname) {
        		swal("로그인 후 이용 가능합니다");
	        	return false;
        	}
        	return true;
        	
        }
        
    </script>
 
</body>
 
</html>