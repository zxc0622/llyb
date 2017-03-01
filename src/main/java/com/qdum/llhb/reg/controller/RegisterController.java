package com.qdum.llhb.reg.controller;

 
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.jfinal.core.Controller;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.qdum.llhb.common.security.shiro.UsernamePasswordToken;
import com.qdum.llhb.common.utils.EmailUtils;
import com.qdum.llhb.common.utils.MD5Util;
import com.qdum.llhb.common.utils.SystemServiceUtil;
import com.qdum.llhb.common.utils.ValiCode;
import com.qdum.llhb.common.utils.XmlSqlUtils;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.reg.model.UserRole;
import com.qdum.llhb.salesmancode.model.SalesmanCode;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.model.Role;
import com.qdum.llhb.sys.model.SettingBasic;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;


/**
 * 用户注册
 *
 * @author wf
 */

@ControllerBind(controllerKey = "/reg")
public class RegisterController extends Controller {

    private static final Logger LOGGER = Logger.getLogger(RegisterController.class);

    public void index_v1() {
        String serviceCode = getPara("serviceCode");
        String salesmanCode = getPara("salesmanCode");
        if(null != serviceCode && !serviceCode.equals("")){
            salesmanCode = serviceCode;
        }
        createToken("userToken", 30 * 60); //过期时间设置为30分钟
        if (null != salesmanCode && !salesmanCode.equals("")) {
            setAttr("salesmanCode", salesmanCode);
            render("regPhone.jsp");
        } else {
            render("register.jsp");
        }

    }
    
    public void index() {
    	render("../v2/sys/register.jsp");
    }

    /**
     * 检验用户是否存在并保存
     */

    public void checkExists() {
        boolean token = validateToken("userToken");
        boolean f = false;
        User user = UserUtils.getUser();
        String userto = getPara("userto");
        String username = getPara("username");
        String password = getPara("password");
        String telephone = getPara("telephone");
        String checkCode = getPara("checkCode");
        String leixing = getPara("leixing");
        Record rec = Db.findFirst("SELECT * FROM sys_person p WHERE p.phone=?", telephone);
        if (rec != null) {
            renderText("该手机号已经被注册过");
            return;
        }
        //将tx_开头的用户名保留出来,预留给腾讯对接过来的用户,不允许使用tx_开头的用户名注册
        if (username.indexOf("tx_") == 0) {
            renderText("该用户名已经存在");
            return;
        }
        String salesmanCode = getPara("salesmanCode");
        if (null != salesmanCode && !salesmanCode.equals("")) {
            Record r = SalesmanCode.dao.getSalesCodeByCode(salesmanCode);
            if (null == r) {
                renderText("该编码不存在");
                return;
            } else {
                f = true;
            }
        }
        String codemsg = ValiCode.jiaoyan(telephone, checkCode);
        if (!codemsg.equals("ok")) {
            renderText(codemsg);
            return;
        }

        User u = User.dao.findByUsername(username);
        if (u == null) {
            if (token == true) {
                u = new User();
                /* u.set("login_name",username);
                 u.set("password",hash.toString());
				 u.set("create_by", user.get("id"));
				 u.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));*/
                u.setLoginName(username);
                u.setPassword(SystemServiceUtil.entryptPassword(password));
                u.set("create_by", 0);
                u.setCreateDate(new Date());
                u.set("del_flag", false);
                if (f) {
                    u.set("operator_code", salesmanCode);
                }
                u.save();
                /**
                 * 用户角色插入
                 */
                UserRole ur = new UserRole();

                SettingBasic sb = SettingBasic.dao.findById(u.getId());
                if (sb == null) {
                    sb = new SettingBasic();
                    sb.set("user_id", u.get("id"));
                    sb.set("create_by", u.getId());
                    sb.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                    sb.set("del_flag", false);
                    sb.save();
                }
                if (leixing.equals("person")) {
                    //个人保存
                    // Person person = Person.dao.findXinxi((Long) u.get("id"));
                    Person person = Person.dao.findXinxi(u.getId());
                    if (person == null) {
                        person = new Person();
                        person.set("user_id", u.get("id"));
                        person.set("phone", telephone);
                        person.set("create_by", 0);
                        person.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                        person.set("del_flag", false);
                        person.save();
                    }
                    Company comp = Company.dao.findXinxi(u.getId());
                    if (comp == null) {
                        comp = new Company();
                        comp.set("user_id", u.get("id"));
                        comp.set("create_by", 0);
                        comp.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                        comp.set("del_flag", false);
                        comp.save();
                    }

                    ur.set("user_id", u.get("id"));
                    String rolename = Dict.dao.getNameByValue(1, "user_type").get("label");
                    if (null != salesmanCode && !salesmanCode.equals("")) {
                        ur.set("role_id", 19);
                    } else {
                        ur.set("role_id", Role.dao.findRoleByName(rolename).getId());
                    }
                    ur.save();
                    saveType(username, "1");
                } else {
                    //公司保存
                    String compName = getPara("compName");
                    String lianxiName = getPara("lianxiName");
                    String email = getPara("email");
                    u.set("email", email);
                    u.update();
                    Company comp = Company.dao.findXinxi(u.getId());
                    if (comp == null) {
                        /* comp.setContact(lianxiName);
                         comp.setCompanyName(compName);
						 comp.setEmail(email);
						 comp.setPhone(telephone);
						 comp.setCreateBy(user.getId());
						 comp.setCreateDate(new Date());*/
                        comp = new Company();
                        comp.set("user_id", u.get("id"));
                        comp.set("company_name", compName);
                        comp.set("contact", lianxiName);
                        comp.set("email", email);
                        comp.set("create_by", 0);
                        comp.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                        comp.set("del_flag", false);
                        comp.save();

                    }
                    ur.set("user_id", u.get("id"));
                    String rolename = Dict.dao.getNameByValue(3, "user_type").get("label");
                    if (null != salesmanCode && !salesmanCode.equals("")) {
                        ur.set("role_id", 19);
                    } else {
                        ur.set("role_id", Role.dao.findRoleByName(rolename).getId());
                    }

                    ur.save();
                    Person person = Person.dao.findXinxi(u.getId());
                    if (person == null) {
                        person = new Person();
                        
                        person.set("user_id", u.get("id"));
                        person.set("create_by", 0);
                        person.set("phone", telephone);
                        person.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                        person.set("del_flag", false);
                        person.save();
                    }
                    
                }
                if (null != salesmanCode && !salesmanCode.equals("")) {
                    Subject subject = SecurityUtils.getSubject();
                    UsernamePasswordToken usertoken = new UsernamePasswordToken(username, password.toCharArray(), false, null, null, null);
                    subject.login(usertoken);
                    renderText("weifei");
                    return;
                    
                } else {
                    renderText("ok");
                }
                
            } else {
                renderText("上次已保存，请不要重复提交");
            }
        } else {
            renderText("该用户名已经存在");
        }
    }

