package com.jfinal.ext.flash;

import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

/**
 * 基于Session实现的Flash管理器
 * 
 * @author gordonyang
 *
 */
public class SessionFlashManager implements FlashManager {

	/**
     *默认存储session前缀
     */
    private final static String sessionKeyPrefix = "_flash_";

    /**
     * 构造函数
     */
    public SessionFlashManager() {
    }

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
    @SuppressWarnings("unchecked")
    public void setFlash(HttpSession session, String curAction, String key,
            Object value) {
    	String sessionKey = sessionKeyPrefix + curAction.replace("/", "_");
        Object obj = session.getAttribute(sessionKey);
        ConcurrentHashMap<String, Object> map = null;
        if (obj != null) {
            map = (ConcurrentHashMap<String, Object>) obj;
        } else {
            map = new ConcurrentHashMap<String, Object>();
            session.setAttribute(sessionKey, map);
        }
        map.put(key, value);
    }

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
            String nextAction) {
        String oldKey = sessionKeyPrefix + curAction.replace("/", "_");
        String newkey = sessionKeyPrefix + nextAction.replace("/", "_");
        Object obj = session.getAttribute(oldKey);
        if (obj != null) {
        	session.removeAttribute(oldKey);
            session.setAttribute(newkey, obj);
        }
    }

    /**
     * 从cache中取得Flash的Map
     *
     * @param sessionKey
     *            session路径
     * @param curAction
     *            当前ActionPath
     * @return Flash的Map
     */
    @SuppressWarnings("unchecked")
    public ConcurrentHashMap<String, Object> getFlash(HttpSession session, String curAction) {
        String sessionActionKey = sessionKeyPrefix + curAction.replace("/", "_");
        ConcurrentHashMap<String, Object> map = null;
        Object obj = session.getAttribute(sessionActionKey);
        if (obj != null) {
            map = (ConcurrentHashMap<String, Object>) obj;
            session.removeAttribute(sessionActionKey);
        }
        return map;
    }
    
}
