<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/link.jsp" %>
 <script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "1585b715-156f-4b19-87ec-55dfdca6e1c7"
  });
</script>
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
	<c:if test="${!empty loginFailMsg }">
		<script type="text/javascript">
			const msg = "${loginFailMsg}";
			swal(msg);
		</script>
	</c:if>

    <main>
        <div class="login_box">
			<a href="/"><img src="/img/cleanup.png" alt="이미지" class="cu_img"></a>    
            
            <form action="/login" method="post">

	            <div class="input_aera"><input type="text" name="username" required placeholder="아이디" maxlength="30"oninvalid="this.setCustomValidity('아이디가 입력되지 않았습니다.')" title="아이디 입력"></div>
	            <div class="input_aera"><input type="password" name="password" required placeholder="비밀번호" maxlength="30"oninvalid="this.setCustomValidity('비밀번호가 입력되지 않았습니다.')" title="비밀번호 입력"></div>

				<input type="submit" value="입장하기" class="login_btn" >
            
				<div class="box">
					<div class="continue_login">
						<label for="continue_login"> 
							<span>로그인 저장</span>
							<input type="checkbox" id="continue_login" name="remember-me" >
							<i class="fas fa-check-square"></i>
						</label>
					</div>
					
		            <div>
		            	<span class="id_search"><a href="/find/id">아이디</a></span>
			            <span> ㅣ </span>
			            <span><a href="/find/password">비밀번호 찾기</a></span>
		            </div>
	            </div>
            </form>
            
			<div id="oauth_login">
				<div>
					<a href="/oauth2/authorization/kakao"></a>
				</div>

				<div>
					<a href="/oauth2/authorization/naver"></a>
				</div>
				
				<div>
					<a href="/oauth2/authorization/google"></a>
				</div>
			</div>
			
			<div class="join"><a href="/join" >회원가입 신청</a></div>
        </div>
    </main>
    
    
</body>
</html>