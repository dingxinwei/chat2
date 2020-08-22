package com.wx.service;

import com.wx.pojo.Friends;
import com.wx.pojo.User;

public interface FriendService {
	/**
	 * 查找用户
	 * @param account 查询用户
	 * @return 返回查到的用户信息
	 */
	User selUserService(String account);
	/**
	 * 查询指定昵称的好友
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
	 * 查询所有好友
	 * @param account
	 * @return
	 */
	
	Friends  selAllFriendsService(String account);
	/**
	 * 修改好友备注
	 * @param note 备注
	 * @param faccount 好友账号
	 * @param account 用户账号
	 */
	void updateFriendNotesService(String note, String faccount, String account);
	/**
	 * 删除好友
	 * @param account
	 * @param faccount
	 * @return
	 */
	int deleteFriendService(String account,String faccount);
	
}
