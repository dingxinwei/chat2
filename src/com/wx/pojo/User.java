package com.wx.pojo;

import java.io.Serializable;

/**
 * 用户实体类
 * @author 
 *
 */

public class User implements Serializable{
	private String account;
	private String pwd;
	private String nickname;
	private Integer age;
	private Integer sex;
	private String birth;
	private String notes;
	private String online;
	
	public String getOnline() {
		return online;
	}

	public void setOnline(String online) {
		this.online = online;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public User() {
		super();
	}

	public User(String account, String pwd, String nickname, Integer age,
			Integer sex, String birth, String notes, String online) {
		super();
		this.account = account;
		this.pwd = pwd;
		this.nickname = nickname;
		this.age = age;
		this.sex = sex;
		this.birth = birth;
		this.notes = notes;
		this.online = online;
	}

	
	
	
}
