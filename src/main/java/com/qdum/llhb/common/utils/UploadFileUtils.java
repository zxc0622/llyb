package com.qdum.llhb.common.utils;

import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.upload.UploadFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 上传工具类
 *
 * @author wcl
 */
public class UploadFileUtils {
    public static final String[] imageFormats = {".png", ".jpg", ".bmp", ".jpeg", ".gif"};

    public String UploadFileMain(UploadFile files, String userId) {

        String contextPath = "";
        String DirPath = new SimpleDateFormat("yyyyMMdd").format(new Date());
        if (userId == null || "".equals(userId) || "undefined".equals(userId)) {
            contextPath = PropKit.get("uploadDir") + DirPath;
        } else {
            contextPath = PropKit.get("uploadDir") + userId;
        }
        File filePath = new File(contextPath);
        if (!filePath.exists()) {
            filePath.mkdirs();
        }
        FileOutputStream fos = null;
        FileInputStream fis = null;
        String fileName = "";
        try {
            File source = files.getFile();
            fis = new FileInputStream(source);
            String strFex = files.getFileName();
            //by rongchao 从最后一个“.”开始截取，解决中文图片会有多个"."的问题
            strFex = strFex.substring(strFex.lastIndexOf("."));
            fileName = new Date().getTime() + strFex;
            File target = new File(filePath, fileName);
            if (!target.exists()) {
                target.createNewFile();
            }
            fos = new FileOutputStream(target);
            byte[] bts = new byte[1024];
            while (fis.read(bts) != -1) {
                fos.write(bts, 0, bts.length);
            }

            //给图片添加水印
            boolean flag = false;
            for (String imageFormat : imageFormats) {
                if (imageFormat.equalsIgnoreCase(strFex)) {
                    flag = true;
                    break;
                }
            }
            if (flag){
                //WaterMarkUtils.markImageByIcon(null,target.toString(),target.toString());
            }
            // ajax 返回数据
            // Map<String, Object> values = new HashMap<String, Object>();
            // values.put("filePath", filePath+fileName);
        } catch (Exception e) {
        } finally {
            try {
                if (fos != null) {
                    fos.flush();
                    fos.close();
                }
                if (fis != null) {
                    fis.close();
                }
            } catch (Exception e2) {
                return "";
            }

        }
        String filePaths = "";
        if (userId == null || "".equals(userId) || "undefined".equals(userId)) {
            return DirPath + "/" + fileName;
        } else {
            filePaths = userId;
        }
        return filePaths + "/" + fileName;
    }
}
