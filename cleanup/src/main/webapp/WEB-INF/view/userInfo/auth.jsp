<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/userInfo/find.css">
<%@ include file="/WEB-INF/view/include/header.jsp" %>
 <script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "1585b715-156f-4b19-87ec-55dfdca6e1c7"
  });
</script>	
	<main>
		<div class="find_info">
			
			<div class="find">
				<div id="find_by_email">
					<input type="radio" id="email" value="email" name="find">
					<label for="email">가입한 이메일로 찾기</label>
					
					<div class="auth">
						<input type="email" class="email" placeholder="이메일을 입력해주세요" maxlength="50">
						<button type="button" class="auth_num_send_eemail">인증번호받기</button>
						<input type="text" class="auth_num" name="authNum" readonly maxlength="6"  placeholder="인증번호6자리입력">
						<span class="timer"></span>
					</div>
				</div>
				
				
				<div id="find_by_phone">
					<input type="radio" id="phone" value="phone" name="find">
					<label for="phone">전화번호로 찾기</label>
					<div class="auth">
						<input type="text" class="phone" maxlength="11" placeholder="전화번호를 입력해주세요">
						<button type="button" class="auth_num_send_phone" >인증번호받기</button>
						<input type="text" class="auth_num" name="authNum" readonly maxlength="6"  placeholder="인증번호6자리입력">
						<span class="timer"></span>
					</div>
				</div>
				
			</div>
				
			<button class="move_modify">다음</button>
		</div>
	</main>
	
	

	
	
	
	
<%@ include file="/WEB-INF/view/include/nav.jsp" %>	
<%@ include file="/WEB-INF/view/include/footer.jsp" %>	

	<script src="/js/userInfo/auth.js"></script>


<script>

</script>
</body>
</html>