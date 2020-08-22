package com.wx.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.wx.pojo.QChat;
import com.wx.service.QChatService;
import com.wx.service.UserService;
import com.wx.service.impl.QChatServiceImp;
import com.wx.service.impl.UserServiceImp;
import com.wx.util.WebUtils;
/**
 * 处理对群聊的操作
 * @author dxw
 *
 */
@RequestMapping("/qchat")
@Controller
public class QChatController{
	//日志对象
	Logger log =  Logger.getLogger(UserController.class);
	//创建service层对象
	@Autowired
	QChatService service;
	//查询群聊中的指定昵称的用户
	@RequestMapping("/searchQmem")
	public void selQChatUserInfoByNickname(@RequestParam("qname")String qname,@RequestParam("nickname")String nickname,
			HttpServletResponse resp) throws IOException {
		QChat qchat = service.selQChatUserInfoByNicknameService(qname, nickname);
		resp.getWriter().write(new Gson().toJson(qchat));
		return;
	}
	//查询群聊中的所有用户
	@RequestMapping("/selAllQ")
	public void selAllUserInQChatByQName(@RequestParam("qname")String qname,
			HttpServletResponse resp) throws IOException {
		List<QChat> list = service.selAllQChatByQNameService(qname);
		resp.getWriter().write(new Gson().toJson(list));
		return;
	}
	//退出群聊 
	@RequestMapping("/outQ")
	public void deleteQ(@RequestParam("qName")String qName,@RequestParam("account")String qAccount, HttpServletResponse resp) throws IOException {
		System.out.println(qName+":"+qAccount);
		int index = service.deleteQService(qAccount, qName);
		if(index > 0){
			resp.getWriter().write("1");
			return;
		}
	}
	//修改群昵称
	@RequestMapping("/updateNickname")
	public void updateNickname(QChat qChat) {
	
		service.updateQNicknameService(qChat.getqNickname(), qChat.getqName(), qChat.getqAccount());
		
	}
	//修改群公告
	@RequestMapping("/updateQNote")
	public void updateQNote(@RequestParam("note")String note,@RequestParam("qName")String qName) {
		System.out.println(note+":"+qName);
		service.updateQNoteService(note, qName);
	}
	//修改群名
	@RequestMapping("/updateQName")
	public void updateQName(@RequestParam("oldName")String oldName,@RequestParam("newName") String newName) {
		service.updateQNameService(oldName, newName);
	}

	//加入群聊
	@RequestMapping("/join")
	public void insertQChat(@RequestParam("qname")String qName,@RequestParam("qaccount")String qAccount, HttpServletResponse resp) throws IOException {
		int index = service.insertQChatService(qName, qAccount, 1);
		if(index > 0){
			resp.getWriter().write("1");
			return;
		}
		
	}
	//创建群聊
	@RequestMapping("/createq")
	public void createQChat(@RequestParam("qname")String qName,@RequestParam("qaccount")String qAccount,HttpServletResponse resp) throws IOException {
		System.out.println(qName+":"+qAccount);
		int index = service.createQChatService(qName, qAccount, 0);
		if(index > 0){
			resp.getWriter().write("1");
			return;
		}
		
	}

}
