package com.cleanup.util;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Service
public class CookieManager {


    
	public String findCookie(String cookieName) throws Exception {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		Cookie[] cookies = attr.getRequest().getCookies();

		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals(cookieName)) {
				return URLDecoder.decode(cookies[i].getValue(), "UTF-8");
			}
		}
		return null;
	}
	
	
	
	public void likes(long storeId) throws Exception  {
		final String LIKES_LIST = "LIKES_LIST";
		String cookie = findCookie(LIKES_LIST);
		List<Long> list = new ArrayList<>();
		
		if(cookie == null) {
			list.add(storeId);
			addCookie(LIKES_LIST, list.toString());
			System.out.println("찜 목록 = " + list);
			return;
		}
		
		StringTokenizer st = new StringTokenizer(cookie, ", ");
		
		while(st.hasMoreTokens()) {
			list.add(Long.parseLong(st.nextToken()));
		}
		
		if(list.contains(storeId)) {
			list.remove(storeId);
		} else {
			list.add(storeId);
		}
		
		if(list.size() == 0) {
			addCookie(LIKES_LIST, "");
		} else {
			addCookie(LIKES_LIST, list.toString());
		}
		
		System.out.println("찜 목록 = " + list);
	}
	
	
	public void addCookie(String name, String value) throws Exception {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		value = value.replaceAll("[\\[\\]]", "");
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "UTF-8"));
//		cookie.setMaxAge(60 * 60 * 24 * 30);
		cookie.setPath("/");
		attr.getResponse().addCookie(cookie);
	}
	
	
	
	public LinkedHashSet<String> saveKeyword(String keyword) throws Exception {
		final String KEYWORD = "KEYWORD";
		final int LIST_SIZE = 5;
		
		String keywordList = findCookie(KEYWORD);
		
		LinkedHashSet<String> set = new LinkedHashSet<>();
		
		if(keywordList == null) {
			set.add(keyword);
			addCookie(KEYWORD, set.toString());
			return set;
		} 
		
		set.add(keyword);
		StringTokenizer st = new StringTokenizer(keywordList, ", ");
		
		while(st.hasMoreTokens() && set.size() < LIST_SIZE) {
			String key = st.nextToken();
			set.add(key);
		}
		addCookie(KEYWORD, set.toString());

		return set;
	}
public LinkedHashSet<String> removeKeyword(HttpServletResponse response, String cookie, String keyword) throws Exception {
		
		LinkedHashSet<String> set = new LinkedHashSet<>();
			
		StringTokenizer st = new StringTokenizer(cookie, ", ");
		
		while (st.hasMoreTokens()) {
			set.add(st.nextToken());
			
			if (set.size() > 7) {
				break;
			}
		}
		
		set.remove(keyword);
		
//		addCookie(set.toString(), "keyword");
		return set;
		
	}

	public LinkedHashSet<String> add(String cookie, String addValue) {
		
		LinkedHashSet<String> list = new LinkedHashSet<>();
		
		if(cookie == null || cookie.equals("")) {
			list.add(addValue);
			return list;
		}
		
		cookie = cookie.replaceAll("[\\[\\]]", "");
		StringTokenizer st = new StringTokenizer(cookie, ", ");
		list.add(addValue);
		
		while(st.hasMoreTokens()) {
			String str = st.nextToken();
			
			if(!list.add(str)) {
				list.remove(str);
			} else {
				list.add(str);
			}
		}
		
		return list;
	}

	
}
 