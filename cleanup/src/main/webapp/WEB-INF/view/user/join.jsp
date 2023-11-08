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
	<main>
		<div class="login_box">
        		<a href="/"><img src="/img/cleanup.png" alt="이미지" class="cu_img"></a>  
				<form action="/join" method="post" onsubmit="return isSubmit.isSubmit();">
					<div class="input_aera">
		            	<input type="text" name="username" class="username" autofocus maxlength="20" required placeholder="아이디를 만들어 주세요" oninvalid="this.setCustomValidity('15자이내의 아이디를 만들어주세요.')" title="15자이내 아이디 생성" >
						<span class="msg_box">${errorMsg.username }</span>
	            	</div>          
		               
					<div class="input_aera">
						<input type="password" class="password1" name="password" maxlength="20" required placeholder="비밀번호를 입력해 주세요" oninvalid="this.setCustomValidity('공백없는 15자이내의 비밀번호를 입력해주세요.')" title="15자이내 비밀번호 생성" >
					</div>
	               
					<div class="input_aera">
						<input type="password" class="password2" maxlength="20" required placeholder="비밀번호를 한번 더 입력해 주세요" oninvalid="this.setCustomValidity('비밀번호 재확인으로 한번 더 입력해주세요')" title="비밀번호 재입력" >
			            <span class="msg_box">${errorMsg.password }</span>
	               	</div>
		               
	               	<div class="input_aera">
	               		<input type="text" name="email" class="email" required placeholder="이메일을 입력해 주세요" oninvalid="this.setCustomValidity('사용하시는 이메일이 무엇인가요?')" title="이메일 입력" >
		                <span class="msg_box">${errorMsg.email }</span>
               		</div>
		               
					<div class="input_aera">
						<input type="text" class="nickname" name="nickname" maxlength="20"  placeholder="고객님의 닉네임을 만들어 주세요" oninvalid="this.setCustomValidity('닉네임이 입력되지 않았습니다.')" title="닉네임 생성" >
	               		<span class="msg_box">${errorMsg.nickname }</span>
					</div>
		               
					<div class="input_aera">
						<input type=number name="phone" value="" class="phone" placeholder="휴대폰번호를 '-' 없이 입력해 주세요" onkeypress="return lenthCheck(this, 11);" oninvalid="this.setCustomValidity('휴대폰번호가 입력되지 않았습니다.')" title="휴대폰번호 입력">
	                    <span class="msg_box">${errorMsg.phone }</span>
	                </div>
	                
	               <input type="submit" value="회원가입" class="login_btn">
			</form>
        </div>
    </main>
    
    <script src="/js/util/util.js"></script>
	<script type="text/javascript" src="/js/user/join.js"></script>
</body>
</html>