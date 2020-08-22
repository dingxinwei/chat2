package com.wx.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wx.controller.QChatController;
import com.wx.controller.UserController;
import com.wx.dao.QChatDao;
import com.wx.pojo.QChat;
import com.wx.service.QChatService;
@Service("qchat")
public class QChatServiceImp implements QChatService{
	@Autowired
	QChatDao qChatDao;
	//��־����
	Logger log =  Logger.getLogger(QChatController.class);
	@Override
	public List<QChat> selAllQChatByQNameService(String qname) {
		
		return qChatDao.selAllQChatByQNameDao(qname);
	}

	@Override
	public QChat selQChatUserInfoByNicknameService(String qname, String nickname) {
		if(nickname.contains("%")){//���������ַ�
			nickname = nickname.replaceAll("%", "");
		}else if(nickname.contains("_")){
			nickname = nickname.replaceAll("_", "");
		}
		nickname = "%" + nickname + "%";
		return qChatDao.selQChatUserInfoByNicknameDao(qname, nickname);
	}

	@Override
	public int createQChatService(String qname, String qaccount, Integer flag) {
		int index = qChatDao.createQChatDao(qname, qaccount, flag);
		if(index > 0){
			log.info("["+qaccount + "]������Ⱥ�ģ�"+qname);
		}
		return index;
	}

	@Override
	public List<QChat> selAllQByAccountService(String account) {
		
		return qChatDao.selAllQByAccountDao(account);
	}

	@Override
	public int insertQChatService(String qName, String qAccount, Integer qflag) {
		log.info("�û�["+qAccount+"]������Ⱥ�ģ�"+qName);
		return qChatDao.insertQChatDao(qName, qAccount, qflag);
	}

	@Override
	public int updateQNameService(String oldQname, String newQname) {
		log.info("["+oldQname+"]Ⱥ�ĵ����Ʒ����仯��"+newQname);
		return qChatDao.updataQNameDao(oldQname, newQname);
	}

	@Override
	public int updateQNoteService(String note, String qName) {
		log.info("["+qName+"]Ⱥ�ĵ�Ⱥ���汻�޸��ˣ�"+note);
		return qChatDao.updateQNoteDao(note, qName);
	}

	@Override
	public int updateQNicknameService(String qNickname, String qName,
			String qAccount) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("nickname", qNickname);
		map.put("qname", qName);
		map.put("account", qAccount);
		log.info("["+qName+"]Ⱥ���еĳ�Ա["+qAccount+"]�޸���Ⱥ�ǳƣ�"+qNickname);
		return qChatDao.updateQNicknameDao(map);
	}

	@Override
	public int deleteQService(String qAccount, String qName) {
		log.info("["+qName+"]Ⱥ���еĳ�Ա["+qAccount+"]�˳���Ⱥ��");
		return qChatDao.deleteQDao(qAccount, qName);
	}

}
