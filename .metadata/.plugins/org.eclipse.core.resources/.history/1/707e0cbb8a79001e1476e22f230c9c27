<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    
<div id="modal_bg"></div>

<!-- 세탁소 정보 수정 -->

<div class="store_reg_modal modal" >
	<div id="modal_header">
	 	<button type="button" class="closeA"><i class="fas fa-times"></i></button>
		<h1>세탁소 정보 수정</h1>
	 </div>

    <form class="store_update_form"> 
		<div class="modal_box">
	         <ul>
	            <li class="category">
					<h2>운영中</h2>
					<div class="input_area">
	                    <select id="category" name="category">
	                        <option value="100">세탁소</option>
	                    </select>
                    </div>
	            </li>
	
	
	            <li>
                    <h2>세탁소 이름</h2>
                    
	                <div class="input_area">
	                	<input type="text" value="${info.storeName }" id="store_name" name="storeName" value="" autocomplete="off" required spellcheck="false" >
	                </div>
                </li>
	
	
	
				<li class="location">
                    <h2>세탁소 주소</h2>
					
                    <div class="input_area">
                        <input type="button" onclick="addressSearch()" value="우편번호 찾기" id="sample2_btn" ><br>
                        <input type="text" value="${info.storeAddress1 }" onclick="addressSearch()" id="address1" placeholder="우편번호" readonly name="storeAddress1" required>

                        <input type="text" value="${info.storeAddress2 }" onclick="addressSearch()" id="address2" placeholder="주소" readonly name="storeAddress2" required><br>
                        <input type="text" value="${info.storeAddress3 }" id="address3" placeholder="상세주소" name="storeAddress3">

                       <%@ include file="/WEB-INF/view/include/addressSearch.jsp" %>
                    </div>
	            </li>
	
	
	
	 			<li>
                    <h2>세탁소 전화번호</h2>
	                <div class="input_area">
	                	<input type="number" value="${info.storePhone }" pattern="\d*" onkeypress="return lenthCheck(this, 11);" id="store_phone_number" name="storePhone" required>
                	</div>
	            </li>
	            
	            
	            
				 <li class="business_hour">
                    <h2>영업시간</h2>
	                <div class="select_box">
	                
	                	<span>
	                        <select name="openingTime" id="opening_time" required>
	                            <c:forEach begin="0" end="24" var="i">
	                            	<option value="${i }">${i }</option>
	                            </c:forEach>
	                        </select>
                        </span>
                        
                        <span>
	                        <select name="closingTime" id="closing_time" required>
	                               <c:forEach begin="0" end="24" var="i">
	                            	<option value="${i }">${i }</option>
	                            </c:forEach>
	                        </select>
                        </span>
                        
	                </div>
	            </li>
	            
	            
	
	            <li class="min_delevery_price">
                    <h2>기본의뢰금액</h2>
	                <div class="input_area">
                		<input type="number" value="${info.minDelevery }" pattern="\d*" onkeypress="return lenthCheck(this, 8);" id="min_delevery_price" name="minDelevery" required>
	                </div>
	            </li>
	            
	            
	            
	            <li class="delevery_tip">
                    <h2>할인 이벤트("-+숫자" 형식)</h2>
	                <div class="input_area">
	                	<input type="number" value="${info.deleveryTip }" pattern="\d*" onkeypress="return lenthCheck(this, 8);" id="delevery_tip" name="deleveryTip" required >
	                </div>
	            </li>
	            
	            
	            
	            <li class="delevery_time">
                    <h2>세탁 후 배송일정</h2>
	                <div class="input_area">
	                	<input type="number" value="${info.deleveryTime }" pattern="\d*" onkeypress="return lenthCheck(this, 3);"  pattern="/d*" value="" id="delevery_time" name="deleveryTime" required>
	                </div>
	            </li>
	            
	            
	            
	             <li class="store_des">
                    <h2>세탁소 정보</h2>
	                <div class="input_area">
	                	<textarea id="store_des" name="storeDes" maxlength="500" >${info.storeDes }</textarea>
                	</div>
	            </li> 
	            
	
	            <li>	
                    <h2>세탁소 이미지</h2>
                    
                    <div class="img_box">
			    		<label for="img">사진첨부</label>
		    			<input type="file" id="img" class="img" name="file" >
			    			
			    		<div>
			    			<img class="preview">
			    			<button type="button" class="img_close"><i class="fas fa-times"></i></button>
		    			</div>
			    	</div>
	            </li>
	        </ul>
		</div>
		
		<input type="hidden" name="storeImg" value="${info.storeImg }" >
		<input type="hidden" name="storeThumb" value="${info.storeThumb }" >
		<div id="btn_box">
       		<button class=closeB type="button">취소</button>
       		<button class="store_update_btn" type="button">수정하기</button>
        </div>
        
		
	</form>
