package com.qdum.llhb.modifyPwd.controller;

import java.util.Date;

import org.apache.shiro.authz.annotation.RequiresUser;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.qdum.llhb.common.utils.SystemServiceUtil;
import com.qdum.llhb.sys.controller.BaseController;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

@ControllerBind(controllerKey="/pwdManage")
public class modifyPwdController extends BaseController {
	
	/**
	 * 密码管理
	 * @author zhaoyl
	 * @time 2015年10月10日11:04:37
	 */
	public void modify(){
		User user = UserUtils.getUser();
		setAttr("user",user);
		String pwd = user.getPassword();
		if(null == pwd || pwd.equals("")){
			render("setPwd.jsp");
		}else{
			render("modifyPwd.jsp");
		}
	}
	
	/**
	 *验证输入密码与原密码是否相同 
	 */
	@RequiresUser
	public void checkPwd(){
        String password = getPara("Password");
        User user = UserUtils.getUser();
        User users = User.dao.findById(user.getId());
        boolean passWord = SystemServiceUtil.validatePassword(password, users.getPassword());
        
        if (!passWord) {
            renderJson("false");
        } else {
            modifyPassword();
        }
	}
	
	/**
	 * 修改密码
	 */
	@RequiresUser
	public void modifyPassword(){
	  	User Users = UserUtils.getUser();
        User loginuser = getModel(User.class,"user");
        String newPassword = getPara("newPassword");
        loginuser.setPassword(SystemServiceUtil.entryptPassword(newPassword));
        loginuser.setUpdateBy(Users.getId());
        loginuser.setUpdateDate(new Date());
        boolean b = loginuser.update();
        if(b){
        	renderJson("true");
        }else{
        	renderJson("false");
        }
	}
	
}
