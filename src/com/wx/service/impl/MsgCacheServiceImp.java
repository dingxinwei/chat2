package com.wx.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wx.controller.MsgCacheController;
import com.wx.controller.UserController;
import com.wx.dao.MsgCacheDao;
import com.wx.pojo.MsgCache;
import com.wx.service.MsgCacheService;
@Service("msgcache")
public class MsgCacheServiceImp implements MsgCacheService{
	@Autowired
	MsgCacheDao msgCacheDao;
	//日志对象
	Logger log =  Logger.getLogger(MsgCacheController.class);
	/**
	 * 存储离线消息
	 */
	@Override
	public int insertMsgService(MsgCache msg) {
		log.info("["+msg.getsAccount()+"]发送离线消息给["+msg.getrAccount()+"]消息为："+msg.getMessage());
		return msgCacheDao.insertMsgDao(msg);
	}
	/**
	 * 删除离线消息
	 */
	@Override
	public int deleteMsgService(String rAccount) {
		log.info("["+rAccount+"]删除了离线消息");
		return msgCacheDao.deleteMsgDao(rAccount);
	}
	/**
	 * 查询离线消息
	 */
	@Override
	public List<MsgCache> selectMsgService(String rAccount) {
		log.info("["+rAccount+"]查询了离线消息");
		return msgCacheDao.selectAllMsgDao(rAccount);
	}

}