    private void saveType(String username, String leibie) {
        int flag = 0;
        if (Integer.parseInt(leibie) > 2) {
            flag = 1;
        }
        /* if(leibie.equals("普通个人")){
             leibie = "个人";
		 }else if(leibie.equals("环保工程师")){
			 leibie = "工程师";
		 }else if(leibie.equals("产生废物")){
			 leibie = "产废企业";
			 flag = 1;
		 }else if(leibie.equals("处置废物")){
			 leibie = "处置企业";
			 flag = 1;
		 }else if(leibie.equals("环保服务")){
			 leibie = "环保企业";
			 flag = 1;
		 }else {
			 leibie = "其他";
			 flag = 1;
		 }*/
        User u = User.dao.findByUsername(username);
        UserRole ur = null;

        if (flag == 0) {
            //个人
            String rolename1 = Dict.dao.getNameByValue(1, "user_type").get("label");
            ur = UserRole.dao.getByIds(Role.dao.findRoleByName(rolename1).getId(), u.getLong("id"));
            if (ur != null) {
                Role.dao.outUserInRole(u.getLong("id"), Role.dao.findRoleByName(rolename1).getId());
            }
            ur = new UserRole();
            ur.set("user_id", u.get("id"));
            ur.set("role_id", Role.dao.findRoleByName(Dict.dao.getNameByValue(leibie, "user_type").getStr("label")).getId());
            ur.save();
        } else {
            //企业
            String rolename = Dict.dao.getNameByValue(3, "user_type").get("label");
            ur = UserRole.dao.getByIds(Role.dao.findRoleByName(rolename).getId(), u.getLong("id"));
            if (ur != null) {
                Role.dao.outUserInRole(u.getLong("id"), Role.dao.findRoleByName(rolename).getId());
            }
            ur = new UserRole();
            ur.set("user_id", u.get("id"));
            ur.set("role_id", Role.dao.findRoleByName(Dict.dao.getNameByValue(leibie, "user_type").getStr("label")).getId());
            ur.save();
        }
        //int type = Integer.parseInt(Dict.dao.getIdByName(leibie,"user_type").getValue());
        Company comp = Company.dao.findXinxi(u.getId());
        if (flag == 0) {
            u.set("type", leibie);
            comp.set("type", null);
        } else {
            comp.set("type", leibie);
            u.set("type", 1);
        }
        u.update();
        comp.update();
    }

    
    /**
     * 保存类别
     *//*
    public void saveType() {
        String username = getPara("username");
        String leibie = getPara("leibie");

        int flag = 0;
        if (Integer.parseInt(leibie) > 2) {
            flag = 1;
        }
        *//* if(leibie.equals("普通个人")){
             leibie = "个人";
		 }else if(leibie.equals("环保工程师")){
			 leibie = "工程师";
		 }else if(leibie.equals("产生废物")){
			 leibie = "产废企业";
			 flag = 1;
		 }else if(leibie.equals("处置废物")){
			 leibie = "处置企业";
			 flag = 1;
		 }else if(leibie.equals("环保服务")){
			 leibie = "环保企业";
			 flag = 1;
		 }else {
			 leibie = "其他";
			 flag = 1;
		 }*//*
        User u = User.dao.findByUsername(username);
        UserRole ur = null;

        if (flag == 0) {
            //个人
            String rolename1 = Dict.dao.getNameByValue(1, "user_type").get("label");
            ur = UserRole.dao.getByIds(Role.dao.findRoleByName(rolename1).getId(), u.getLong("id"));
            if (ur != null) {
                Role.dao.outUserInRole(u.getLong("id"), Role.dao.findRoleByName(rolename1).getId());
            }
            ur = new UserRole();
            ur.set("user_id", u.get("id"));
            ur.set("role_id", Role.dao.findRoleByName(Dict.dao.getNameByValue(leibie, "user_type").getStr("label")).getId());
            ur.save();
        } else {
            //企业
            String rolename = Dict.dao.getNameByValue(3, "user_type").get("label");
            ur = UserRole.dao.getByIds(Role.dao.findRoleByName(rolename).getId(), u.getLong("id"));
            if (ur != null) {
                Role.dao.outUserInRole(u.getLong("id"), Role.dao.findRoleByName(rolename).getId());
            }
            ur = new UserRole();
            ur.set("user_id", u.get("id"));
            ur.set("role_id", Role.dao.findRoleByName(Dict.dao.getNameByValue(leibie, "user_type").getStr("label")).getId());
            ur.save();
        }
        //int type = Integer.parseInt(Dict.dao.getIdByName(leibie,"user_type").getValue());
        Company comp = Company.dao.findXinxi(u.getId());
        if (flag == 0) {
            u.set("type", leibie);
            comp.set("type", null);
        } else {
            comp.set("type", leibie);
            u.set("type", 1);
        }
        u.update();
        comp.update();
        renderText("ok");
    }*/

