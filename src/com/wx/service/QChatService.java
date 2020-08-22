package com.wx.service;

import java.util.List;

import com.wx.pojo.QChat;

public interface QChatService {
	/**
	 * 查询群聊中的所有用户
	 * @param qname
	 * @return
	 */
	List<QChat> selAllQChatByQNameService(String qname);
	
	/**
	 * 查询群聊中指定昵称的用户
	 * @param qname
	 * @param nickname
	 * @return
	 */
	QChat selQChatUserInfoByNicknameService(String qname,String nickname);
	/**
	 * 创建群聊
	 * @param qname
	 * @param qaccount
	 * @param flag
	 */
	int createQChatService(String qname,String qaccount,Integer flag);
	/**
	 * 查询用户加入的所有群聊
	 * @param account
	 * @return
	 */
	List<QChat> selAllQByAccountService(String account);
	/**
	 * 加入群聊
	 * @param qName
	 * @param qAccount
	 * @param qflag
	 * @return
	 */
	int insertQChatService(String qName,String qAccount,Integer qflag);
	
	/**
	 * 修改群名
	 */
	
	int updateQNameService(String oldQname,String newQname);
	/**
	 * 修改群公告
	 * @param note
	 * @param qName
	 * @return
	 */
	int updateQNoteService(String note,String qName);
	/**
	 * 修改群昵称
	 * @param qNickname
	 * @param qName
	 * @param qAccount
	 * @return
	 */
	int updateQNicknameService(String qNickname,String qName,String qAccount);
	/**
	 * 退出群聊
	 * @param qAccount
	 * @param qName
	 * @return
	 */
	int deleteQService(String qAccount,String qName);
	
}
