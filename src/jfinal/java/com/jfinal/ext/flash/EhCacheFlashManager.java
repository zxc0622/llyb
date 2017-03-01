package com.jfinal.ext.flash;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.ReentrantLock;

import javax.servlet.http.HttpSession;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 基于ehcache实现的Flash管理器
 * 
 * @author gordonyang
 *
 */
public class EhCacheFlashManager implements FlashManager {

	/**
     * falsh 存放在cache中的值。
     */
    private final String flashCacheName;

    /**
     * 锁
     */
    private ReentrantLock lock = new ReentrantLock();

    /**
     * 构造函数
     * @param flashCacheName  ehcache 中的key值。
     */
    public EhCacheFlashManager(String flashCacheName ) {
    	if (StrKit.isBlank(flashCacheName)){
			throw new IllegalArgumentException("flashCacheName can not be blank.");
    	}
    	this.flashCacheName = flashCacheName;
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
    	String sessionKey = session.getId();
        sessionKey = sessionKey + curAction.replace("/", "_");
        try{
        	lock.lock();
            ConcurrentHashMap<String, Object> map = null;
	        Object obj = CacheKit.get(flashCacheName, sessionKey);
	        if (obj != null) {
	            map = (ConcurrentHashMap<String, Object>) obj;
	        } else {
	            map = new ConcurrentHashMap<String, Object>();
	            CacheKit.put(flashCacheName, sessionKey, map);
	        }
	        map.put(key, value);
        }finally{
        	lock.unlock();
        }
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
    	String sessionKey = session.getId();
        String oldKey = sessionKey + curAction.replace("/", "_");
        String newkey = sessionKey + nextAction.replace("/", "_");
        try{
        	lock.lock();
	        Object obj = CacheKit.get(flashCacheName, oldKey);
	        if (obj != null) {
	            CacheKit.remove(flashCacheName, oldKey);
	            CacheKit.put(flashCacheName, newkey, obj);
	        }
        }finally{
        	lock.unlock();
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
    	String sessionKey = session.getId();
        String sessionActionKey = sessionKey + curAction.replace("/", "_");
        ConcurrentHashMap<String, Object> map = null;
        try{
        	lock.lock();
	        Object obj = CacheKit.get(flashCacheName, sessionActionKey);
	        if (obj != null) {
	            map = (ConcurrentHashMap<String, Object>) obj;
	            CacheKit.remove(flashCacheName, sessionActionKey);
	        }
        }finally{
        	lock.unlock();
        }
        return map;
    }
    
}
