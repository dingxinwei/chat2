package com.wx.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.wx.controller.FriendController;
import com.wx.controller.UserController;
import com.wx.dao.FriendDao;
import com.wx.pojo.Friends;
import com.wx.pojo.User;
import com.wx.service.FriendService;
@Service("friend")
public class FriendServiceImp implements FriendService {
	@Autowired
	FriendDao friendDao;
	//��־����
	Logger log =  Logger.getLogger(FriendController.class);
	/**
	 * �������к���
	 */
	@Override
	public Friends selAllFriendsByNicknameService(String name, String account) {
		if(name.contains("%")){//���������ַ�
			name = name.replaceAll("%", "");
		}else if(name.contains("_")){
			name = name.replaceAll("_", "");
		}
		name = "%" + name + "%";
		log.info("["+account+"]ͨ���ǳ�"+name+"��ѯ�˺���");
		return friendDao.selAllFriendsByNicknameDao(name, account);
	}
	/**
	 * ��Ӻ���
	 */
	@Override
	public void addFriendService(String account, String fAccount) {
		friendDao.addFriendDao(account, fAccount);
		log.info("["+account+"]������˺�Ϊ["+fAccount+"]���û�Ϊ����");
		
	}

	@Override
	public Friends selAllFriendsService(String account) {
		
		return friendDao.selAllFriendsDao(account);
	}
	/**
	 * �޸ĺ��ѱ�ע
	 */
	@Override
	public void updateFriendNotesService(String note, String faccount,
			String account) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("note", note);
		map.put("faccount", faccount);
		map.put("account", account);
		log.info("["+account+"]�޸��˺���["+faccount+"]�ı�ע:"+note);
		friendDao.updateFriendNoteDao(map);
		
	}

	@Override
	public int deleteFriendService(String account, String faccount) {
		int index = friendDao.deleteFriendDao(account, faccount);
		if(index >0){
			log.info("["+account + "]ɾ������[" + faccount + "]�ɹ�");
		}else{
			log.info("["+account + "]ɾ������[" + faccount + "]ʧ��");
		}
		return index;
		
	}
	@Override
	public User selUserService(String account) {
	
		return friendDao.selUserDao(account);
	}

}
