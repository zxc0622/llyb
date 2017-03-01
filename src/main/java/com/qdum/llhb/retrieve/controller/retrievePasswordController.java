package com.qdum.llhb.retrieve.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.utils.EmailUtils;
import com.qdum.llhb.common.utils.MD5Util;
import com.qdum.llhb.common.utils.SystemServiceUtil;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.common.utils.XmlSqlUtils;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.model.User;
@ControllerBind(controllerKey = "/retrieve")
public class retrievePasswordController extends Controller{
	/**
	 * 通过手机找回密码
	 */
	public void retrievePasswordA_v1(){
		render("RetrievePasswordA.jsp");
	}
	/**
	 * 发送验证码找回密码
	 */
	public void retrievePasswordB(){
		render("RetrievePasswordB.jsp");
	}
	/**
	 * 重置密码页面
	 */
	public void retrievePasswordC(){
		String tel=getPara("tel");
		if(tel!=null&&!(tel.equals(""))){
				setAttr("id",tel);
		}
		render("RetrievePasswordC.jsp");
	}
	/**
	 * 找回成功
	 */
	public void retrievePasswordD(){
		render("RetrievePasswordD.jsp");
	}
	/**
	 * 校验手机号
	 */
	public void telphoneJy(){
		 String tele=getPara("tel");
		 Person person =Person.dao.findtelePhone(tele);
		 String flag="";
		 if(person==null||person.equals("")){
			 flag="1";
		 }else{
			 flag=String.valueOf(person.get("user_id"));
		 }
		 renderText(flag);
	}
	/**
	 * 更新密码
	 */
	public void updatePassword(){
		String newPw=getPara("newPw");
		String id=getPara("id");
		String flag="";
		if(newPw!=null&&!(newPw.equals(""))){
			 User u =new User();
			 u.set("id",id);
			 u.setPassword(SystemServiceUtil.entryptPassword(newPw));
			 u.update();
			 flag="1";
		}else{
			 flag="2";
		}
		renderText(flag);
	}
	/**
	 * one step:跳转邮箱注册页面
	 * @author zwn
	 */
	public void retrieveEmailPasswordB(){
		render("RetrieveEmailPasswordB.jsp");
	}
	/**
	 * one step:查看此邮箱是否注册
	 * @author zwn
	 */
	public void checkEmail(){
		String EmailName = getPara("EmailName");
		Record r = User.dao.selectUserByEmail(EmailName);
		String flag = "";
		if(r!=null){
			flag = "1";
		}else{
			flag = "2";
		}
		renderText(flag);
	}
	/**
	 * two step:跳转到注册步骤二.
	 * @author zwn
	 */
	public void inputEmailpassword(){
		String EmailName = getPara("emailName");
		setAttr("EmailName", EmailName);
		render("RetrieveEmailPasswordC.jsp");
	}
	/**
	 * two step:步骤二发送邮件
	 * @author zwn
	 * @throws Exception 
	 */
	public void sendEmail() throws Exception{
		String emailName = getPara("emailName");
		//发送邮件
	    String toUser = emailName;
        String subject = "优蚁网邮箱密码找回";
        //设置参数值
        Map<String,Object> values = new HashMap<String,Object>();
        HttpServletRequest request = getRequest();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/retrieve/";
        String active = MD5Util.encode2hex(toUser);
        values.put("activateHref",basePath+"RetrieveEmailPasswordE?active="+active+"&email="+emailName);
        //通过freemarker获取配置在xml中的内容
        String html = XmlSqlUtils.getSql("/html/findPassword_html.xml","getActivationHtml",values);
        boolean flag = EmailUtils.send(subject,html,toUser,basePath+"RetrieveEmailPasswordE?active="+active+"&email="+emailName);
        if(flag==true){
        	renderText("ok");
        }else{
    	  	renderText("发送邮件失败");
        }
	}
	/**
	 * two step:步骤二结束时的的页面
	 * @author zwn
	 */
	public void RetrieveEmailPasswordD(){
		render("RetrieveEmailPasswordD.jsp");
	}
	/**
	 * two step:跳转重置邮箱密码页面
	 * @author zwn
	 */
	public void RetrieveEmailPasswordE(){
		String active = getPara("active");
		String email  = getPara("email");
		String realActive = MD5Util.encode2hex(email);
	    if(realActive.equals(active)==true){
	    	render("RetrieveEmailPasswordE.jsp");
	    }else{
	    	render("RetrieveEmailPasswordEfalse.jsp");
	    }
	}
	/**
	 * three step:根据邮箱更新邮箱密码
	 * @author zwn
	 */
	public void updateEmailPassword(){
		String email = getPara("email");
		String password = SystemServiceUtil.entryptPassword(getPara("password"));
        boolean flag = User.dao.updateUserByEmail(password, email);
        if(flag == true){
        	renderText("ok");
        }else{
        	renderText("更新失败");
        }
	}
	/**
	 * three step:更改密码成功跳转的页面
	 * @author zwn
	 */
	public void retrieveEmailPasswordD(){
		render("RetrieveEmailPasswordF.jsp");
	}
	
	//忘记密码v2
	public void retrievePasswordA(){
		render("../v2/sys/forgot.jsp");
	}
	
	//校验验证码
	public void checkTheCode(){
		String checkCode = getPara("checkCode");
        String username = getPara("username");
        String codemsg = ValiCode.jiaoyan(username, checkCode);
        renderText(codemsg);
	}
	
	/**
     * 注册时检测用户是否存在,手机号或者邮箱
     * 2016年12月28日
     * wyp
     */
    public void checkUserIsExit(){
        String telOrMail = getPara("tel");
        Record r = User.dao.findUserByNameOrPhone(telOrMail);
        //如果该账户已被注册,则提示用户
        if (null != r) {
            renderText("ok");
            return;
        }else{
        	Record rr = User.dao.findUserByEmail(telOrMail,1); 
        	if(null != rr){
        		renderText("ok");
        	}else{
        		renderText("该用户不存在！");
        	}
        }
    }
    
    /**
     * 注册时检测用户是否存在,手机号或者邮箱
     * 2016年12月28日
     * wyp
     */
    public void saveNewPwd(){
    	String newPwd = getPara("newPwd");
        String username = getPara("username");
        User user = User.dao.findByUsernameOrPhone(username);
        if(null == user){
        	renderText("用户不存在！");
        }else{
        	user.setPassword(SystemServiceUtil.entryptPassword(newPwd));
        	user.setUpdateBy(user.getId());
        	user.setUpdateDate(new Date(System.currentTimeMillis()));
        	user.update();
        	renderText("ok");
        }
    }
	
}
