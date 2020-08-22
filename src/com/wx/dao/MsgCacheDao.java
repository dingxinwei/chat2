package com.wx.dao;

import java.util.List;

import com.wx.pojo.MsgCache;

public interface MsgCacheDao {
	/**
	 * 离线缓存消息
	 * @param msg
	 * @return
	 */
	int insertMsgDao(MsgCache msg);
	/**
	 * 删除指定用户的缓存消息
	 * @param rAccount
	 * @return
	 */
	int deleteMsgDao(String rAccount);
	/**
	 * 查询指定用户的所有缓存消息
	 * @param rAccount
	 * @return
	 */
	List<MsgCache> selectAllMsgDao(String rAccount);
}
