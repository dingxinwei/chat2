package com.wx.service;

import java.util.List;

import com.wx.pojo.MsgCache;

public interface MsgCacheService {
	/**
	 * 存储离线消息
	 * @param msg
	 * @return
	 */
	int insertMsgService(MsgCache msg);
	/**
	 * 删除用户的所有离线消息
	 * @param rAccount
	 * @return
	 */
	int deleteMsgService(String rAccount);
	/**
	 * 查询用户的所有离线消息
	 * @param rAccount
	 * @return
	 */
	List<MsgCache> selectMsgService(String rAccount);
}
