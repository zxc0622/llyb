package com.qdum.llhb.ws;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import com.qdum.llhb.ws.model.ServiceMain;

import java.text.MessageFormat;

/**
 *类WsUtils的功能描述:工具类方法
 *@author yaoyt
 *@time 16/4/1 下午3:30
 */ 
public class WsUtils {

    public static void sendMsg(String msg, ServiceMain main) {
        Record r = User.getContactInfo(Long.valueOf(main.get("hb_user").toString()));
        if(null != r){
            ValiCode.sendCheckCode(r.getStr("phone"), msg,r.getStr("email"));
        }
    }
}