</div>
<!-- 세탁소 정보 수정 -->





<!-- 메뉴 추가하기  -->
<div class="add_menu_modal menu_add modal">
	<form>
		<div id="modal_header">
			<button type="button" class="closeA"><i class="fas fa-times"></i></button>
			<h1>서비스 추가</h1>
		</div>

		<div class="modal_box">


			<ul>
				<li>
					
					<h2>서비스 이름(큰 틀)</h2>
					<div class="input_area">
						<input type="text" name="foodName" autocomplete="off" maxlength="30" required>
					</div>
					
				</li>
					
				<li>
					<h2><label for="food_price">서비스 배달비</label></h2>
					<div class="input_area">
						<input type="number" pattern="\d*" name="foodPrice" onkeypress="return lenthCheck(this, 8);" required>
					</div>
				</li>


				<li class="option_box">
					<div>
						<h2>
							<span>옵션</span>
							<button type="button" class="add_option">+ 옵션 추가</button>
						</h2>
					</div>
					
					<div class="option_box_div"> 
						<!-- 
						<div class="option">
							<div>
								<div>옵션 1 </div> 
								<div>가격</div> 
							</div>
							
							<div>
								<input type="text" maxlength="30" name="foodOption">
								<input type="number" onkeypress="return lenthCheck(this,8);" pattern="\d*" name="foodOptionPrice">
							</div>
							
							<div>
								<button type="button" class="add_option_cancle" ><i class="fas fa-times"></i></button>
							</div>
						</div> 
						 -->
					 </div>
				</li>


				<li>
					<h2>서비스 소개</h2>
					<div class="input_area">
						<input type="text" name="foodDec" autocomplete="off" maxlength="66" >
					</div>
				</li>

				<li>	
                    <h2>서비스 이미지</h2>
                    
                    <div class="img_box">
			    		<label for="img2">사진첨부</label>
		    			<input type="file" id="img2" class="img" name="file" >
			    			
			    		<div>
			    			<img class="preview">
			    			<button type="button" class="img_close"><i class="fas fa-times"></i></button>
		    			</div>
			    	</div>
	            </li>
			</ul>
		</div>

		<div id="btn_box">
			<button class="closeB" type="button">취소</button>
			<button class="add_btn" type="button">추가</button>
		</div>
	</form>
</div>
<!-- 메뉴 추가하기  -->





<!-- 메뉴 수정하기  -->
<div class="add_menu_modal menu_modify modal" id="test">
	<form>

		<div id="modal_header">
			<button type="button" class="closeA"><i class="fas fa-times"></i></button>
			<h1>서비스 수정</h1>
		</div>

		<div class="modal_box">

			<input type="hidden" name="id">


			<ul>
				<li>
					
					<h2>서비스 이름</h2>
					<div class="input_area">
						<input type="text" name="foodName" autocomplete="off" maxlength="30" required>
					</div>
					
				</li>
					
				<li>
					<h2>서비스 비용</h2>
					<div class="input_area">
						<input type="number" pattern="\d*" name="foodPrice" onkeypress="return lenthCheck(this, 8);" required>
					</div>
				</li>


				<li class="option_box">
					<div>
						<h2>
							<span>옵션</span>
							<button type="button" class="add_option">+ 옵션 추가</button>
						</h2>
					</div>
					
					<div class="option_box_div">
						<!-- <div class="option">
							<div>
								<div>옵션 1 </div> 
								<div>가격</div> 
							</div>
							
							<div>
								<input type="text" maxlength="30" name="foodOption">
								<input type="number" onkeypress="return lenthCheck(this,8);" pattern="\d*" name="foodOptionPrice">
							</div>
							
							<div>
								<button type="button" class="add_option_cancle" ><i class="fas fa-times"></i></button>
							</div>
						</div>  -->
					</div>
				</li>


				<li>
					<h2>서비스 소개</h2>
					<div class="input_area">
						<input type="text" name="foodDec" autocomplete="off" maxlength="66" >
					</div>
				</li>

				<li>	
                    <h2>서비스 이미지</h2>
                    
                    <div class="img_box">
			    		<label for="img3">사진첨부</label>
		    			<input type="file" id="img3" class="img" name="file" >
			    			
			    		<div>
			    			<img class="preview">
			    			<button type="button" class="img_close"><i class="fas fa-times"></i></button>
		    			</div>
			    	</div>
	            </li>
			</ul>
		</div>

		<div id="btn_box">
			<button class="closeB" type="button">취소</button>
			<button class="menu_update_btn" type="button">수정하기</button>
		</div>
	</form>
</div>
<!-- 메뉴 수정하기  -->


