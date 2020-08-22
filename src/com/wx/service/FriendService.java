package com.wx.service;

import com.wx.pojo.Friends;
import com.wx.pojo.User;

public interface FriendService {
	/**
	 * �����û�
	 * @param account ��ѯ�û�
	 * @return ���ز鵽���û���Ϣ
	 */
	User selUserService(String account);
	/**
	 * ��ѯָ���ǳƵĺ���
	 * @param account
	 * @return
	 */
	Friends  selAllFriendsByNicknameService(String name,String account);
	/**
	 * 
	 * @param account
	 * @param fAccount
	 */
	void addFriendService(String account, String fAccount);
	/**
	 * ��ѯ���к���
	 * @param account
	 * @return
	 */
	
	Friends  selAllFriendsService(String account);
	/**
	 * �޸ĺ��ѱ�ע
	 * @param note ��ע
	 * @param faccount �����˺�
	 * @param account �û��˺�
	 */
	void updateFriendNotesService(String note, String faccount, String account);
	/**
	 * ɾ������
	 * @param account
	 * @param faccount
	 * @return
	 */
	int deleteFriendService(String account,String faccount);
	
}
