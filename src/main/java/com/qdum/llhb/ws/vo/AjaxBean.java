package com.qdum.llhb.ws.vo;

/**
 * 返回的ajax内部类
 * 
 * @author rongchao
 *
 */
public class AjaxBean {
	/**
	 * 是否操作成功标识
	 */
	private Boolean isSuccess;

	private String msg;

	private Object obj;

	public Boolean getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(Boolean isSuccess) {
		this.isSuccess = isSuccess;
	}

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
