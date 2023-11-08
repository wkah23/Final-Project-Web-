<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/admin/modal_adminOrder.css" >
    
	<div id="modal_bg"></div>
	
	<!-- 주문 접수하기 모달 -->
	
	<div class="order_accept_modal modal">
	<div id="modal_header">
		<h1>대기중인 세탁 의뢰</h1>    
		<button class="closeA"><i class="fas fa-times"></i></button>
	</div>
            
	<div class="modal_box">
		<section>
			<article class="delevery_info">
				<h2>세탁 의뢰 정보</h2>
				
				<button class="order_cancle_btn">의뢰 거부</button>
				
                <div class="info_area">
                    <div>
                    	<div>세탁 배송지</div>
                    	<div>연락처</div>
                    </div>
                    
                    <div class="delevery_address">
                    	<div>천안시 서북구</div>
                    	<div>상세주소</div>
                    	<div>01012345678</div>
                    </div>
                </div>
            </article>

            <article class="request">
                <h2>요청사항</h2>
                <div>빠른 세탁 부탁드려요</div>    
            </article>
            
            <article class="menu">
                <h2>세탁 의뢰 상세</h2>
                <ul>
                    <!-- <li>
                    	<span>서비스 이름  1000원 1개</span>
                    </li>  -->
                </ul>    
            </article>
        </section>
	</div>
        
    <div id="btn_box">
        <button class="closeB">취소</button>
        <button class="delevery_timer_btn">의뢰 받기</button>
    </div>
</div>

	<!-- 의뢰 접수하기 모달 -->
	


	
	<!-- 의뢰 거부하기 -->
	<div class="order_cancle_modal modal">
		<div id="modal_header">
			<h1>세탁 의뢰 거부</h1>
			<button class="closeA"><i class="fas fa-times"></i></button>
		</div>
		
		<div class="modal_box">
			<h2>의뢰 거부 사유를 선택해주세요</h2>
			<ul>
				<li data-reason="방문불가지역" >방문불가지역</li>
				<li data-reason="세탁재료품절" >세탁용품 품절</li>
				<li data-reason="의뢰량 폭주" >의뢰량 폭주</li>
				<li data-reason="기타" >기타</li>
			</ul>
		</div>
		
		<div id="btn_box">
	        <button class="closeB">취소</button>
	        <button class="order_cancle">거부하기</button>
	    </div>
	</div>
		
	<!-- 주문 거부하기 -->
	
	
	
	
	<!-- 배달 시간 설정 모달 -->
		
	<div class="delevery_timer_modal modal">
		<div id="modal_header">
			<h1>대기중인 세탁 의뢰</h1>
			<button class="closeA"><i class="fas fa-times"></i></button>
		</div>
	
		<div class="modal_box">
			<h2>세탁 완료 후 배송일정을 선택해주세요</h2>
			
			<section>
				<ul>
					<li data-time=2>2시간</li>
					<li data-time=4 class="select">4시간</li>
					<li data-time=6>6시간</li>
					<li data-time=24>1일</li>
					<li data-time=48>2일</li>
					<li data-time=72>3일</li>
				</ul>
			</section>
		</div>
		
		<div id="btn_box">
	        <button class="closeB">취소</button>
	        <button class="accept">의뢰 받기</button>
	    </div>
		    
	</div>

	
	
	
	<!-- 배달 시간 설정 모달 -->
	
	
	
	
