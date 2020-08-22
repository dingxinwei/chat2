package com.wx.pojo;

import java.io.Serializable;
import java.util.List;
/**
 * 好友实体类
 * @author 
 *
 */
public class Friends implements Serializable{
	private String account;
	private String fAccount;
	
	private List<User> friends;
	public Friends() {
		super();
	}
	public Friends(String account, String fAccount, List<User> friends) {
		super();
		this.account = account;
		this.fAccount = fAccount;
		this.friends = friends;
		
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getfAccount() {
		return fAccount;
	}
	public void setfAccount(String fAccount) {
		this.fAccount = fAccount;
	}
	public List<User> getFriends() {
		return friends;
	}
	public void setFriends(List<User> friends) {
		this.friends = friends;
	}
	
	
	
}
