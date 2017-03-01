package com.qdum.llhb.qykCustom.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;
import com.qdum.llhb.common.utils.CompressUploadFileUtils;
import com.qdum.llhb.common.utils.UploadFileUtils;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.ChangeUserMsgInterceptor;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.service.ModuleLoad;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

import net.sf.json.JSONObject;

/**
 * 企业库自定义
 */
@ControllerBind(controllerKey = "/Library/libraryCommon")
@Before(CustomControllerInterceptor.class)
public class LibraryCommonController  extends Controller{
	private List<SysCompanyCustom> customMsg;
	private User user;
	private Long companyId;
	
	/**
	 * 验证图片尺寸并上传
	 */
	@Before(ChangeUserMsgInterceptor.class)
	public void verifyUploadImage(){
		long maxLength = 3*1024*1024;//图片大小，单位：B
		int maxWidth = 2000;//图片宽，单位：px
		int maxHeight = 2000;//图片高，单位：px
		UploadFile uf = getFile("files");
		File picture = uf.getFile();
		BufferedImage sourceImg = null;
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(picture); 
			sourceImg = ImageIO.read(fis);
			long picLength = picture.length();//图片大小，单位：B
			int picWidth = sourceImg.getWidth();//图片宽，单位：px
			int picHeight = sourceImg.getHeight();//图片高，单位：px
			
//			System.out.println("图片大小："+String.format("%.1f",picture.length()/1024.0));
//			System.out.println("图片宽："+sourceImg.getWidth());
//			System.out.println("图片高："+sourceImg.getHeight());
			
			if(picLength > maxLength || picWidth > maxWidth || picHeight > maxHeight){
				//图片过大，压缩图片并上传
				CompressUploadFileUtils uploadFileImg	=new CompressUploadFileUtils();
				String fileName =getRequest().getScheme()+"://"+getRequest().getServerName()
						+":"+getRequest().getServerPort()+getRequest().getContextPath()
						+"/hyzl/findImgResourcesURL?str="
						+uploadFileImg.UploadFileMain(getFile("files"),null,maxWidth,maxHeight);				
				renderText("{"+fileName+"}");
			}else{
				//不压缩,直接上传
				UploadFileUtils uploadFileImg	=new UploadFileUtils();
				String fileName =getRequest().getScheme()+"://"+getRequest().getServerName()
						+":"+getRequest().getServerPort()+getRequest().getContextPath()
						+"/hyzl/findImgResourcesURL?str="
						+uploadFileImg.UploadFileMain(getFile("files"),null);				
				renderText("{"+fileName+"}");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				if(fis != null){
					fis.close();
				}
			} catch (IOException e) {
			}
		}
	}
	
	/**
	 * 富文本编辑器图片上传
	 * 与上面的方法的区别是要返回指定json格式
	 * 成功时
	 * {"error" : 0,"url" : "http://www.example.com/path/to/file.ext"}
	 * 失败时
	 * { "error" : 1,"message" : "错误信息"
	 * }
	 */
	public void uploadImageForEditor(){
		long maxLength = 3*1024*1024;//图片大小，单位：B
		int maxWidth = 1000;//图片宽，单位：px
		int maxHeight = 2000;//图片高，单位：px
		UploadFile uf = getFile("imgFile");
		File picture = uf.getFile();
		BufferedImage sourceImg = null;
		FileInputStream fis = null;
		JSONObject json = new JSONObject();
		try {
			fis = new FileInputStream(picture); 
			sourceImg = ImageIO.read(fis);
			long picLength = picture.length();//图片大小，单位：B
			int picWidth = sourceImg.getWidth();//图片宽，单位：px
			int picHeight = sourceImg.getHeight();//图片高，单位：px
			String fileName=null;
			
			if(picLength > maxLength || picWidth > maxWidth || picHeight > maxHeight){
				//图片过大，压缩图片并上传
				CompressUploadFileUtils uploadFileImg	=new CompressUploadFileUtils();
				fileName =getRequest().getScheme()+"://"+getRequest().getServerName()
						+":"+getRequest().getServerPort()+getRequest().getContextPath()
						+"/hyzl/findImgResourcesURL?str="
						+uploadFileImg.UploadFileMain(getFile("imgFile"),null,maxWidth,maxHeight);				
			}else{
				//不压缩,直接上传
				UploadFileUtils uploadFileImg	=new UploadFileUtils();
				fileName =getRequest().getScheme()+"://"+getRequest().getServerName()
						+":"+getRequest().getServerPort()+getRequest().getContextPath()
						+"/hyzl/findImgResourcesURL?str="
						+uploadFileImg.UploadFileMain(getFile("imgFile"),null);				

			}
			json.put("error", 0);
			json.put("url", fileName);
		} catch (IOException e) {
			json.put("error", 1);
			json.put("message", "图片上传失败");
			e.printStackTrace();
		}finally{
			try {
				if(fis != null){
					fis.close();
				}
			} catch (IOException e) {
			}
		}
		renderJson(json);
	}
	
	
	/**
	 * 收藏产品、案例等
	 * @param type 收藏的类型，1-供应，2-求购，3-竞品，4-环保商城,5-案例
	 * @param collectId 被收藏的id
	 */
	@Before(ChangeUserMsgInterceptor.class)
	public void collectBusiness(){
		user = UserUtils.getUser();
		long userId = user.getId();
		
		String type = getPara("type");
		String collectId = getPara("collectId");
		
		String eSql = "SELECT * FROM ms_business_collect WHERE type=? AND collect_id=? AND create_by=? AND del_flag=0";
		List<Record> rList = Db.find(eSql,type,collectId,userId);
		if(rList.size() > 0){
			renderText("ok");
			return;
		}
		
		String sql = "INSERT INTO ms_business_collect (type,collect_id,create_by,create_date)VALUES(?,?,?,NOW())";
		int result = Db.update(sql,type,collectId,userId);
		if(result > 0){
			renderText("ok");
		}else{
			renderText("fail");
		}
	}
	
	/**
	 * 应用企业库新模板
	 */
	public void applyNewTemplate(){
		user = UserUtils.getUser();
		long userId = user.getId();
		Integer companyId = null;
		Record companyRec = Db.findFirst("SELECT * FROM sys_company WHERE user_id=? AND del_flag=0",userId);
		if(companyRec == null){
			renderText("没有查询到企业信息，如有疑问请联系客服！");
			return;
		}
		companyId=companyRec.getInt("id");
		//查询是否是付费会员
		Record rec = Db.findFirst("SELECT payInfo FROM sys_company WHERE id=? AND del_flag=0",companyId);
		int payInfo = 0;
		if(rec != null){
			payInfo = rec.getInt("payInfo");
		}
		//System.out.println("=========userId:"+userId+"============companyId:"+companyId+"===========payInfo:"+payInfo+"===============");
		if(payInfo == 1){
			//查询模板应用信息
			Record sbRec = Db.findFirst("SELECT * FROM cs_settings_basic WHERE user_id=? AND del_flag=0",userId);
			if(sbRec == null){
				renderText("没有查询到店铺信息，如有疑问请联系客服！");
				return;
			}
			
			Long templateId = sbRec.get("template_id");
			//已经应用了新模板的情况
			if(templateId != null && templateId == 2){
				renderText("ok");
				return;
			}
			
			int temInit = sbRec.getInt("tem_init");//是否初始化的标志
			//查询模板是否初始化了
			List<Record> customInfo = Db.find("SELECT * FROM sys_company_custom WHERE company_id=? AND del_flag=0",companyId);
			//已初始化了新模板修改应用模板id
			if(temInit == 1){
				if(customInfo.size() > 0){
					Db.update("UPDATE cs_settings_basic SET template_id=2 WHERE id=?",sbRec.getLong("id"));
					renderText("ok");
					return;
				}
			}else{
				if(customInfo.size() > 0){
					//新模板初始化记录修改为1
					Db.update("UPDATE cs_settings_basic SET tem_init=1 WHERE id=?",sbRec.getLong("id"));
					//启用模板ID修改为2
					Db.update("UPDATE cs_settings_basic SET template_id=2 WHERE id=?",sbRec.getLong("id"));
					
					renderText("ok");
					return;
				}
			}
			
			//初次使用新模板
			//初始化首页各个模块
			//导航栏默认颜色
			String common2 = "{'navigationColor':'rgb(255, 255, 255)','activeItemColor':'rgb(0, 255, 86)','negativeWordColor':'rgb(0, 0, 129)'}";
			//企业简介默认名称
			String common4 = "{'title':'企业简介','wordcolor':'rgb(255, 0, 0)'}";
			String common = null;
			int moduleType;
			for(int i=1;i<=11;i++){
				if(i == 2){
					common = common2;
				}else if(i == 4){
					common = common4;
				}else{
					common = null;
				}
				
				if(i == 6){
					moduleType = 7;
				}else if(i == 7){
					moduleType = 6;
				}else{
					moduleType = i;
				}
				Db.update("INSERT INTO sys_company_custom ( company_id, module_type, show_flag, seq, common, update_date, del_flag ) VALUES ( ?, ?, 1, ?, ?, NOW(), 0)",companyId,moduleType,i,common);
				
			}
			
			//查询导航栏对应的customId
			Record naviRec = Db.findFirst("SELECT * FROM sys_company_custom WHERE company_id=? AND module_type=2 AND del_flag=0",companyId);
			int customId =  naviRec.getInt("id");
			//初始化导航栏
			String item = "";
			for(int i=1;i<=8;i++){
				if(i == 1){
					item = "首页";
				}
				if(i == 2){
					item = "企业简介";
				}
				if(i == 3){
					item = "服务案例";
				}
				if(i == 4){
					item = "产品展示";
				}
				if(i == 5){
					item = "资质展示";
				}
				if(i == 6){
					item = "团队实力";
				}
				if(i == 7){
					item = "售后保障";
				}
				if(i == 8){
					item = "联系我们";
				}
				Db.update("INSERT INTO sys_company_custom_navigation ( custom_id, item_id, item, seq, update_date, show_flag, del_flag ) VALUES (?, ?, ?, ?, NOW(), 1, 0)",customId,i,item,i);
				
			}
			
			//新模板初始化记录修改为1
			Db.update("UPDATE cs_settings_basic SET tem_init=1 WHERE id=?",sbRec.getLong("id"));
			//启用模板ID修改为2
			Db.update("UPDATE cs_settings_basic SET template_id=2 WHERE id=?",sbRec.getLong("id"));
			
			renderText("ok");
		}else{
			renderText("此模板付费会员可用，请联系客服咨询相关信息！");
		}
		
	}
	
}
