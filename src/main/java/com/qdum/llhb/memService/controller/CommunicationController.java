package com.qdum.llhb.memService.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import com.jfinal.kit.StrKit;
import com.jfinal.log.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.AdminInterceptor;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;
import com.qdum.llhb.common.security.shiro.SystemAuthorizingRealm.Principal;
import com.qdum.llhb.memService.model.ChatHistory;
import com.qdum.llhb.memService.model.ChatRecord;
import com.qdum.llhb.memService.model.Message;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 站内交流
 *
 * @author zhangxm
 */

@ControllerBind(controllerKey = "/memSerevice/communication")
@Before(AdminInterceptor.class)
public class CommunicationController extends Controller {

    private static final Logger LOGGER = Logger.getLogger(CommunicationController.class);

    public void index() {
        User user = UserUtils.getUser();
        List<Record> rec = ChatHistory.dao.getRecs(user.getId());//收到的会话
        List<Record> send = ChatHistory.dao.getSends(user.getId());//发起的会话
        long chatNotRead = ChatRecord.dao.getNotReadCount(-1, user.getId());
        long messNotRead = Message.dao.getNotRead(user.getId());
        setAttr("chatNotRead", chatNotRead);//未读对话
        setAttr("messNotRead", messNotRead);//未读消息
        setAttr("rec", rec);
        setAttr("send", send);
        render("communication.jsp");
    }

    /**
     * 跳转到聊天
     */
    public void goChat() {
        User user = UserUtils.getUser();
        long id = getParaToLong("id");
        ChatHistory h = ChatHistory.dao.getHistoryById(user.getId(), id);
        boolean result = true;
        if (h == null) {
            ChatHistory c = new ChatHistory();
            c.set("from_user", user.getId());
            c.set("to_user", id);
            c.set("create_by", user.getId());
            c.set("create_date", new Date());
            result = c.save();
        } else {
            h.set("update_by", user.getId());
            h.set("update_date", new Date());
            result = h.update();
        }
        if (result == true) {
            List<Record> mem = User.dao.getMemberMessage(id);
            if (mem.size() > 0) {
                String loginName = mem.get(0).getStr("loginName");
                int status = 0;
                org.apache.shiro.web.mgt.DefaultWebSecurityManager sm = (DefaultWebSecurityManager) SecurityUtils.getSecurityManager();
                DefaultWebSessionManager dsm = (DefaultWebSessionManager) sm.getSessionManager();
                SessionDAO dao = dsm.getSessionDAO();
                //获取当前系统中所有有效session
                Collection<Session> sessions = dao.getActiveSessions();
                for (Session se : sessions) {
                    SimplePrincipalCollection spc = (SimplePrincipalCollection) (se.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));
                    if (null != spc) {
                        Principal p = (Principal) (spc.getPrimaryPrincipal());
                        if (p.getLoginName().equals(loginName)) {
                            status = 1;
                            break;
                        }
                    }
                }
                //聊天记录
                List<Record> chatRecords = ChatRecord.dao.getChatRecords(user.getId()+"",id+"");
                setAttr("chatRecords",chatRecords);
                long chatNotRead = ChatRecord.dao.getNotReadCount(-1, user.getId());
                long messNotRead = Message.dao.getNotRead(user.getId());
                setAttr("chatNotRead", chatNotRead);//未读对话
                setAttr("messNotRead", messNotRead);//未读消息
                setAttr("status", status);
                List<Record> record = ChatRecord.dao.findNotRead(id, user.getId());
                setAttr("record", record);
                setAttr("mem", mem.get(0));
                setAttr("loginName", user.getLoginName());
                render("memberChat.jsp");
            }
        }
        ChatRecord.dao.setRead(id, user.getId());
    }

    /**
     * 会员是否存在
     */
    public void chatCheck() {
        String loginName = getPara("loginName");
        if (StrKit.isBlank(loginName)) {
            LOGGER.error("参数<loginName>无效！请检查参数<loginName>是否传值!");
        }
        User user = User.dao.findByUsername(loginName);
        Long id = -1L;
        if (user != null) {
            if (loginName.equals(UserUtils.getUser().getLoginName())) {
                id = -2L;
            } else {
                id = user.getId();
            }
        }
        renderText(id.toString());
    }

    /**
     * 聊天保存
     */
    public void saveChat() {
        String text = getPara("content");
        String type = getPara("type");
        String name = getPara("name");
        String url = getPara("url");
        long recId = getParaToLong("recId");
        long sendId = UserUtils.getUser().getId();
        ChatRecord c = new ChatRecord();
        if (type.equals("1")) {//普通文本
            c.set("text", text);
        } else if (type.equals("2")) {//图片
            c.set("url", url);
        } else if (type.equals("3")) {//附件
            c.set("name", name);
            c.set("url", url);
        }
        c.set("send_id", sendId);
        c.set("rec_id", recId);
        c.set("type", type);
        c.set("create_by", sendId);
        c.set("create_date", new Date());
        boolean result = c.save();
        // 保存数据后清除聊天记录缓存 cache key 的规则为 _sendUserId_toUserId
        CacheKit.remove("chatMessage", "_" + sendId + "_" + recId);
        renderJson(result);
    }

    public void getNewMess() {
        User user = UserUtils.getUser();
        long id = getParaToLong("recId");
        //cache key 的规则为 _sendUserId_toUserId
        List<Record> record = CacheKit.get("chatMessage", "_" + id + "_" + user.getId());
        if (null == record) {
            // 如果没有取到缓存，从数据库中读取
            record = ChatRecord.dao.findNotRead(id, user.getId());
            ChatRecord.dao.setRead(id, user.getId());
            CacheKit.put("chatMessage", "_" + id + "_" + user.getId(), record);
        } else {
            // 如果取到了缓存，将缓存数据置为null,否则会导致一条消息被多次展示
            record = new ArrayList<Record>();
        }
        if (record.size() > 0) {
            renderJson(record);
        } else {
            renderNull();
        }

    }

}
