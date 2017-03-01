package com.qdum.llhb.common.utils;

import com.qdum.llhb.sys.model.EmailRecord;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Date;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *类PhoneUtils的功能描述:手机号校验规则
 *@author yaoyt
 *@time 16/3/23 下午2:07
 */ 
public class PhoneUtils {

    public static boolean isPhoneNum(String phone){
        Pattern p = null;
        Matcher m = null;
        boolean b = false;
        p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$"); // 验证手机号
        m = p.matcher(phone);
        b = m.matches();
        return b;
    }
}
