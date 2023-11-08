package com.cleanup.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.cleanup.dto.Join;
import com.cleanup.dto.Point;
import com.cleanup.dto.Review;
import com.cleanup.login.LoginService;

public interface UserService {
	void join(Join join);

	int overlapCheck(String value, String valueType);

	List<Point> myPoint(long id);

	ResponseEntity<Map<String, Object>> pointRegist(String giftCardNum, LoginService user);

	List<Review> myReviewList(long id);

	void deleteReview(long id, String orderNum);

	void modifyInfo(String username, String valueType, String value);

	List<String> findId(String email);

	boolean emailCheck(String username, String email);

	boolean phoneCheck(String username, String phone);
}
