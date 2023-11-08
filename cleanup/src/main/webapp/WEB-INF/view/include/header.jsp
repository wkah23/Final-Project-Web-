<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body >
	<!-- <body> -->
	<header>
	
		<div id="header">
			<a href="/home2"><img src="/img/main.png" alt="이미지"> </a>
			<c:set var="ROLE" value="${SPRING_SECURITY_CONTEXT.authentication.principal.user.role }" />
			<c:if test="${ROLE == 'ROLE_ADMIN' }">
			<c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}" />
			
			 	
				<div class="menu_tab_box">
					<div class="menu_tab">
						<span> </span>
						<span> </span>
						<span> </span>
					</div>
				</div>
				
				<div id="menu">
					<div class="box">
						<c:choose>
							<c:when test="${fn:contains(uri, '/admin/management') }">
								<div><a href="/admin/myStore">내 세탁소 관리</a></div>
								<div><a href="/admin/management/order/${id }">의뢰 접수</a></div>
								<div><a href="/admin/management/sales/${id }">매출 확인</a></div>
							</c:when>
							
							<c:otherwise>
								<div><a href="/admin/myStore">내 세탁소 관리</a></div>
								
							</c:otherwise>
							
						</c:choose>
						
						<div><a href="/myPage">내 정보</a></div>
					</div>
				</div>
				<div id="menu_bg"></div>
				
				 <script>
				 
					 $(".menu_tab").click(function(){
						 const menuTab = $(this);
						 const menu = $("#menu");
						 const menuBg = $("#menu_bg");
						 
						 function hide(){
							 menuTab.removeClass("active");
							 menu.removeClass("active");
							 menuBg.hide();
						 }
						 
						 function show(){
							 menuTab.addClass("active");
							 menu.addClass("active");
							 menuBg.show();
						 }
						 
						 if($(this).hasClass("active")) {
							 hide();
						 } else {
							 show();
						 }
						 
						 if(menuBg.css("display") != "none") {
							 menuBg.click(function(){
								hide();
							 })
						 }
						 
					});
				</script>
			</c:if>
		</div>
	</header>
	<!-- 헤더 -->
 

