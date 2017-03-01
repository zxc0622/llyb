package com.qdum.llhb.common.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.coobird.thumbnailator.Thumbnails;

import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.upload.UploadFile;

/**
 * 压缩图片上传工具类
 * 
 * @author wyp
 *
 */
public class CompressUploadFileUtils {

	public String UploadFileMain(UploadFile files, String userId, int width, int height) {
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
		String fileName = "";
		try {
			File source = files.getFile();
			String strFex = files.getFileName();
			//从最后一个“.”开始截取，解决中文图片会有多个"."的问题
			strFex = strFex.substring(strFex.lastIndexOf("."));
			fileName = new Date().getTime() + strFex;
			File target = new File(filePath, fileName);
			if (!target.exists()) {
				target.createNewFile();
			}
			fos = new FileOutputStream(target);
			Thumbnails.of(source).size(width, height).toOutputStream(fos);  
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