    /**
     * 校验手机号是否已经注册过
     */
    public void checkTelExists() {
        String msg = "";
        String tel = getPara("tel");
        Record r = Db.findFirst("SELECT * FROM sys_person p WHERE p.phone=?", tel);
        if (r == null) {
            msg = "ok";
        } else {
            msg = "该手机号已经被注册过";
        }
        renderText(msg);
    }

    /**
     * 校验手机号,并且发送短信
     */
    public void checkTelAndSendCode() {
        String msg = "";
        String tel = getPara("tel");
        Record r = User.dao.findUserByNameOrPhone(tel);
        //如果该账户已被注册,则提示用户
        if (null != r) {
            msg = "该账户已被注册!";
            renderText(msg);
        }else{
            renderText("ok");
        }
    }
    
    /**
     * 校验邮件，并且发送邮件
     * @author zwn
     * @throws Exception 
     */
    public void checkEmailAndSendCode() throws Exception{
    	String msg = "";
    	String email = getPara("email");
    	String password = getPara("password");
    	Record r = User.dao.findUserByEmail(email,1); 
    	if(null !=r){
    		msg="该邮箱已被注册";
    		renderText(msg);
    	}else{
    		//发送邮件
		    String toUser = email;
	        String subject = "优蚁网激活邮件";
	        //设置参数值
	        Map<String,Object> values = new HashMap<String,Object>();
	        HttpServletRequest request = getRequest();
	        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/reg/";
	        String validateCode = MD5Util.encode2hex(toUser);
	        values.put("activateHref",basePath+"activateUserAccount?validateCode="+validateCode+"&email="+email);
	        //通过freemarker获取配置在xml中的内容
	        String html = XmlSqlUtils.getSql("/html/activation_html.xml","getActivationHtml",values);
	        EmailUtils.send(subject,html,toUser,basePath+"activateUserAccount?validateCode="+validateCode+"&email="+email);
	        
	        r = User.dao.findUserByEmail(email, 0);
	        User u = new User();
	        if(null!=r){
		        password = SystemServiceUtil.entryptPassword(password);
		        String create_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		        validateCode = MD5Util.encode2hex(toUser);
	            User.dao.updateUserByEmail(password,create_date,validateCode,email);
	            renderText("ok");
	        }else{
		        u.setEmail(email);
		        u.setEmailValidateCode(validateCode);
		        u.setEmailverify(0);//默认是0,激活的用户是变为1
		        u.setLoginName(email);
		        u.setPassword(SystemServiceUtil.entryptPassword(password));
		        u.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		        u.save();
		        //保存云铺设置基础表的信息
		        saveSettingBasic(u);
		        //保存公司表基础信息
		        saveCompanyInfo(u);
		        //保存person表的信息
		        savePersonInfo(u,null);
		        //保存用户角色
		        UserRole ur = new UserRole();
		        ur.set("user_id", u.get("id"));
		        String rolename = Dict.dao.getNameByValue(1, "user_type").get("label");
		        ur.set("role_id", Role.dao.findRoleByName(rolename).getId());
		        ur.save();
		        renderText("ok");
	        }
		}
	}
    /**
     *方法saveRegister的功能描述:保存注册用户
     *@author yaoyt
     *@time 16/3/21 下午2:53
     */
    public void saveRegister(){
        String checkCode = getPara("checkCode");
        String username = getPara("username");
        String password = getPara("password");
        String msg;
        Record r = User.dao.findUserByNameOrPhone(username);
        //如果该账户已被注册,则提示用户
        if (null != r) {
            msg = "该账户已被注册!";
            renderText(msg);
        }
        String codemsg = ValiCode.jiaoyan(username, checkCode);
        if (!codemsg.equals("ok")) {
            renderText(codemsg);
            return;
        }
        User u = new User();
        u.setLoginName(username);
        u.setPassword(SystemServiceUtil.entryptPassword(password));
        u.set("create_by", 0);
        u.setCreateDate(new Date());
        u.set("del_flag", false);
        try{
            u.save();
        }catch(Exception e){
            renderText("操作失败,请联系管理员");
            return;
        }
        //保存云铺设置基础表的信息
        saveSettingBasic(u);
        //保存公司表基础信息
        saveCompanyInfo(u);
        //保存person表的信息
        savePersonInfo(u,username);
        //保存用户角色
        UserRole ur = new UserRole();
        ur.set("user_id", u.get("id"));
        String rolename = Dict.dao.getNameByValue(1, "user_type").get("label");
        ur.set("role_id", Role.dao.findRoleByName(rolename).getId());
        ur.save();
        renderText("ok");

    }
    /**
     *方法saveSettingBasic的功能描述:保存用户的云铺基础表的信息
     *@author yaoyt
     *@time 16/3/21 下午3:19
     */
    public void saveSettingBasic(User u){
        SettingBasic sb = SettingBasic.dao.findById(u.getId());
        if (sb == null) {
            sb = new SettingBasic();
            sb.set("user_id", u.get("id"));
            sb.set("create_by", u.getId());
            sb.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            sb.set("del_flag", false);
            sb.save();
        }
    }
    /**
     *方法的功能描述:保存公司信息
     *@author yaoyt
     *@time 16/3/21 下午3:22
     */
    public void saveCompanyInfo(User u){
        Company comp = Company.dao.findXinxi(u.getId());
        if (comp == null) {
            comp = new Company();
            comp.set("user_id", u.get("id"));
            comp.set("create_by", 0);
            comp.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            comp.set("del_flag", false);
            comp.save();
        }
    }
    /**
     *方法的功能描述:保存用户表信息
     *@author yaoyt
     *@time 16/3/21 下午3:24
     */
    public void savePersonInfo(User u,String phone){
        Person person = Person.dao.findXinxi(u.getId());
        if (person == null) {
            person = new Person();
            person.set("user_id", u.get("id"));
            person.set("create_by", 0);
            person.set("phone", phone);
            person.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            person.set("del_flag", false);
            person.save();
        }
    }
    
