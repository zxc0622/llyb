package com.qdum.llhb.common.utils;

import com.qdum.llhb.forum.model.ForumPost;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;

/**
 * 数据库相关工具类
 * Created by rongchao on 2016/1/6.
 */
public class DbUtil {

    public static String getSql(Class<?> clazz, String sqlID) {
        try {
            SAXReader reader = new SAXReader();
            StringBuffer sb = new StringBuffer();
            sb.append("/")
                    .append(clazz.getPackage().getName().replace(".", "/"))
                    .append("/xml")
                    .append("/")
                    .append(clazz.getSimpleName())
                    .append(".xml");
            Document sqlDom = reader.read(clazz.getResourceAsStream(sb.toString()));
            return sqlDom.getRootElement().elementByID(sqlID).getText();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return null;
    }
}
