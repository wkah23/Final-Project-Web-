package com.cleanup.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cleanup.aop.IsMyStore;
import com.cleanup.dto.Cart;
import com.cleanup.dto.Food;
import com.cleanup.dto.OrderCancle;
import com.cleanup.dto.OrderList;
import com.cleanup.dto.Sales;
import com.cleanup.dto.Store;
import com.cleanup.dto.StoreDetail;
import com.cleanup.login.LoginService;
import com.cleanup.service.AdminService;
import com.cleanup.service.StoreService;
import com.cleanup.util.FoodInfoFromJson;
import com.cleanup.util.UploadFile;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private UploadFile uploadFile;
	
	
	@GetMapping("/admin/myStore") 
	public String myStore(@AuthenticationPrincipal LoginService user, Model model) {
		long userId = user.getUser().getId(); 
		List<Store> storeList = adminService.myStore(userId);
		model.addAttribute("storeList", storeList);
		return "admin/myStore";
	}
	
	@IsMyStore
	@GetMapping("/admin/management/detail/{id}") 
	public String detail(@PathVariable long id, @AuthenticationPrincipal LoginService user, Model model) {
		long userId = user.getUser().getId();
		StoreDetail storeDetail = storeService.storeDetail(id, userId);
		model.addAttribute("store", storeDetail);
		model.addAttribute("adminPage", true);
		
		return "admin/detail";
	}
	
	
	
	@IsMyStore
	@PatchMapping("/admin/management/storeInfo")
	public ResponseEntity<Store> storeInfoUpdate(Store store, MultipartFile file) throws IOException {
		if(!file.isEmpty()){
			String img = uploadFile.fildUpload(file);
			store.setStoreImg(img);
			store.setStoreThumb(img);
		}
		adminService.storeInfoUpdate(store);
		return new ResponseEntity<Store>(store,HttpStatus.OK);
	}
	
	
	
	@IsMyStore
	@PostMapping("/admin/management/menu")
	public ResponseEntity<Food> addMenu(Food food, String[] foodOption, Integer[] foodOptionPrice, MultipartFile file) throws IOException {
		if(file.isEmpty()) {
			String img = File.separator + "img" + File.separator + "none.gif";
			food.setFoodImg(img);
			food.setFoodThumb(img);
		} else {
			String img = uploadFile.fildUpload(file);
			food.setFoodImg(img);
			food.setFoodThumb(img);
		}
		
		adminService.addMenu(food, foodOption, foodOptionPrice);
		
		return new ResponseEntity<Food>(food,HttpStatus.OK);
	}
	
	
	@IsMyStore
	@PatchMapping("/admin/management/menu")
	public ResponseEntity<Food> updateMenu(Food food, String[] foodOption, Integer[] foodOptionPrice, Integer[] optionId, MultipartFile file) throws IOException {
		
		System.out.println(food);
		if(file.isEmpty()) {
			String img = File.separator + "img" + File.separator + "none.gif";
			food.setFoodImg(img);
			food.setFoodThumb(img);
		} else {
			String img = uploadFile.fildUpload(file);
			food.setFoodImg(img);
			food.setFoodThumb(img);
		}
		
		adminService.updateMenu(food, foodOption, foodOptionPrice, optionId);
		return new ResponseEntity<Food>(food, HttpStatus.OK);
	}	
	
	
	@IsMyStore
	@DeleteMapping("/admin/management/menu")
	public ResponseEntity<Object> deleteMenu(long storeId, long[] deleteNumber) {
		adminService.deleteMenu(storeId, deleteNumber);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//@PatchMapping("/admin/management/bossComment")
	@IsMyStore
	@RequestMapping(value = "/admin/management/bossComment", method = RequestMethod.POST)
	public ResponseEntity<String> bossComment(long storeId, String orderNum, String bossComment, HttpServletResponse response) throws IOException {
		String reviewContent = adminService.bossComment(storeId, orderNum, bossComment);
		return new ResponseEntity<String>(reviewContent, HttpStatus.OK);
	}
	
	@IsMyStore
	@GetMapping("/admin/management/order/{id}")
	public String order(@PathVariable long id) {
		return "admin/order";
	}
	
	
	
	@IsMyStore
	@GetMapping("/admin/management/orderList")
	public ResponseEntity<Map<String, Object>> orderList(long storeId, String list, int page) {
		System.out.printf("세탁소 번호 : %d, 목록 : %s , 페이지 : %d%n",storeId, list, page);
		
		List<OrderList> orderList = adminService.order(storeId, list, page);
		
		Map<String, Object> map = new HashMap<>();
		List<List<Cart>> menuList = new ArrayList<>();
		
		if(orderList.size() != 0 && orderList.get(0).getFoodInfo() != null) {
			for (int i=0;i<orderList.size();i++) {
				menuList.add(FoodInfoFromJson.foodInfoFromJson(orderList.get(i).getFoodInfo()));
			}
		}
		
		map.put("orderList", orderList);
		map.put("cartList", menuList);
		
		for(int i=0;i<orderList.size();i++) {
			System.out.println(orderList.get(i));
		}
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	
	@PatchMapping("/admin/management/orderAccept")
	public ResponseEntity<String> orderAccept(String orderNum, int time, long userId) {
//		userId == 0 비회원
		adminService.orderAccept(orderNum, time, userId);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	@PatchMapping("/admin/management/orderCancle")
	public ResponseEntity<String> orderCancle(OrderCancle orderCancle) throws IOException {
		adminService.orderCancle(orderCancle);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@PatchMapping("/admin/management/orderComplete")
	public ResponseEntity<String> orderComplete(String orderNum, long userId) {
//		userId == 0 비회원
		adminService.orderComplete(orderNum, userId);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	@IsMyStore
	@GetMapping("/admin/management/sales/{id}")
	public String sales(@PathVariable long id) {
		return "admin/sales";
	}
	
	
	
	@IsMyStore
	@GetMapping("/admin/management/salesDetail")
	public ResponseEntity<Map<String, Object>> salesDetail(long storeId, String date, String sort){
		System.out.println("매출 상세");
		
		System.out.printf("세탁소 번호 : %d, 날짜 : %s, 정렬 : %s%n ", storeId, date, sort);
		Map<String, Object> salseToday = adminService.salesDetail(storeId, date, sort);
		
		return new ResponseEntity<Map<String, Object>>(salseToday, HttpStatus.OK);
	}
	
	
	
	@IsMyStore
	@GetMapping("/admin/management/sales")
	public ResponseEntity<List<Sales>> sales(long storeId, String date, String term) {
//		term =
//		week, month, year
		
		List<Sales> sales = adminService.sales(storeId,date, term);
		return new ResponseEntity<List<Sales>>(sales, HttpStatus.OK);
	}
	
	
	
	
	
	
	
}
