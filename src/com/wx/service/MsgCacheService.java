package com.wx.service;

import java.util.List;

import com.wx.pojo.MsgCache;

public interface MsgCacheService {
	/**
	 * �洢������Ϣ
	 * @param msg
	 * @return
	 */
	int insertMsgService(MsgCache msg);
	/**
	 * ɾ���û�������������Ϣ
	 * @param rAccount
	 * @return
	 */
	int deleteMsgService(String rAccount);
	/**
	 * ��ѯ�û�������������Ϣ
	 * @param rAccount
	 * @return
	 */
	List<MsgCache> selectMsgService(String rAccount);
}
