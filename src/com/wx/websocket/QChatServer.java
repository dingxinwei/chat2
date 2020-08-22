package com.wx.websocket;
import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;

import com.wx.controller.UserController;
import com.wx.dao.QChatDao;
import com.wx.pojo.QChat;
import com.wx.util.WebUtils;
/**
 * 群聊
 * @author Administrator
 *
 */

@ServerEndpoint("/qchat")
public class QChatServer {
	Logger log =  Logger.getLogger(UserController.class);
	QChatDao qChatDao = (QChatDao) WebUtils.getBean(QChatDao.class);
	//存储当前会话对象
	private Session session;
	//存储当前客户端的账号
	private String account;
	//存储所有客户端
	public static Vector<QChatServer> allChannl = new Vector<QChatServer>();
	@OnOpen
	public void onOpen(Session session){
		this.session = session;
		String queryParam = session.getQueryString();
		String value[] = queryParam.split("=");
		this.account = value[1];
		allChannl.add(this);
		log.info("["+this.account+"]连接到多人聊天服务器");
	}
	@OnMessage
	public void onMessage(String message,Session session){
		int index = message.indexOf(";");
		String qName = message.substring(1, index);
		message = message.substring(1,message.length());
		List<QChat> qList = qChatDao.selAllQChatByQNameDao(qName);
		for(QChatServer client:allChannl){
			if(this != client){
				for(QChat qchat:qList){
					if(qchat.getqAccount().equals(client.account)){
						try {
							client.session.getBasicRemote().sendText(message);
						} catch (IOException e) {
							log.info("["+qName+"]群聊的聊天消息转发失败，消息为："+message);
						}	
					}
				}
			}
		}
	} 
	@OnClose
	public void onClose(){
		allChannl.remove(this);
		log.info("["+this.account+"]断开了与多人聊天服务器的连接");
	}
	@OnError
	public void onError(Throwable throwable){
		log.info("deal with error");
	}
}
