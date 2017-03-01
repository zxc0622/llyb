package com.qdum.llhb.common.utils;

import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.log.Logger;
import com.jfinal.plugin.ehcache.CacheKit;
import com.qdum.llhb.reg.model.SmsRecord;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016/1/11.
 */
public class ValiCode {
    private  static  final Logger LOGGER = Logger.getLogger(ValiCode.class);
    /**
     * 校验验证码
     * @param tel
     * @param checkCode
     */
    public static  String jiaoyan(String tel,String checkCode){

        String text = "ok";
        //String ischeck = CacheKit.get("checkCode", tel);
        //取发送验证码的时间
        if(null==tel||null==checkCode||tel.equals("undefined")||checkCode.equals("undefined")){
            text = "请输入手机号或验证码";
        }else{
            long time;
            try {
                time = CacheKit.get("checkCode", "time"+tel);
                long now = new Date().getTime();
                long min = (now-time)/60000;
                if(min>10){
                    CacheKit.remove("checkCode", "time"+tel);
                    text = "验证码已过期";
                }else{
                    String code = CacheKit.get("checkCode", tel);
                    if(code.equals(checkCode)){
                        //CacheKit.removeAll("checkCode");
                        text="ok";
                    }else{
                        text ="验证码输入错误";
                    }
                }
            } catch (NullPointerException e) {
                text = "该手机号码的验证码不存在";
            }

        }
        return text;
    }

    /**
     * 发送短信提醒
     * @param phone
     * @param msg
     */
    public static void sendCheckCode(String phone,String msg,String email){
        if(null==phone||"".equals(phone)||msg==null||"".equals(msg)){
        	//sendMsgByEmail(email,msg);
            return;
        }
        //判断手机号是否合法
        if(!PhoneUtils.isPhoneNum(phone)){
            //sendMsgByEmail(email,msg);
            return ;
        }
        String result = "";
        BufferedReader in = null;
        String conid = PropKit.get("conid");
        String conpwd = PropKit.get("conpwd");

        String url = "http://service.winic.org/sys_port/gateway/";
        try {
            String message = URLEncoder.encode(msg, "gb2312");
            String urlNameString = url + "?id=" + conid+"&pwd="+conpwd+"&to="+phone+"&content="+message+"&time=";
            URL realUrl = new URL(urlNameString);
            URLConnection connection = realUrl.openConnection();
            in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
            String line = "";
            while ((line = in.readLine()) != null) {
                result += line;
            }
            String st = result.substring(0,3);
            boolean sta = false;
            sta = st.equals("000");
            SmsRecord sr  = new SmsRecord();
            sr.set("to_num", phone);
            sr.set("content", msg);
            sr.set("send_time", new Date());
            sr.set("send_back", result);
            sr.set("sta", sta);
            sr.save();
        } catch (Exception e) {
            LOGGER.info("发送出现异常");
        }
        finally {
            try {
                if (in != null) {in.close();}
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

    public static void sendMsgByEmail(String email,String msg){
        if(null == email || "".equals(email) || email.indexOf("@")<0){
            return;
        }
        String subject = "优蚁网通知";
        //设置参数值
        Map<String,Object> values = new HashMap<String,Object>();
        values.put("msg",msg);
        //通过freemarker获取配置在xml中的内容
        String html = null;
        try {
            html = XmlSqlUtils.getSql("/html/msg_html.xml","getMsgHtml",values);
        } catch (Exception e) {
            e.printStackTrace();
        }
        EmailUtils.send(subject,html,email,msg);
    }
}
