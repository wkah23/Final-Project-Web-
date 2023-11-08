package com.cleanup.dao;

import java.util.List;
import java.util.Map;

import com.cleanup.dto.Food;
import com.cleanup.dto.OrderCancle;
import com.cleanup.dto.OrderList;
import com.cleanup.dto.Sales;
import com.cleanup.dto.SalesDetail;
import com.cleanup.dto.Store;

public interface AdminDAO {
	
	int pointUpdate(long userId, String info, int point);

	List<Store> myStore(long userId);

	void storeInfoUpdate(Store store);
	
	long addMenu(Food food);

	void addMenuOption(List<Map<String, Object>> optionList);

	void updateMenu(Map<String, Object> map);

	void deleteMenuOption(long foodId);

	void deleteMenu(long storeId, long[] deleteNumber);

	void bossComment(long storeId, String orderNum, String bossComment);

	List<Long> getMyStoreId(long userId);

	List<OrderList> order(Map<String, Object> map);

	void orderAccept(String orderNum, int time, long userId);

	void orderCancle(OrderCancle orderCancle);

	void orderComplete(Map<String, Object> map);

	List<Sales> sales(Map<String, Object> map);

	List<SalesDetail> salesDetail(long storeId, String date);

	



	



}
