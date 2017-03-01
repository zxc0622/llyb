package com.qdum.llhb.qykCustom.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
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
import com.qdum.llhb.qykCustom.ChangeUserMsgInterceptor;
import com.qdum.llhb.qykCustom.CustomControllerInterceptor;
import com.qdum.llhb.qykCustom.EnterpriseTemplateInterceptor;
import com.qdum.llhb.qykCustom.model.SysCompanyCustom;
import com.qdum.llhb.qykCustom.service.ModuleLoad;
import com.qdum.llhb.qykCustom.service.ServiceCaseService;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

/**
 * 企业库自定义
 */
@ControllerBind(controllerKey = "/Library/enterpriseCustom")
@Before(CustomControllerInterceptor.class)
public class EnterpriseCustomController  extends Controller{
	private List<SysCompanyCustom> customMsg;
	private User user;
	private Long companyId;

	/**
	 * 加载企业库企业自定义页面
	 */
	@Before(EnterpriseTemplateInterceptor.class)
	public void index(){
		companyId=getAttr("companyId");
		setAttr("companyId", companyId);
		Integer [] moduleTypeArray = null;
		moduleTypeArray = SysCompanyCustom.dao.getModuleTypeArray(companyId.intValue());
		setAttr("moduleTypes",Arrays.asList(moduleTypeArray));
		ModuleLoad moduleInit = new ModuleLoad(this);
		moduleInit.load(moduleTypeArray);
		
		//查询seo信息
		Record seoRec = Db.findFirst("SELECT s.seo_setting,s.key_words,c.company_name"
				+ " FROM cs_settings_basic s LEFT JOIN sys_company c"
				+ " ON c.user_id=s.user_id WHERE s.user_id=?"
				+ " AND s.del_flag=0",UserUtils.getUser().getId());
		setAttr("seo", seoRec);
		
		render("library.jsp");
	}
	
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
	 * 更改模块是否显示
	 */
	@Before(ChangeUserMsgInterceptor.class)
	public void updateModuleShow(){
		String moduleType = getPara("moduleID");
		String showFlag = getPara("showFlag");
		companyId=getAttr("companyId");
		
		boolean flag = SysCompanyCustom.dao.updateShowFlag(companyId, Integer.parseInt(moduleType),
				Integer.parseInt(showFlag));
		if(flag){
			renderText("ok");
		}else{
			renderText("fail");
		}
	}
	

	//更新模块顺序
	@Before(ChangeUserMsgInterceptor.class)
	public void updateModuleSeq(){
		String mseq = getPara("moduleSeq");
		String[] mseqArr = mseq.split(",");
		String[] defaultSeq = {"8","9","10"};
		
		user=UserUtils.getUser();
		companyId=user.getLong("companyId");
		
		int length = mseqArr.length;
		String sql = "";
		for(int i=0;i<length;i++){
			sql = "UPDATE sys_company_custom SET seq="+defaultSeq[i]+" WHERE company_id=? AND module_type="+mseqArr[i]+" AND del_flag=0";
			Db.update(sql,companyId);
		}
		renderText("ok");
		
	}

	/**
	 * 设置模块显示
	 */
	@Before(ChangeUserMsgInterceptor.class)
	public void setModuleShow(){
		String moduleIds = getPara("moduleIds");
		moduleIds=moduleIds.replace("type", "");
		moduleIds=moduleIds.substring(0, moduleIds.length()-1);
		int result=Db.update("update sys_company_custom set show_flag=1 where id in ("+moduleIds+")");
		if(result>0){
			renderJson("true");
		}
	}
	
	/**
	 * 获取隐藏模块
	 */
	@Before(ChangeUserMsgInterceptor.class)
	public void getHideModules(){
		user=UserUtils.getUser();
		companyId=user.getLong("companyId");
		customMsg = SysCompanyCustom.dao.getCustomMsg(companyId.intValue());
		List<Record> hideModules = SysCompanyCustom.dao.hideModules(companyId.intValue());
		renderJson(hideModules);
	}
	
	@Before(ChangeUserMsgInterceptor.class)
	public void saveLogo(){
		String logoUrl = getPara("logoUrl");
		user=UserUtils.getUser();
		companyId=user.getLong("companyId");
		String sql = "UPDATE sys_company SET logo_img=? WHERE id=? AND del_flag=0";
		int result = Db.update(sql,logoUrl,companyId);
		if(result>0){
			renderText("ok");
		}else{
			renderText("fail");
		}
	}
	
	
}
