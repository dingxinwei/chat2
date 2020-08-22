package com.wx.service;

import java.util.List;

import com.wx.pojo.Friends;
import com.wx.pojo.MsgCache;
import com.wx.pojo.QChat;
import com.wx.pojo.User;
/**
 * service层接口
 * @author dxw
 *
 */
public interface UserService {
	/**
	 * 
	 * @param account 账号
	 * @param pwd 密码
	 * @return 返回用户对象
	 */
	
	User checkLoginService(String account,String pwd);
	/**
	 * 用户注册
	 * @param u
	 * @return
	 */
	int regService(User u);
	/**
	 * 查询用户密码
	 * @param account
	 * @return
	 */
	String selUserPwdService(String account);
	/**
	 * 修改用户密码
	 * @param account
	 * @param pwd
	 * @return
	 */
	int updataUserPwdService(String account,String pwd);
	/**
	 * 修改用户信息
	 * @param value  修改的值
	 * @param account 修改的账号
	 * @param name 修改的属性
	 */
	void updateUserInfoService(User user);
	
	
	
	/**
	 * 修改登录标志
	 * @param account
	 * @param flag
	 * @return
	 */
	int  updatUserOnlineFlagService(String account,String flag);
	
	
}	

