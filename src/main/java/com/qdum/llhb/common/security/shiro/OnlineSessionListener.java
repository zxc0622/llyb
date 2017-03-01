package com.qdum.llhb.common.security.shiro;

import java.util.Collection;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

import com.qdum.llhb.common.security.shiro.SystemAuthorizingRealm.Principal;

public class OnlineSessionListener implements SessionListener {

	@Override
	public void onStart(Session session) {
		org.apache.shiro.web.mgt.DefaultWebSecurityManager sm = (DefaultWebSecurityManager) SecurityUtils.getSecurityManager();
		DefaultWebSessionManager dsm = (DefaultWebSessionManager) sm.getSessionManager();
		SessionDAO dao = dsm.getSessionDAO();
		//获取当前系统中所有有效session
		Collection<Session> sessions = dao.getActiveSessions();
		for (Session se : sessions) {
			SimplePrincipalCollection spc = (SimplePrincipalCollection)(se.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));
			if(null != spc){
				Principal p = (Principal)(spc.getPrimaryPrincipal());
				//打印session对应的登录用户名
				System.out.println(p.getLoginName());
			}
		}
	}

	@Override
	public void onStop(Session session) {
	}

	@Override
	public void onExpiration(Session session) {
	}

}
