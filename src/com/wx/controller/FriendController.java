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
 * �����û��Ժ��Ѳ���
 * @author dxw
 *
 */
@RequestMapping("/friend")
@Controller
public class FriendController{
	//��־����
	Logger log =  Logger.getLogger(FriendController.class);
	//����service�����
	@Autowired
	FriendService service;
	
	//��ѯָ���ǳƵĺ���
	@RequestMapping("/selByName")
	public void selFriendsByNickname(@RequestParam("name")String name,@RequestParam("account")String account,HttpServletResponse resp) throws IOException {
		Friends friends = service.selAllFriendsByNicknameService(name, account);
		if(friends != null && friends.getFriends() != null){
			resp.getWriter().write(new Gson().toJson(friends.getFriends()));
			return;
		}
		
	}
	//ɾ������
	@RequestMapping("/del")
	public void deleteFriend(Friends friends ,HttpServletResponse resp) throws IOException {

		int index = service.deleteFriendService(friends.getAccount(),friends.getfAccount());
		if(index > 0){
			resp.getWriter().write("1");
		}else{
			resp.getWriter().write("0");
		}
		
	}
	//�޸ı�ע
	@RequestMapping("/updnote")
	public void updateNote(@RequestParam("notes")String note,Friends friends) {
		
		service.updateFriendNotesService(note,friends.getfAccount(),friends.getAccount());
		
	}
	//��Ӻ���
	@RequestMapping("/add")
	public void addFriend(Friends friends) {
		
		service.addFriendService(friends.getAccount(),friends.getfAccount());
	}
	//�����û�
	@RequestMapping("sel")
	public void selUser(@RequestParam("account")String account, HttpServletResponse resp) throws IOException {
		User user = service.selUserService(account);
		resp.getWriter().write(new Gson().toJson(user));
	}
}