    /**
     *方法的功能描述:保存用户表信息
     *@author wyp
     *@time 2016年12月28日
     */
    public void savePersonInfoV2(User u,String phone,String mail){
        Person person = Person.dao.findXinxi(u.getId());
        if (person == null) {
            person = new Person();
            person.set("user_id", u.get("id"));
            person.set("create_by", 0);
            person.set("phone", phone);
            person.set("email", mail);
            person.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            person.set("del_flag", false);
            person.save();
        }
    }

    /**
     * 校验编码
     */
    public void bianma() {
        String msg = "";
        Record r = SalesmanCode.dao.getSalesCodeByCode(getPara("salesmanCode"));
        if (null == r) {
            msg = "该编码不存在";
        } else {
            msg = "ok";
        }
        renderText(msg);
    }

    /**
     * 手机注册
     */
  /*  public void regPhone() {
        setAttr("salesmanCode", getPara("salesmanCode"));
        createToken("phoneToken", 30 * 60); //过期时间设置为30分钟
        LOGGER.info("phoneToken".concat(getSessionAttr("phoneToken").toString()));
        render("regPhone.jsp");
    }*/

    /**
     * 手机注册保存
     */
    public void regPhoneSave() {
       // boolean token = validateToken("userToken");
        boolean token = true;
        boolean f = false;

        String username = getPara("username");
        String password = getPara("password");
        String checkCode = getPara("checkCode");
        String leixing = getPara("leixing");
        //先判断该手机号是否被注册过
        Record tele = Db.findFirst("SELECT * FROM sys_person p WHERE p.phone=?", username);
        if (tele != null) {
            renderText("该手机号已经被注册过");
            return;
        }
        //将tx_开头的用户名保留出来,预留给腾讯对接过来的用户,不允许使用tx_开头的用户名注册
        if (username.indexOf("tx_") == 0) {
            renderText("该用户名已经存在");
            return;
        }
        String salesmanCode = getPara("salesmanCode");
        if (null != salesmanCode && !salesmanCode.equals("")) {
            Record r = SalesmanCode.dao.getSalesCodeByCode(salesmanCode);
            if (null == r) {
                renderText("该编码不存在");
                return;
            } else {
                f = true;
            }
        }
        String codemsg = ValiCode.jiaoyan(username, checkCode);
        if (!codemsg.equals("ok")) {
            renderText(codemsg);
            return;
        }

        User u = User.dao.findByUsername(username);
        if (u == null) {
            if (token == true) {
                u = new User();
                u.setLoginName(username);
                u.setPassword(SystemServiceUtil.entryptPassword(password));
                u.set("create_by", 0);
                u.setCreateDate(new Date());
                u.set("del_flag", false);
                if (f) {
                    u.set("operator_code", salesmanCode);
                }
                u.save();
                //保存云铺设置基础表的信息
                saveSettingBasic(u);
                //保存公司表基础信息
                saveCompanyInfo(u);
                //保存person表的信息
                savePersonInfo(u,username);
                // 用户角色插入
                UserRole ur = new UserRole();
                ur.set("user_id", u.get("id"));
                String rolename = Dict.dao.getNameByValue(3, "user_type").get("label");
                if (null != salesmanCode && !salesmanCode.equals("")) {
                    ur.set("role_id", 19);
                } else {
                    ur.set("role_id", Role.dao.findRoleByName(rolename).getId());
                }
                ur.save();
                if (null != salesmanCode && !salesmanCode.equals("")) {
                    Subject subject = SecurityUtils.getSubject();
                    UsernamePasswordToken usertoken = new UsernamePasswordToken(username, password.toCharArray(), false, null, null, null);
                    subject.login(usertoken);
                    renderText("weifei");
                    return;
                    
                } else {
                    renderText("ok");
                }

            } else {
                renderText("上次已保存，请不要重复提交");
            }
        } else {
            renderText("该用户名已经存在");
        }


    }

