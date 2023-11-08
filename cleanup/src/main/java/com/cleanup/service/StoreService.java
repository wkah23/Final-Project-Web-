package com.cleanup.service;

import java.util.List;

import com.cleanup.dto.FoodOption;
import com.cleanup.dto.Review;
import com.cleanup.dto.Store;
import com.cleanup.dto.StoreDetail;
import com.cleanup.util.Page;

public interface StoreService {
	List<Store> storeList(int category, int address);
	
	List<Store> storeList(int category, int address, String sort, int page);

	StoreDetail storeDetail(long id, long userId);
	
	// 해당 메뉴의 옵션 가져오기
	List<FoodOption> foodOption(int foodId);
	
	void reviewWrite(Review review);
	
	void reviewModify(Review review);
	
	// 찜
	void likes(long storeId, String likes, long userId);
	
	// 찜한 가게들
	List<Store> likesList(long userId);

	List<Store> likesListNonUser(String likes);

	List<Store> storeSearch(String keyword, int address, Page p);
	
}

