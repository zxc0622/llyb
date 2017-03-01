package com.qdum.llhb.identcode.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.ehcache.CacheKit;
import com.qdum.llhb.common.utils.PhoneUtils;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.reg.model.SmsRecord;
public class IdentityCodeController extends Controller {
	
	/*
	 * 发送验证码到手机
	 */
	@ActionKey("/conn")
	public void index(){
		String result = "";
        BufferedReader in = null;
       	String conid = PropKit.get("conid");
        String conpwd = PropKit.get("conpwd");
        String tel = getPara("tel");
        String codefirst = getCheck();
		String msg = "";
        boolean already = true;
        long oriTime = 0;
        try {
            oriTime = CacheKit.get("checkCode", "time"+tel);
            if(StrKit.notNull(oriTime)){
                long now = new Date().getTime();
                long miao = (now-oriTime)/1000;
                if(miao<60){
                    already = false;
                }
            }
        } catch (Exception e) {
            already = true;//为空
        }
        
        System.out.println(codefirst);
        
        //判断是否为邮箱
        if(null != tel && tel.indexOf("@") > 0){
            renderText(SendEmailValidateCode(codefirst,tel));
            return;
        }
        //判断手机号是否合法
        if(!PhoneUtils.isPhoneNum(tel)){
            renderText("手机号或邮箱错误");
            return ;
        }
		if(already){
			String code  =codefirst+"为您的优蚁验证码，请在10分钟内完成操作，如非本人操作，请忽略。";
			String url = "http://service.winic.org/sys_port/gateway/";
			try {
				code = URLEncoder.encode(code, "gb2312");
                String urlNameString = url + "?id=" + conid+"&pwd="+conpwd+"&to="+tel+"&content="+code+"&time=";
				URL realUrl = new URL(urlNameString);
				URLConnection connection = realUrl.openConnection();
				//把手机号和验证码放入到缓存中
				CacheKit.put("checkCode", tel, codefirst);
				//放入当前时间
				CacheKit.put("checkCode", "time"+tel, new Date().getTime());
				in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
				String line = "";
				while ((line = in.readLine()) != null) {
					result += line;
				}
				String st = result.substring(0,3);
				boolean sta = false;
                sta = st.equals("000");
				SmsRecord sr  = new SmsRecord();
				sr.set("to_num", getPara("tel"));
				sr.set("content", code);
				sr.set("send_time", new Date());
				sr.set("send_back", result);
				sr.set("sta", sta);
				sr.save();
                if(sta){
                    msg = "ok";
                }else{
                    msg = "发送验证码出现异常";
                }
			} catch (Exception e) {
				msg = "发送验证码出现异常";
				e.printStackTrace();
			}
			finally {
				try {
					if (in != null) {in.close();}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}else{
			msg = "已经向该手机发送过验证码，请等待";
		}

		renderText(msg);
	}
	/**
	 * 校验验证码
	 * @return
	 */
	@ActionKey("/checkCode")
	public void jiaoyan(){
		String tel = getPara("tel");
		String checkCode  = getPara("checkCode");
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
					CacheKit.remove("checkCode","time"+tel);
					text = "验证码已过期";
				}else{
					String code = CacheKit.get("checkCode", tel);
					if(code.equals(checkCode)){
						//CacheKit.removeAll("checkCode");
						CacheKit.remove("checkCode", tel);
						text="ok";
					}else{
						text ="验证码输入错误";
					}
				}
			} catch (NullPointerException e) {
				text = "验证码不存在";
			}
			
		}
		renderText(text);
	}

    public String SendEmailValidateCode(String codefirst,String email){
        String msg = "";
        String code  =codefirst+"为您的优蚁验证码，请在10分钟内完成操作，如非本人操作，请忽略。";
        //把手机号和验证码放入到缓存中
        CacheKit.put("checkCode", email, codefirst);
        //放入当前时间
        CacheKit.put("checkCode", "time"+email, new Date().getTime());
        ValiCode.sendMsgByEmail(email,code);
        return "验证码已发送至您的邮箱,请查收";
    }

	/**
	 * 随机生成验证码
	 * @return
	 */
	public String getCheck(){
		 String[] beforeShuffle = new String[] {"0","1", "2", "3", "4", "5", "6", "7","8", "9" };  
		 List list = Arrays.asList(beforeShuffle);  
	     Collections.shuffle(list);  
	     StringBuilder sb = new StringBuilder();  
	     for (int i = 0; i < list.size(); i++) {  
	         sb.append(list.get(i));    
	     }  
	     String afterShuffle = sb.toString();  
	     String result = afterShuffle.substring(5, 9);  
	     return result ;		     
	}
}
