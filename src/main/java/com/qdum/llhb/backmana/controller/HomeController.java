package com.qdum.llhb.backmana.controller;

import java.io.File;
import java.util.List;

import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.weixin.kit.PropKit;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.UploadFileUtils;
import com.qdum.llhb.memService.model.ChatRecord;
import com.qdum.llhb.memService.model.Message;
import com.qdum.llhb.sys.model.Menu;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
/**
 * 后台管理
 */
public class HomeController extends Controller{
	   @ActionKey("/home")
	    public void homePage() {
	        String str = getPara("str");
	        if(str == null || str.length() <= 0){
	        	str = "/userhomepage/index";
	        }
	        User user = UserUtils.getUser();
	  		long chatNotRead = ChatRecord.dao.getNotReadCount(-1,user.getId());
	  		long messNotRead = Message.dao.getNotRead(user.getId());
			setAttr("chatNotRead",chatNotRead);//未读对话
			setAttr("messNotRead",messNotRead);//未读消息
	        setAttr("str",str);
	        SavedRequest sr = WebUtils.getSavedRequest(getRequest());
	        if(null != sr){
	        	String url = sr.getRequestUrl();
	        	redirect(url);
	        }else{
	        	 render("home.jsp");
	        }
	    }
	  	@ActionKey("/goLeft")
	  	public void goLeft(){
	  		User user = UserUtils.getUser();
	  		Record u = User.dao.getIndexInfo(user.getId());
	  		if(u !=null){
	  			setAttr("u", u);
	  		}
	  		List<Record> menus = Menu.dao.findHomeMenuByUserId(user.getId());
	  		if(menus != null){
	  			setAttr("menus", menus);
	  		}
	  		setAttr("str",getPara("str"));
	  		render("left.jsp");
	  	}
		/**
		 * WangCL</br> 2015年10月12日 10:46:36</br> 上传图片</br>
		 */
		@ActionKey("/fileUploadServer")
		public void fileUploadServer() {
			UploadFileUtils uploadFileImg	=new  UploadFileUtils();
			String fileName =getRequest().getScheme()+"://"+getRequest().getServerName()+":"+getRequest().getServerPort()+getRequest().getContextPath()+"/hyzl/findImgResourcesURL?str="+uploadFileImg.UploadFileMain(getFile("files"),null);
			// by rongchao 将renderJson(fileName)修改为renderText(fileName)
			// 解决ie浏览器上传图片时弹出保存窗口
			renderText(fileName);
		}

		/**
		 * WCL</br>
		 * 二〇一五年十月十二日 15:17:45</br>
		 * 添加</br>
		 * 获取图片资源</br>
		 */
		@ActionKey("/findImgResourcesURL")
		public void findImgResourcesURL(){
			String url=PropKit.get("uploadDir")+this.getPara("str");
            if(PropKit.get("virtualMode").equals(false)){
                this.renderFile(new File(url));
            }else{
                this.redirect("/virtualPic/" + PropKit.get("uploadDir")+this.getPara("str"));
            }
		}
		
		/**
		 * 带参数的上传
		 */
		@ActionKey("/fileUploadServerById")
		public void fileUploadServerById() {
			User user = UserUtils.getUser();
			UploadFileUtils uploadFileImg	=new  UploadFileUtils();
			String fileName =getRequest().getScheme()+"://"
			+getRequest().getServerName()+":"
					+getRequest().getServerPort()
					+getRequest().getContextPath()
					+"/hyzl/findImgResourcesURL?str="
					+uploadFileImg.UploadFileMain(getFile("attachment"),user.getId().toString());	
			renderText(fileName);
		}
}
