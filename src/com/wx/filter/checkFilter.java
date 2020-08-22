package com.wx.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wx.pojo.User;
/**
 * 配置过滤器 防止用户直接访问主界面
 * @author 
 *
 */
public class checkFilter implements Filter{

	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpSession hs = ((HttpServletRequest)req).getSession();
		
		User u = (User) hs.getAttribute("user");	
		//当session中没有用户信息则重新登录
		if(null == u){
			
			((HttpServletResponse)resp).sendRedirect("/wxchat/login.jsp");
		}
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}

}
