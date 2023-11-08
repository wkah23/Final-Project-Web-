package com.cleanup.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cleanup.login.LoginService;

@Controller
public class MainController {

	@GetMapping("/")
	public String main(HttpSession session, @AuthenticationPrincipal LoginService user) {
		System.out.println(user);
		
		
		return "home";
	}
	@ResponseBody
	@PostMapping("/addressModify")
	public void addressModify(String address1, String address2, HttpServletResponse response, HttpSession session)
			throws UnsupportedEncodingException {
//		address1 = 우편번호
//		address2 = 주소

		System.out.println("address1 =" + address1);
		System.out.println("address2 =" + address2);
		
        // 넘어온 우편번호와 주소를 json형태로 변환
		String address = "{\"address1\" : \"" + address1 + "\",\"address2\" : \"" + address2 + "\"}"; 
		
		// 쿠키에 JSON으로 저장
		Cookie cookie = new Cookie("BMaddress", URLEncoder.encode(address, "UTF-8"));

		int age = 60 * 60 * 24 * 7;
		cookie.setMaxAge(age);

		response.addCookie(cookie);

		// 세션에 map으로 저장
		Map<String, String> addMap = new HashMap<>();
		addMap.put("address1", address1);
		addMap.put("address2", address2);
		session.setMaxInactiveInterval(3600 * 3);
		session.setAttribute("BMaddress", addMap);
	}
	
	
	
	
	@GetMapping("/test")
	public String test(String input) {
		System.out.println("테스트페이지");
		System.out.println(input);
		return "test";
	}
	
	
	@ResponseBody
	@GetMapping("/test2")
	public String test2(String input) {
		System.out.println(input);
		
		
		
		return input;
	}
	
	
	
	
	
	
	
}

