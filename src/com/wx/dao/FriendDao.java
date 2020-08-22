package com.wx.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wx.pojo.Friends;
import com.wx.pojo.QChat;
import com.wx.pojo.User;
/**
 * 处理用户对好友的操作
 * @author dxw
 *
 */
public interface FriendDao {
	/**
	 * 查找用户
	 * @param account 账号
	 * @return 用户对象
	 */
	User selUserDao(String account);
	/**
	 * 添加好友
	 * @param account 自己的账号
	 * @param fAccount 要添加的账号
	 * @return 影响的行数
	 */
	int addFriendDao(@Param("account")String account, @Param("fAccount")String fAccount);
	/**
	 * 查找好友
	 * @param account 用户账号
	 * @return 返回一个好友对象
	 */
	Friends selAllFriendsDao(String account);
	/**
	 * 修改好友备注
	 * @param map
	 */
	void updateFriendNoteDao(Map<String, String> map);
	/**
	 * 删除好友
	 * @param account
	 * @param fAccount
	 * @return
	 */
	int deleteFriendDao(@Param("account")String account, @Param("faccount")String faccount);
	/**
	 * 查询所有成员的账号
	 * @param qName 群名
	 * @return
	 */
	List<QChat> selAllQAccountByQName(String qName);
	/**
	 * 通过昵称查找好友
	 * 
	 */
	Friends selAllFriendsByNicknameDao(@Param("name")String name,@Param("account")String account);
}
