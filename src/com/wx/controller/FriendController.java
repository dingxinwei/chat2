package com.wx.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.wx.pojo.Friends;
import com.wx.pojo.User;
import com.wx.service.FriendService;
import com.wx.service.UserService;
import com.wx.service.impl.FriendServiceImp;
import com.wx.service.impl.UserServiceImp;
import com.wx.util.WebUtils;
/**
 * 处理用户对好友操作
 * @author dxw
 *
 */
@RequestMapping("/friend")
@Controller
public class FriendController{
	//日志对象
	Logger log =  Logger.getLogger(FriendController.class);
	//创建service层对象
	@Autowired
	FriendService service;
	
	//查询指定昵称的好友
	@RequestMapping("/selByName")
	public void selFriendsByNickname(@RequestParam("name")String name,@RequestParam("account")String account,HttpServletResponse resp) throws IOException {
		Friends friends = service.selAllFriendsByNicknameService(name, account);
		if(friends != null && friends.getFriends() != null){
			resp.getWriter().write(new Gson().toJson(friends.getFriends()));
			return;
		}
		
	}
	//删除好友
	@RequestMapping("/del")
	public void deleteFriend(Friends friends ,HttpServletResponse resp) throws IOException {

		int index = service.deleteFriendService(friends.getAccount(),friends.getfAccount());
		if(index > 0){
			resp.getWriter().write("1");
		}else{
			resp.getWriter().write("0");
		}
		
	}
	//修改备注
	@RequestMapping("/updnote")
	public void updateNote(@RequestParam("notes")String note,Friends friends) {
		
		service.updateFriendNotesService(note,friends.getfAccount(),friends.getAccount());
		
	}
	//添加好友
	@RequestMapping("/add")
	public void addFriend(Friends friends) {
		
		service.addFriendService(friends.getAccount(),friends.getfAccount());
	}
	//查找用户
	@RequestMapping("sel")
	public void selUser(@RequestParam("account")String account, HttpServletResponse resp) throws IOException {
		User user = service.selUserService(account);
		resp.getWriter().write(new Gson().toJson(user));
	}
}
