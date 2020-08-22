package com.wx.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.wx.pojo.MsgCache;
import com.wx.service.MsgCacheService;
import com.wx.service.impl.MsgCacheServiceImp;
import com.wx.util.WebUtils;
@RequestMapping("/msgcache")
@Controller
public class MsgCacheController{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//日志对象
	Logger log =  Logger.getLogger(FriendController.class);
	//创建service层对象
	@Autowired
	MsgCacheService service;
	
	//查询离线消息
	@RequestMapping("/select")
	public void selectMsg(@RequestParam("rAccount")String rAccount, HttpServletResponse resp) throws IOException {
		List<MsgCache> list = service.selectMsgService(rAccount);
		if(null != list){
			resp.getWriter().write(new Gson().toJson(list));
		}
	}
	//删除离线消息
	@RequestMapping("/delete")
	public void deleteMsg(@RequestParam("rAccount")String rAccount) {
		service.deleteMsgService(rAccount);	
	}
	//存储离线消息
	@RequestMapping("/insert")
	public void insertMsg(MsgCache msg) {
		System.out.println(msg.getrAccount()+"-->"+msg.getsAccount());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date sendTime=null;
		try {
			if(msg.getSendTime() != null){
				sendTime = sdf.parse(msg.getSendTime().toString());
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		service.insertMsgService(msg);
		return;
	}
}
