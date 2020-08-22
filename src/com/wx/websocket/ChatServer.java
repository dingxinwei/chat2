package com.wx.websocket;
import java.io.IOException;
import java.util.Vector;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;

import com.wx.controller.UserController;
import com.wx.pojo.Friends;
import com.wx.service.UserService;
import com.wx.service.impl.UserServiceImp;
import com.wx.util.WebUtils;
/**
 * 单聊
 * @author dxw
 *
 */
@ServerEndpoint("/chat")
public class ChatServer {
	Logger log =  Logger.getLogger(UserController.class);
	private  UserService service = (UserService)WebUtils.getBean("user");
	//存储当前会话对象
	private Session session;
	//存储当前客户端的账号
	private String account;
	//存储所有客户端
	public static Vector<ChatServer> allChannl = new Vector<ChatServer>();
	@OnOpen
	public void onOpen(Session session){
		this.session = session;
		String queryParam = session.getQueryString();
		String value[] = queryParam.split("=");
		this.account = value[1];
		allChannl.add(this);
		
		log.info("["+this.account+"]连接到单人聊天服务器");
		//建立连接设置用户为在线
		service.updatUserOnlineFlagService(this.account, "yes");
		
	}
	@OnMessage
	public void onMessage(String message,Session session){
		int index = message.indexOf(":");
		
		String faccount = message.substring(1, index);
		String msg = message.substring(index+1, message.length());
		String lmsg = this.account + ":" + msg;
		System.out.println(msg);
		if(message.startsWith("@%")){//发送文件的消息 
			faccount =  message.substring(2, index);
			lmsg = "%" + this.account + ":" + msg;
		}
		
		if(message.startsWith("@")){//聊天消息
			for(ChatServer client:allChannl){
				if(client.account.equals(faccount)){
					try {
						client.session.getBasicRemote().sendText(lmsg);	
					} catch (IOException e) {
						log.info("用户"+this.account+"发送给"+faccount+"的消息转发失败：消息为"+msg);
					}		
				}
			}
		}else{//信令消息
			for(ChatServer client:allChannl){
				if(client.account.equals(faccount)){
					try {
						client.session.getBasicRemote().sendText(msg);	
					} catch (IOException e) {
						log.info("用户["+this.account+"]发送给["+faccount+"]的信令转发失败：信令为"+msg);
					}		
				}
			}
		}
		
		
	} 
	@OnClose
	public void onClose(){
		
		allChannl.remove(this);
		log.info("用户["+this.account+"]断开了与单人聊天服务器的连接");
		//断开连接设置用户为不在线
		service.updatUserOnlineFlagService(this.account, "no");
	}
	@OnError
	public void onError(Throwable throwable){
		log.info("deal with error");
	}
}
