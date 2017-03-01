package com.qdum.llhb.ypcd.controller;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.suggestion.model.Suggestion;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ypcd.model.LeaveMessage;
/**
 * 云铺管理 - 留言查看
 * @author zhangwn
 *
 */
@ControllerBind(controllerKey="/ypcd/leaveMessage")
public class LeaveMessageController extends Controller {
	
	public void index(){
		User user = UserUtils.getUser();
		int pageSize = 8;
        String temp = getPara("pageSize");
        if(temp!=null && !"".equals(temp) && temp.matches("[0-9]+")){
            pageSize = Integer.parseInt(temp);
        }
        String queryWord = getPara("queryWord") == null ? "" : getPara("queryWord") ;
        Page<Record> recordPage =  LeaveMessage.dao.getLeaveMessages(getParaToInt(0, 1), pageSize, user.getId(),queryWord);
        setAttr("recordPage",recordPage);
        setAttr("queryWord",queryWord);
        render("LeaveMessage.jsp");
	}
	
}
