package com.qdum.llhb.ueditor.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baidu.ueditor.ActionEnter;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.weixin.kit.PropKit;
import com.qdum.llhb.common.utils.WaterMarkUtils;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

/**
 * Created by yaoyt on 16/8/11.
 *
 * @author yaoyt
 */
public class UeditorFileUploadController extends Controller {
    public static final String[] imageFormats = {".png", ".jpg", ".bmp", ".jpeg"};
    //private   String WATERMARKIMAGEURL = PathKit.getWebRootPath()

    @ActionKey("/ueditorFileUpload")
    public void UeditorFileUpload() throws Exception {
        HttpServletRequest request = getRequest();
        HttpServletResponse response = getResponse();

        request.setCharacterEncoding("utf-8");
        response.setHeader("Content-Type", "text/html");

        String rootPath = getSession().getServletContext().getRealPath("/");

        String myRootPath = rootPath;
        myRootPath = PropKit.get("uploadDir");
        String result = new ActionEnter(request, myRootPath, rootPath).exec();

        //System.out.println("result:"+result);

        //给图片加上水印
        JSONObject object = JSON.parseObject(result);
        String imageName = object.getString("url");
        //当不是第一次打开ueditor
        if (!StringUtils.isBlank(imageName)) {
            File target = new File(myRootPath, imageName);
            System.out.println(target.toString());
            String strFex = imageName.substring(imageName.lastIndexOf("."));
            //给图片添加水印
            boolean flag = false;
            for (String imageFormat : imageFormats) {
                if (imageFormat.equalsIgnoreCase(strFex)) {
                    flag = true;
                    break;
                }
            }
            if (flag) {
               // WaterMarkUtils.markImageByIcon(null,target.toString(),target.toString());
            }
        }
        renderText(result);
    }

}
