package com.wx.util;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

public class WebUtils {
	private static WebApplicationContext ioc = ContextLoader.getCurrentWebApplicationContext();
	public static Object getBean(Class clazz){
		Object obj = ioc.getBean(clazz);
		return obj;
	}
	public static Object getBean(String id){
		Object obj = ioc.getBean(id);
		return obj;
	}
}
