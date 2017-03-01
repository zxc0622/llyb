package com.qdum.llhb.common.utils;

import com.qdum.llhb.sys.model.EmailRecord;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

/**
 *类EmailUtils的功能描述:邮件发送相关类
 *@author yaoyt
 *@time 16/3/22 下午4:52
 */
public class EmailUtils {

    private static String host = "smtp.rushmail.com"; // smtp服务器
    private static String user = "mail@service.yyhb365.com"; // 用户名
    private static String pwd = "Rushmail123"; // 密码
    private static String from = "mail@service.yyhb365.com"; // 发件人地址

    public static boolean send(String subject,String content,String toUser,String msg){
        Properties props = new Properties();
        // 设置发送邮件的邮件服务器的属性（这里使用网易的smtp服务器）
        props.put("mail.smtp.host", host);
        // 需要经过授权，也就是有户名和密码的校验，这样才能通过验证（一定要有这一条）
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "2525");
        // 用刚刚设置好的props对象构建一个session
        Session session = Session.getDefaultInstance(props);
        // 有了这句便可以在发送邮件的过程中在console处显示过程信息，供调试使
        // 用（你可以在控制台（console)上看到发送邮件的过程）
        session.setDebug(false);
        // 用session为参数定义消息对象
        MimeMessage message = new MimeMessage(session);
        try {
            // 加载发件人地址
           //  message.setFrom(new InternetAddress(from));
        	String nick="";  
	        try {  
	            nick=javax.mail.internet.MimeUtility.encodeText("优蚁环保网");  
	        } catch (UnsupportedEncodingException e) {  
	            e.printStackTrace();  
	        }   
	        message.setFrom(new InternetAddress(nick+" <"+from+">"));  
            // 加载收件人地址
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toUser));
            // 加载标题
            message.setSubject(subject);
            // 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
            Multipart multipart = new MimeMultipart();

            // 设置邮件的文本内容
            BodyPart contentPart = new MimeBodyPart();
            contentPart.setContent(content,"text/html;charset=UTF-8");
            multipart.addBodyPart(contentPart);

            // 添加附件
            //BodyPart messageBodyPart = new MimeBodyPart();
            //DataSource source = new FileDataSource(affix);
            // 添加附件的内容
            //messageBodyPart.setDataHandler(new DataHandler(source));
            // 添加附件的标题
            // 这里很重要，通过下面的Base64编码的转换可以保证你的中文附件标题名在发送时不会变成乱码
            //sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
            //messageBodyPart.setFileName("=?GBK?B?"+ enc.encode(affixName.getBytes()) + "?=");
            //multipart.addBodyPart(messageBodyPart);

            // 将multipart对象放到message中
            message.setContent(multipart);
            // 保存邮件
            message.saveChanges();
            // 发送邮件
            Transport transport = session.getTransport("smtp");
            // 连接服务器的邮箱
            transport.connect(host, user, pwd);
            // 把邮件发送出去
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            //将邮件发送记录保存到数据库中
            EmailRecord er =new EmailRecord();
            er.setToUser(toUser);
            er.setSubject(subject);
            er.setContent(msg);
            er.setSendTime(new Date());
            er.save();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