    /**
     * 激活用户邮箱
     * @author zwn
     * @date 2016-3-23   下午2:40:32
     */
    public void activateUserAccount(){
    	String validateCode = getPara("validateCode");
    	String emailCode = getPara("email");
    	List<Record> r = User.dao.findUserByValidatecodeAndEmailcode(validateCode, emailCode);
    	boolean email_verify;
    	if(!r.isEmpty()){
			Record firstRecord = r.get(0);
			email_verify = firstRecord.get("email_verify");
			if(email_verify==false){
    		String email = firstRecord.get("email");
    		String email_validate_code = firstRecord.get("email_validate_code");
    		//更新操作
    		boolean flag = User.dao.updateUserByEmailAndcCode(email, email_validate_code);
    		setAttr("Activateflage", 1);//表示第一次激活
    		if(flag == true){
    		render("activate.jsp");
    		}
    	}else{
    		setAttr("Activateflage",2);//表示重复激活
    		render("activate.jsp");
    	}
      }else{
    		render("activateFail.jsp");
  		}
   }
    public void sendEmail() throws Exception {
        String toUser = "yyt@anginfo.com";
        String subject = "优蚁网激活邮件";
        //设置参数值
        Map<String,Object> values = new HashMap<String,Object>();
        HttpServletRequest request = getRequest();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/reg/";
        String validateCode = MD5Util.encode2hex(toUser);
        values.put("activateHref",basePath+"activateUserAccount?validateCode="+validateCode);
        //通过freemarker获取配置在xml中的内容
        String html = XmlSqlUtils.getSql("/html/activation_html.xml","getActivationHtml",values);
       // EmailUtils.send(subject,html,toUser);
        render("activate.jsp");
    }
    
