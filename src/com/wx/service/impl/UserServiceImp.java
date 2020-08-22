package com.wx.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wx.controller.UserController;
import com.wx.dao.UserDao;
import com.wx.pojo.Friends;
import com.wx.pojo.MsgCache;
import com.wx.pojo.QChat;
import com.wx.pojo.User;
import com.wx.service.UserService;
@Service("user")
public class UserServiceImp implements UserService {
	@Autowired
	UserDao userDao;
	//日志对象
	Logger log =  Logger.getLogger(UserController.class);
	/**
	 * 用户登录
	 */
	@Override
	public User checkLoginService(String account,String pwd) {
		User user = userDao.checkLoginDao(account,pwd);
		if(null!=user){//登录成功打印日志
			log.info("["+account+"]登录成功");
		}
		return user;
	}
	/**
	 * 用户注册
	 */
	@Override
	public int regService(User u) {
		int index = userDao.regDao(u);
		if(index>0){//注册成功打印日志
			log.info("["+u.getAccount()+"]注册成功");
		}
		return index;
	}
	/**
	 * 修改用户信息
	 */
	@Override
	public void updateUserInfoService(User user) {
		
		int index = userDao.updateUserInfoDao(user);
		if(index > 0){
			log.info("["+user.getAccount()+"]修改了个人信息");
		}
		
	}
	
	/**
	 * 修改密码
	 */
	@Override
	public int updataUserPwdService(String account, String pwd) {
		int index = userDao.updataUserPwdDao(account, pwd);
		if(index > 0){
			log.info("["+account + "]修改了密码");
		}
		return index;
	}
	/**
	 * 查询用户密码
	 */
	@Override
	public String selUserPwdService(String account) {
		
		return userDao.selUserPwdDao(account);
	}
	
	
	/**
	 * 修改登录标志
	 */
	@Override
	public int updatUserOnlineFlagService(String account, String flag) {
		
		return userDao.updatUserOnlineFlagDao(account, flag);
	}
	
}
