package com.qdum.llhb.common.utils;

import com.qdum.llhb.sys.model.EmailRecord;
import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.StringWriter;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

/**
 *类XmlSqlUtils的功能描述:使用freemarker动态获取sql
 *@author yaoyt
 *@time 16/3/23 上午10:35
 */
public class XmlSqlUtils {

    public static String getSql(String filePath,String queryId,Map<String,Object> values) throws Exception {
        SAXReader reader = new SAXReader();
        Document sqlDom = reader.read(Thread.currentThread().getContextClassLoader().getResourceAsStream(filePath));
        String sql = sqlDom.getRootElement().elementByID(queryId).getText();
        Configuration cfg = new Configuration();
        StringTemplateLoader Stringtl = new StringTemplateLoader();
        Stringtl.putTemplate(queryId, sql);
        cfg.setTemplateLoader(Stringtl);
        Template temp = cfg.getTemplate(queryId);
        StringWriter queryStringWriter = new StringWriter();
        temp.process(values, queryStringWriter);
        return queryStringWriter.toString();
    }

}