    /**
     * 注册时检测用户是否存在,手机号或者邮箱
     * 2016年12月28日
     * wyp
     */
    public void checkUserIsExit(){
    	String msg = "";
        String telOrMail = getPara("tel");
        Record r = User.dao.findUserByNameOrPhone(telOrMail);
        //如果该账户已被注册,则提示用户
        if (null != r) {
            msg = "该账号已被注册!";
            renderText(msg);
        }else{
        	Record rr = User.dao.findUserByEmail(telOrMail,1); 
        	if(null !=rr){
        		msg="该邮箱已被注册";
        		renderText(msg);
        	}else{
        		renderText("ok");
        	}
        }
    }
    
    /**
     * 注册新用户
     * 2016年12月28日
     * wyp
     */
    public void regNewUser(){
    	String checkCode = getPara("checkCode");
        String username = getPara("username");
        String password = getPara("password");
        String isMail = getPara("isMail");
        String msg;
        Record r = User.dao.findUserByNameOrPhone(username);
        //如果该账户已被注册,则提示用户
        if (null != r) {
            msg = "该账户已被注册!";
            renderText(msg);
        }
        String codemsg = ValiCode.jiaoyan(username, checkCode);
        if (!codemsg.equals("ok")) {
            renderText(codemsg);
            return;
        }
        User u = new User();
        u.setLoginName(username);
        u.setPassword(SystemServiceUtil.entryptPassword(password));
        if(isMail.equals("1")){
        	//邮箱注册须加上邮箱验证信息
        	u.setEmail(username);
        	u.setEmailValidateCode(MD5Util.encode2hex(username));
        	u.setEmailverify(1);
        }
        u.set("create_by", 0);
        u.setCreateDate(new Date());
        u.set("del_flag", false);
        try{
            u.save();
        }catch(Exception e){
            renderText("操作失败,请联系管理员");
            return;
        }
        //保存云铺设置基础表的信息
        saveSettingBasic(u);
        //保存公司表基础信息
        saveCompanyInfo(u);
        //保存person表的信息
        if(isMail.equals("1")){
        	savePersonInfoV2(u,null,username);
        }else{
        	savePersonInfoV2(u,username,null);
        }
        //保存用户角色
        UserRole ur = new UserRole();
        ur.set("user_id", u.get("id"));
        String rolename = Dict.dao.getNameByValue(1, "user_type").get("label");
        ur.set("role_id", Role.dao.findRoleByName(rolename).getId());
        ur.save();
        renderText("ok");
    }
    
    
}
