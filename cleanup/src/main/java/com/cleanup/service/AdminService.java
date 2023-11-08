package com.cleanup.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.cleanup.dto.Food;
import com.cleanup.dto.OrderCancle;
import com.cleanup.dto.OrderList;
import com.cleanup.dto.Sales;
import com.cleanup.dto.Store;

public interface AdminService {

	List<Store> myStore(long userId);

	void storeInfoUpdate(Store store);

	void addMenu(Food food, String[] foodOption, Integer[] foodOptionPrice);

	void updateMenu(Food food, String[] foodOption, Integer[] foodOptionPrice, Integer[] optionId);

	void deleteMenu(long storeId, long[] deleteNumber);

	String bossComment(long storeId, String orderNum, String bossComment);

	List<Long> getMyStoreId(long userId);

	List<OrderList> order(long storeId, String list, int page);

	void orderAccept(String orderNum, int time, long userId);

	void orderCancle(OrderCancle orderCancle) throws IOException;

	void orderComplete(String orderNum, long userId);

	Map<String, Object> salesDetail(long storeId, String date, String sort);
	
	List<Sales> sales(long storeId, String date, String term);



}
