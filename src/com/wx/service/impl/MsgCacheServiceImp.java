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
	//��־����
	Logger log =  Logger.getLogger(MsgCacheController.class);
	/**
	 * �洢������Ϣ
	 */
	@Override
	public int insertMsgService(MsgCache msg) {
		log.info("["+msg.getsAccount()+"]����������Ϣ��["+msg.getrAccount()+"]��ϢΪ��"+msg.getMessage());
		return msgCacheDao.insertMsgDao(msg);
	}
	/**
	 * ɾ��������Ϣ
	 */
	@Override
	public int deleteMsgService(String rAccount) {
		log.info("["+rAccount+"]ɾ����������Ϣ");
		return msgCacheDao.deleteMsgDao(rAccount);
	}
	/**
	 * ��ѯ������Ϣ
	 */
	@Override
	public List<MsgCache> selectMsgService(String rAccount) {
		log.info("["+rAccount+"]��ѯ��������Ϣ");
		return msgCacheDao.selectAllMsgDao(rAccount);
	}

}
