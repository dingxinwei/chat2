package com.wx.service;

import java.util.List;

import com.wx.pojo.Friends;
import com.wx.pojo.MsgCache;
import com.wx.pojo.QChat;
import com.wx.pojo.User;
/**
 * service��ӿ�
 * @author dxw
 *
 */
public interface UserService {
	/**
	 * 
	 * @param account �˺�
	 * @param pwd ����
	 * @return �����û�����
	 */
	
	User checkLoginService(String account,String pwd);
	/**
	 * �û�ע��
	 * @param u
	 * @return
	 */
	int regService(User u);
	/**
	 * ��ѯ�û�����
	 * @param account
	 * @return
	 */
	String selUserPwdService(String account);
	/**
	 * �޸��û�����
	 * @param account
	 * @param pwd
	 * @return
	 */
	int updataUserPwdService(String account,String pwd);
	/**
	 * �޸��û���Ϣ
	 * @param value  �޸ĵ�ֵ
	 * @param account �޸ĵ��˺�
	 * @param name �޸ĵ�����
	 */
	void updateUserInfoService(User user);
	
	
	
	/**
	 * �޸ĵ�¼��־
	 * @param account
	 * @param flag
	 * @return
	 */
	int  updatUserOnlineFlagService(String account,String flag);
	
	
}	

