package com.qdum.llhb.common.security.shiro;

public class UserOpenidForQqToken extends org.apache.shiro.authc.UsernamePasswordToken {

	private static final long serialVersionUID = 1L;

	private String userId;

	//qq info
	private String openid;

	public UserOpenidForQqToken() {
		super();
	}

	public UserOpenidForQqToken(String userId, String openid) {
		this.userId = userId;
		this.openid = openid;
	}

	public UserOpenidForQqToken(String openid) {
		this.openid = openid;
	}



	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}




}
