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
	//��־����
	Logger log =  Logger.getLogger(UserController.class);
	/**
	 * �û���¼
	 */
	@Override
	public User checkLoginService(String account,String pwd) {
		User user = userDao.checkLoginDao(account,pwd);
		if(null!=user){//��¼�ɹ���ӡ��־
			log.info("["+account+"]��¼�ɹ�");
		}
		return user;
	}
	/**
	 * �û�ע��
	 */
	@Override
	public int regService(User u) {
		int index = userDao.regDao(u);
		if(index>0){//ע��ɹ���ӡ��־
			log.info("["+u.getAccount()+"]ע��ɹ�");
		}
		return index;
	}
	/**
	 * �޸��û���Ϣ
	 */
	@Override
	public void updateUserInfoService(User user) {
		
		int index = userDao.updateUserInfoDao(user);
		if(index > 0){
			log.info("["+user.getAccount()+"]�޸��˸�����Ϣ");
		}
		
	}
	
	/**
	 * �޸�����
	 */
	@Override
	public int updataUserPwdService(String account, String pwd) {
		int index = userDao.updataUserPwdDao(account, pwd);
		if(index > 0){
			log.info("["+account + "]�޸�������");
		}
		return index;
	}
	/**
	 * ��ѯ�û�����
	 */
	@Override
	public String selUserPwdService(String account) {
		
		return userDao.selUserPwdDao(account);
	}
	
	
	/**
	 * �޸ĵ�¼��־
	 */
	@Override
	public int updatUserOnlineFlagService(String account, String flag) {
		
		return userDao.updatUserOnlineFlagDao(account, flag);
	}
	
}
