package com.wx.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wx.pojo.QChat;
/**
 *处理用户对群聊的操作
 */
public interface QChatDao {
	/**
	 * 创建群聊
	 * @param qname 群名
	 * @param qaccount 成员账号
	 * @param qflag 标记 0群主 1群成员
	 * @return
	 */
	int createQChatDao(@Param("qname")String qName,@Param("qaccount")String qAccount,@Param("qflag")Integer qFlag);
	/**
	 * 查询用户加入的群聊
	 * @param account
	 * @return
	 */
	List<QChat> selAllQByAccountDao(String account);
	/**
	 * 加入群聊
	 * @param qName 群名
	 * @return
	 */
	int insertQChatDao(@Param("qname")String qName,@Param("qAccount")String qAccount,@Param("qflag")Integer qFlag);
	/**
	 * 修改群名
	 * @param oldQname
	 * @param newQname
	 * @return
	 */
	int updataQNameDao(@Param("oldQname")String oldQname,@Param("newQname")String newQname);
	/**
	 *  修改群公告
	 * @param note
	 * @param Qname
	 * @return
	 */
	int updateQNoteDao(@Param("note")String note,@Param("Qname")String qName);
	/**
	 * 修改群昵称
	 * @param map
	 * @return
	 */
	int updateQNicknameDao(Map<String,String> map);
	/**
	 * 退出群聊
	 */
	int deleteQDao(@Param("qAccount")String qAccount,@Param("qName")String qName);
	/**
	 * 查询群聊中的所有用户
	 * @param qname
	 * @return
	 */
	List<QChat> selAllQChatByQNameDao(String qName);
	/**
	 * 查询群聊中的指定昵称的用户
	 * @param qName
	 * @param nickname
	 * @return
	 */
	QChat selQChatUserInfoByNicknameDao(@Param("qName")String qName,@Param("nickname")String nickname);

}
