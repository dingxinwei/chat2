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
 * ����
 * @author dxw
 *
 */
@ServerEndpoint("/chat")
public class ChatServer {
	Logger log =  Logger.getLogger(UserController.class);
	private  UserService service = (UserService)WebUtils.getBean("user");
	//�洢��ǰ�Ự����
	private Session session;
	//�洢��ǰ�ͻ��˵��˺�
	private String account;
	//�洢���пͻ���
	public static Vector<ChatServer> allChannl = new Vector<ChatServer>();
	@OnOpen
	public void onOpen(Session session){
		this.session = session;
		String queryParam = session.getQueryString();
		String value[] = queryParam.split("=");
		this.account = value[1];
		allChannl.add(this);
		
		log.info("["+this.account+"]���ӵ��������������");
		//�������������û�Ϊ����
		service.updatUserOnlineFlagService(this.account, "yes");
		
	}
	@OnMessage
	public void onMessage(String message,Session session){
		int index = message.indexOf(":");
		
		String faccount = message.substring(1, index);
		String msg = message.substring(index+1, message.length());
		String lmsg = this.account + ":" + msg;
		System.out.println(msg);
		if(message.startsWith("@%")){//�����ļ�����Ϣ 
			faccount =  message.substring(2, index);
			lmsg = "%" + this.account + ":" + msg;
		}
		
		if(message.startsWith("@")){//������Ϣ
			for(ChatServer client:allChannl){
				if(client.account.equals(faccount)){
					try {
						client.session.getBasicRemote().sendText(lmsg);	
					} catch (IOException e) {
						log.info("�û�"+this.account+"���͸�"+faccount+"����Ϣת��ʧ�ܣ���ϢΪ"+msg);
					}		
				}
			}
		}else{//������Ϣ
			for(ChatServer client:allChannl){
				if(client.account.equals(faccount)){
					try {
						client.session.getBasicRemote().sendText(msg);	
					} catch (IOException e) {
						log.info("�û�["+this.account+"]���͸�["+faccount+"]������ת��ʧ�ܣ�����Ϊ"+msg);
					}		
				}
			}
		}
		
		
	} 
	@OnClose
	public void onClose(){
		
		allChannl.remove(this);
		log.info("�û�["+this.account+"]�Ͽ����뵥�����������������");
		//�Ͽ����������û�Ϊ������
		service.updatUserOnlineFlagService(this.account, "no");
	}
	@OnError
	public void onError(Throwable throwable){
		log.info("deal with error");
	}
}
