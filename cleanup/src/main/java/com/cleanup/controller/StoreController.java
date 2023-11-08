package com.cleanup.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cleanup.dto.FoodOption;
import com.cleanup.dto.Review;
import com.cleanup.dto.Store;
import com.cleanup.dto.StoreDetail;
import com.cleanup.login.LoginService;
import com.cleanup.service.StoreService;
import com.cleanup.util.CookieManager;
import com.cleanup.util.Page;
import com.cleanup.util.UploadFile;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@Autowired
	private UploadFile uploadFile;
	
	@Autowired
	private CookieManager cookieManager;
	
	@GetMapping("/store/{category}/{address1}")
	public String store(@PathVariable int category, @PathVariable int address1, Model model) {
		
		List<Store> storeList = storeService.storeList(category, address1 / 100);
		model.addAttribute("storeList", storeList);
		
		return "store/store";
	}
	
	
	
	@ResponseBody
	@GetMapping("/store/storeList")
	public ResponseEntity<List<Store>> sortStore(int category, int address1, String sort, int page,  Model model) {
		List<Store> storeList = storeService.storeList(category, address1 / 100, sort, page);
		return new ResponseEntity<>(storeList, HttpStatus.OK);
	}
	
	
	@GetMapping("/store/detail/{id}")
	public String storeDetail(@PathVariable long id, Model model, @AuthenticationPrincipal LoginService user) throws Exception {
		long userId = 0;
		if(user != null) {
			userId = user.getUser().getId();
		} else {
			CookieManager cm = new CookieManager();
			String likesList  = cm.findCookie("LIKES_LIST");
			if(likesList == null ) {
				model.addAttribute("isLikes", false);
			} else {
				String[] arr = likesList.split(", ");
				boolean isLikes = Arrays.asList(arr).contains(id+"");
				model.addAttribute("isLikes", isLikes);
			}
		}
		
		StoreDetail storeDetail = storeService.storeDetail(id, userId);
		model.addAttribute("store", storeDetail);
		return "store/detail";
	}
	
	
	// 메뉴 클릭시 음식 추가옵션 가져요기
	@ResponseBody
	@GetMapping("/foodOption")
	public List<FoodOption> menuDetail(int foodId) {
		System.out.println("foodId = " + foodId);
		List<FoodOption> foodOption = storeService.foodOption(foodId);
		return foodOption;
	}
	
	
	
	// 리뷰 작성
	@PostMapping("/store/review")
	public String review(Review review, MultipartFile file, @AuthenticationPrincipal LoginService user) throws IOException {
		if (file.isEmpty()) {
			String img = "";
			review.setReviewImg(img);
		} else {
			String img = uploadFile.fildUpload(file);
			review.setReviewImg(img);
		}
		long userId = user.getUser().getId();
		review.setUserId(userId);

		storeService.reviewWrite(review);

		return "redirect:/orderList";
	}
	
	
	// 리뷰 수정
	@PostMapping("/store/reviewModify")
	public String reviewModify(Review review, MultipartFile file, @AuthenticationPrincipal LoginService user, HttpServletRequest request) throws IOException {
		if(!file.isEmpty()){
			String img = uploadFile.fildUpload(file);
			review.setReviewImg(img);
		}
		long userId = user.getUser().getId();
		review.setUserId(userId);

		storeService.reviewModify(review);
		
		String domain = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
		String referer = request.getHeader("referer");
		String redirect = referer.replace(domain, ""); 

		return "redirect:" + redirect;
	}
	
	
	
	// 찜하기
	@ResponseBody
	@PostMapping("/store/likes")
	public long likes(long id, String likes, @AuthenticationPrincipal LoginService user) throws Exception {
		
		long userId = 0;
		if (user == null) {
			System.out.println("찜하기 비회원");
			new CookieManager().likes(id);
			
		} else {
			System.out.println("찜하기 회원");
			userId = user.getUser().getId();
			storeService.likes(id, likes, userId);
		}
		return userId;
	}

	
	
	// 찜한 가게 목록
	@GetMapping("/likes/store")
	public String likes(Model model, @AuthenticationPrincipal LoginService user) throws Exception {
		long userId = 0;
		List<Store> likesList = new ArrayList<>();
		if (user == null) {
			CookieManager cm = new CookieManager();
			String likes = cm.findCookie("LIKES_LIST");
			
			if(likes != null && !"".equals(likes)) {
				likesList = storeService.likesListNonUser(likes);
			}
			
		} else {
			userId = user.getUser().getId();
			likesList = storeService.likesList(userId);
		}
		model.addAttribute("likesList", likesList);
		return "/store/likes";
	}
	
	
	
	@GetMapping({"/store/search", "/store/search/{page}"})
	public String search(Integer address1, String keyword, @PathVariable(required = false) Integer page, Model model) throws Exception {

		CookieManager cm = new CookieManager();
		
		if(keyword != null) {
			LinkedHashSet<String> keywordList = cm.saveKeyword(keyword);
			System.out.println("검색어 목록 : " + keywordList);
			model.addAttribute("keywordList", keywordList);
			
			Page p = new Page(page);
			List<Store> storeList = storeService.storeSearch(keyword, address1 / 100, p);
			model.addAttribute("keyword", keyword);
			
			if(storeList.size() == 0) {
				model.addAttribute("noSearch", true);
			} else {
				System.out.println("size = " + storeList.size());
				p.totalPage(storeList.get(0).getListCount());
				model.addAttribute("page", p);
				model.addAttribute("storeList", storeList);
			}
		} else {
			String key = cm.findCookie("KEYWORD");
			if(key != null) {
				String[] keywordList = key.split(", ");
				model.addAttribute("keywordList", keywordList);
			}
		}
		return "store/search";
	}
	
	@ResponseBody
	@DeleteMapping("/store/keyword-all")
	public String keywordDelete(HttpServletResponse response, HttpServletRequest request) throws UnsupportedEncodingException {
		Cookie cookie = new Cookie("KEYWORD", null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		return "redirect:/";
	}
	
	@ResponseBody
	@DeleteMapping("/store/keyword-one")
	public void keywordDelete(String keyword, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		CookieManager cm = new CookieManager();
		String findCookie = cookieManager.findCookie("keyword");
		if(keyword != null) {
			LinkedHashSet<String> keywordList = cm.saveKeyword(keyword);
			keywordList.remove(keyword);
			System.out.println(keywordList);
			
			String resultList = String.join(", ", keywordList);
			System.out.println(resultList);
			cm.addCookie("KEYWORD",resultList);
			
		}
	}
}
	
	
	
