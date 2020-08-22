package com.wx.service;

import java.util.List;

import com.wx.pojo.QChat;

public interface QChatService {
	/**
	 * ��ѯȺ���е������û�
	 * @param qname
	 * @return
	 */
	List<QChat> selAllQChatByQNameService(String qname);
	
	/**
	 * ��ѯȺ����ָ���ǳƵ��û�
	 * @param qname
	 * @param nickname
	 * @return
	 */
	QChat selQChatUserInfoByNicknameService(String qname,String nickname);
	/**
	 * ����Ⱥ��
	 * @param qname
	 * @param qaccount
	 * @param flag
	 */
	int createQChatService(String qname,String qaccount,Integer flag);
	/**
	 * ��ѯ�û����������Ⱥ��
	 * @param account
	 * @return
	 */
	List<QChat> selAllQByAccountService(String account);
	/**
	 * ����Ⱥ��
	 * @param qName
	 * @param qAccount
	 * @param qflag
	 * @return
	 */
	int insertQChatService(String qName,String qAccount,Integer qflag);
	
	/**
	 * �޸�Ⱥ��
	 */
	
	int updateQNameService(String oldQname,String newQname);
	/**
	 * �޸�Ⱥ����
	 * @param note
	 * @param qName
	 * @return
	 */
	int updateQNoteService(String note,String qName);
	/**
	 * �޸�Ⱥ�ǳ�
	 * @param qNickname
	 * @param qName
	 * @param qAccount
	 * @return
	 */
	int updateQNicknameService(String qNickname,String qName,String qAccount);
	/**
	 * �˳�Ⱥ��
	 * @param qAccount
	 * @param qName
	 * @return
	 */
	int deleteQService(String qAccount,String qName);
	
}
