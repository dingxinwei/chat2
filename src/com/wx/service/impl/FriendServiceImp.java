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
	//日志对象
	Logger log =  Logger.getLogger(FriendController.class);
	/**
	 * 查找所有好友
	 */
	@Override
	public Friends selAllFriendsByNicknameService(String name, String account) {
		if(name.contains("%")){//过滤特殊字符
			name = name.replaceAll("%", "");
		}else if(name.contains("_")){
			name = name.replaceAll("_", "");
		}
		name = "%" + name + "%";
		log.info("["+account+"]通过昵称"+name+"查询了好友");
		return friendDao.selAllFriendsByNicknameDao(name, account);
	}
	/**
	 * 添加好友
	 */
	@Override
	public void addFriendService(String account, String fAccount) {
		friendDao.addFriendDao(account, fAccount);
		log.info("["+account+"]添加了账号为["+fAccount+"]的用户为好友");
		
	}

	@Override
	public Friends selAllFriendsService(String account) {
		
		return friendDao.selAllFriendsDao(account);
	}
	/**
	 * 修改好友备注
	 */
	@Override
	public void updateFriendNotesService(String note, String faccount,
			String account) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("note", note);
		map.put("faccount", faccount);
		map.put("account", account);
		log.info("["+account+"]修改了好友["+faccount+"]的备注:"+note);
		friendDao.updateFriendNoteDao(map);
		
	}

	@Override
	public int deleteFriendService(String account, String faccount) {
		int index = friendDao.deleteFriendDao(account, faccount);
		if(index >0){
			log.info("["+account + "]删除好友[" + faccount + "]成功");
		}else{
			log.info("["+account + "]删除好友[" + faccount + "]失败");
		}
		return index;
		
	}
	@Override
	public User selUserService(String account) {
	
		return friendDao.selUserDao(account);
	}

}
