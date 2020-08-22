package com.wx.pojo;

import java.io.Serializable;
/**
 * 群聊实体类
 * @author dxw
 *
 */
public class QChat implements Serializable{

	private String qName;
	private String qAccount;
	private String qNote;
	private Integer qFlag;
	private String qNickname;
	public QChat(String qName, String qAccount, String qNote,
			Integer qFlag, String qNickname) {
		super();
		
		this.qName = qName;
		this.qAccount = qAccount;
		this.qNote = qNote;
		this.qFlag = qFlag;
		this.qNickname = qNickname;
	}
	public QChat() {
		super();
	}
	
	public String getqName() {
		return qName;
	}
	public void setqName(String qName) {
		this.qName = qName;
	}
	public String getqAccount() {
		return qAccount;
	}
	public void setqAccount(String qAccount) {
		this.qAccount = qAccount;
	}
	public String getqNote() {
		return qNote;
	}
	public void setqNote(String qNote) {
		this.qNote = qNote;
	}
	public Integer getqFlag() {
		return qFlag;
	}
	public void setqFlag(Integer qFlag) {
		this.qFlag = qFlag;
	}
	public String getqNickname() {
		return qNickname;
	}
	public void setqNickname(String qNickname) {
		this.qNickname = qNickname;
	}
	
}
