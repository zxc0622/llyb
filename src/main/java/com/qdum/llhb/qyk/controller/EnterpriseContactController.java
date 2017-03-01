package com.qdum.llhb.qyk.controller;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import com.jfinal.core.ActionKey;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.security.shiro.SystemAuthorizingRealm.Principal;
import com.qdum.llhb.hyzl.model.CompanyZl;
import com.qdum.llhb.qyk.model.Leave;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.Banner;
import com.qdum.llhb.ypcd.model.News;

@ControllerBind(controllerKey = "/Library/contactWay")
public class EnterpriseContactController extends Controller{
	
	/**
	 *联系方式 
	 */
	@ActionKey("/homepage/contact")
	public void enterpriseContact(){
		String enterpriseId =getPara();
        if(StringUtils.isBlank(enterpriseId)){
            enterpriseId = getPara("enterpriseId");
        }
		setAttr("enterpriseId", enterpriseId);
		List<Record> list =CompanyZl.dao.findCompanysSY(StringUtils.isNotBlank(enterpriseId)?Long.valueOf(enterpriseId):-1);
		if(!(list.isEmpty())){
			setAttr("companyList", list.get(0));
		}
		int status = 0;
		org.apache.shiro.web.mgt.DefaultWebSecurityManager sm = (DefaultWebSecurityManager) SecurityUtils.getSecurityManager();
		DefaultWebSessionManager dsm = (DefaultWebSessionManager) sm.getSessionManager();
		SessionDAO dao = dsm.getSessionDAO();
		//获取当前系统中所有有效session
		Collection<Session> sessions = dao.getActiveSessions();
		for (Session se : sessions) {
			SimplePrincipalCollection spc = (SimplePrincipalCollection)(se.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));
			if(null != spc && list.size()!=0){
				Principal p = (Principal)(spc.getPrimaryPrincipal());
				if(p.getLoginName().equals(list.get(0).get("loginname"))){
					status = 1;
					break;
				}
			}
		}
		List<Record> comp=News.dao.findId(enterpriseId);
		if(!(comp.isEmpty())){
			List<Record> list3=News.dao.findPageNewsIDS(comp.get(0).get("id").toString());
			if(!(list3.isEmpty())){
				setAttr("nsList", list3);
			}
		}
		List<Record> hengF=Banner.dao.gethengF(enterpriseId,Banner.CONTACT_BANNER);
		if(!(hengF.isEmpty())){
			setAttr("hengF", hengF.get(0));
		}
		setAttr("status", status);
		render("EnterpriseContact.jsp");
	}
	/**
	 * 留言
	 */
	public void addLeaveWord(){
		String mesTitle=getPara("mesTitle");
		String userName=getPara("userName");
		String userQQ=getPara("userQQ");
		String userMail=getPara("userMail");
		String userPhone=getPara("userPhone");
		String mesContent=getPara("mesContent");
		String enterpriseId=getPara("enterpriseId");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Leave leave =new Leave();
		User user = UserUtils.getUser();
		leave.set("mes_title", mesTitle);
		leave.set("user_name", userName);
		leave.set("user_qq", userQQ);
		leave.set("user_mail", userMail);
		leave.set("user_phone", userPhone);
		leave.set("mes_content", mesContent);
		leave.set("create_date", sdf.format(new Date()));
		if(user.getId()!=null){
			leave.set("create_by", user.getId());
		}
		leave.set("shop_id",enterpriseId);
		leave.save();
		setSessionAttr("sta","1");
		redirect("/homepage/contact/"+enterpriseId+"");
	}
}
