package com.wx.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wx.pojo.QChat;
import com.wx.pojo.User;
/**
 * dao层接口 处理用户对自身的操作
 * @author dxw
 *
 */
public interface UserDao {
	/**
	 * 
	 * @param account 账号
	 * @param pwd 密码
	 * @return 返回一个从数据库中查到的用户对象
	 */
	User checkLoginDao(@Param("account")String account,@Param("pwd")String pwd);
	/**
	 * 
	 * @param u 封装用户注册信息的对象
	 * @return 返回影响的行数
	 */
	int regDao(User u);
	/**
	 * 修改用户信息
	 * user 用户对象
	 * @return 返回影响的行数
	 */
	int updateUserInfoDao(User user);
	
	/**
	 * 修改用户密码
	 * @param account
	 * @param pwd
	 * @return
	 */
	int updataUserPwdDao(@Param("account")String account,@Param("pwd")String pwd);
	/**
	 * 查询用户密码
	 * @param account
	 * @return
	 */
	String selUserPwdDao(String account);
	/**
	 * 修改登录标志
	 * 
	 */
	int updatUserOnlineFlagDao(@Param("account")String account,@Param("flag")String onlineFlag);
}
