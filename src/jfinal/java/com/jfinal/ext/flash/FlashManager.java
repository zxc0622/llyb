package com.jfinal.ext.flash;

import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

public interface FlashManager {
	
	/**
	 * Flash msg 默认key值
	 */
	public String FLASH_MSG_KEY = "msg";

	/**
	 * 添加flash信息到缓存中。
	 *
	 * @param sessionKey
	 *            session路径
	 * @param curAction
	 *            当前ActionPath
	 * @param key
	 *            键
	 * @param value
	 *            值
	 */
	public void setFlash(HttpSession session, String curAction, String key,
			Object value);

	/***
	 * 在调用redirect forwardAction
	 * 时回调此接口，将以当前actionPath为key更替为下一个请求actionPath作为key。
	 *
	 * @param sessionKey
	 *            session的Id值
	 * @param curAction
	 *            当前ActionPath
	 * @param nextAction
	 *            下一个ActionPath
	 */
	public void updateFlashKey(HttpSession session, String curAction,
			String nextAction);

	/**
	 * 从cache中取得Flash的Map
	 *
	 * @param sessionKey
	 *            session路径
	 * @param curAction
	 *            当前ActionPath
	 * @return Flash的Map
	 */
	public ConcurrentHashMap<String, Object> getFlash(HttpSession session,
			String curAction);
}
