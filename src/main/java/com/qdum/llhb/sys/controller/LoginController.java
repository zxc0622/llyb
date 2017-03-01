package com.qdum.llhb.sys.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;

import com.google.common.collect.Maps;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.render.CaptchaRender;
import com.jfinal.plugin.ehcache.CacheKit;
import com.qdum.llhb.common.security.shiro.UserOpenidForQqToken;
import com.qdum.llhb.common.utils.CookieUtils;
import com.qdum.llhb.common.utils.IpUtils;
import com.qdum.llhb.common.utils.UrlUtils;
import com.qdum.llhb.memPoint.controller.PointController;
import com.qdum.llhb.reg.model.Company;
import com.qdum.llhb.reg.model.UserRole;
import com.qdum.llhb.sys.model.Dict;
import com.qdum.llhb.sys.model.LoginLog;
import com.qdum.llhb.sys.model.Menu;
import com.qdum.llhb.sys.model.Person;
import com.qdum.llhb.sys.model.Role;
import com.qdum.llhb.sys.model.SettingBasic;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.model.UserQq;
import com.qdum.llhb.sys.utils.UserUtils;


public class LoginController extends Controller {
	private static final String RANDOM_CODE_KEY = "8018";

	// app id
	private static final String APP_ID = "101279218";
	// 授权成功后的回调地址
	private static final String REDIRCT_URL = "http://www.yyhb365.com/login_qq";
	// getuserinfo path
	private static final String PATH = "https://graph.qq.com/user/get_user_info?";
	
	@ActionKey("/validate_code")
	public void validateCode() {
		render(new CaptchaRender(RANDOM_CODE_KEY));
	}
	
	/**
	 * 管理后台登录页
	 */
    @ActionKey("admLogin")
	public void index() {
		String method = getRequest().getMethod();
		if (method.equalsIgnoreCase("get")) {
			if (UserUtils.getUser().getId() != null) {
				redirect("/admHome");
				return;
			}
		} else if (method.equalsIgnoreCase("post")) {
			String username = getPara(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
			setAttr(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
			setAttr("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
		}
		String requestType = getRequest().getHeader("x-requested-with");
		if (requestType == null) {
			createToken("token", 30*60);
			render("admLogin.jsp");
		} else {
			renderText("reload");
		}

	}

    /**
     * 管理后台首页
     */
    @RequiresUser
    @ActionKey("/admHome")
    public void home() {
        User user = UserUtils.getUser();
        if (user.getId() == null) {
            redirect("/admLogin");
        }

        List<Menu> menus = Menu.dao.findFirstMenus(user.getId());
        Long parentId = this.getParaToLong("parentId");
        if (parentId == null || parentId == 0L || parentId == 1L) {
            parentId = menus.get(0).getId();
        }
        Menu menu = Menu.dao.findById(parentId);
        setAttr("menu", menu);
        setAttr("menus", menus);
        setAttr("menusChilds", Menu.dao.getChildList(user.getId(), parentId));
        render("sysIndex.jsp");
    }

    @ActionKey("login_v1")
    public void login_v1() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase("get")) {
            if (UserUtils.getUser().getId() != null) {
                redirect("/home");
                return;
            }
        } else if (method.equalsIgnoreCase("post")) {
            String username = getPara(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
            setAttr(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
            setAttr("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
        }
        String requestType = getRequest().getHeader("x-requested-with");
        String salesmanCode = getPara("salesmanCode");
        setAttr("salesmanCode",salesmanCode);
        if (requestType == null) {
            createToken("token", 30*60);
            render("login.jsp");
        } else {
            renderText("reload");
        }
    }
    
    @ActionKey("login")
    public void login(){
    	String method = getRequest().getMethod();
        if (method.equalsIgnoreCase("get")) {
            if (UserUtils.getUser().getId() != null) {
                redirect("/home");
                return;
            }
        } else if (method.equalsIgnoreCase("post")) {
            String username = getPara(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
            setAttr(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
            setAttr("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
        }
        String requestType = getRequest().getHeader("x-requested-with");
        String salesmanCode = getPara("salesmanCode");
        setAttr("salesmanCode",salesmanCode);
        if (requestType == null) {
            createToken("token", 30*60);
            render("../v2/sys/login.jsp");
        } else {
            renderText("reload");
        }
    }

    @ActionKey("phoneLogin")
    public void phoneLogin() {
        //重复登录BUG处理
        SavedRequest savedRequest = WebUtils.getSavedRequest(getRequest());
        //如果存在被拦截的链接,则不处理,否则,登出,重新登录
        SecurityUtils.getSubject().logout();

        String userName = getPara("username");
        String checkCode = getPara("checkCode");
        String salesmanCode = getPara("salesmanCode");
        String msg;
        //校验该验证码是否匹配
        String code = CacheKit.get("checkCode", userName);
        setAttr("username",userName);
        setAttr("checkCode",checkCode);
        setAttr("salesmanCode",salesmanCode);
        if(checkCode == null || !checkCode.equals(code)){
            msg = "手机验证码不正确";
            setAttr("loginErr",msg);
            render("../reg/regPhone.jsp");
            return;
        }
        //校验该手机号对应的账户是否存在
        User u = User.dao.findByPhoneNum(userName);
        if(null == u){
            msg = "该手机号码不存在";
            setAttr("loginErr",msg);
            render("../reg/regPhone.jsp");
            return;
        }
        //将该用户登录系统
        UserOpenidForQqToken token = new UserOpenidForQqToken();
        token.setUserId(u.getId().toString());
        Subject subject = SecurityUtils.getSubject();
        subject.login(token);
        //将登录信息保存到登录日志中
        LoginLog.dao.saveloginLog(u.getId(),IpUtils.getRemoteHost(getRequest()));
        //增加登录积分
        new PointController().dailyLoginPoint();//获取每日登录积分
        redirect("/home");
        return;
    }

    /**
     * 用户登录后台首页
     */
 

	
	/**
	 * 是否是验证码登录
	 * @param useruame 用户名
	 * @param isFail 计数加1
	 * @param clean 计数清零
	 * @return
	 */ 
	@SuppressWarnings("unchecked")
	public static boolean isValidateCodeLogin(String useruame, boolean isFail, boolean clean) {
		Map<String, Integer> loginFailMap = CacheKit.get("login","loginFailMap");
		if (loginFailMap == null) {
			loginFailMap = Maps.newHashMap();
			CacheKit.put("login", "loginFailMap", loginFailMap);
		}
		Integer loginFailNum = loginFailMap.get(useruame);
		if (loginFailNum == null){
			loginFailNum = 0;
		}
		if (isFail) {
			loginFailNum++;
			loginFailMap.put(useruame, loginFailNum);
		}
		if (clean) {
			loginFailMap.remove(useruame);
		}
		return loginFailNum >= 3;
	}
	
	/**
	 * 获取主题方案
	 */
	@ActionKey(value = "/theme")
	public void getThemeInCookie() {
		String theme = getPara(0);
		if (StringUtils.isNotBlank(theme)) {
			CookieUtils.setCookie(getResponse(), "theme", theme);
		} else {
			theme = CookieUtils.getCookie(getRequest(), "theme");
		}
		String url = getPara("url");
		redirect(url);
	}

    /**
     * 用户登录名权限校验
     * @author zhaoyl
     * @time 2015年12月1日09:57:09
     */
	@ActionKey("validateLoginNamePower")
	public void validateLoginNamePower(){
		String loginName = getPara("loginName");
		if(loginName!=null && !loginName.equals("")){
			User user = User.dao.findByUsernameOrPhone(loginName);
			if(user!=null){
				UserRole ur = UserRole.dao.getRoleID(user.getId());
				if(ur!=null){
					renderJson(true);
				}else{
					renderJson(false);
				}
			}else{
				renderText("error");
			}
		}
	}


	@ActionKey("/login_qq")  //QQ登录跳转
	public void qq() throws Exception {
		//获取到access_token
		String accessToken = getPara("access_token");
		if(StringUtils.isBlank(accessToken)){
			//如果未获取到accessToken,跳转到页面,由页面JS过滤掉请求中的#
		}else{
			String path = "https://graph.qq.com/oauth2.0/me?";
			String expires = getPara("expires_in");
			StringBuffer url = new StringBuffer();
			url.append(path).append("access_token=").append(accessToken).append("&expires_in=").append(expires);
			//调用腾讯的接口,获取到openid
			String back = UrlUtils.getUrlBack(url.toString());
			//获取到openid
			String openid = back.substring(back.indexOf("\"openid\":\"")+10,back.lastIndexOf("\"}"));
			//根据openid 获取用户信息
			String params = "access_token=" + accessToken + "&expires_in=" + expires
					+ "&oauth_consumer_key=" + APP_ID + "&openid=" + openid;
			url = new StringBuffer(PATH).append(params);
			back = UrlUtils.getUrlBack(url.toString());
			JSONObject jo = JSONObject.fromObject(back);
			Map<String, Object> userInfo = (Map<String, Object>)jo;
			//判断100 * 100 像素的用户头像是否存在
			if(StringUtils.isBlank(userInfo.get("figureurl_qq_2").toString())){
				userInfo.put("figureurl_qq_2",userInfo.get("figureurl_qq_1"));
			}

			//根据openID判断该用户是否已绑定了优蚁账户,如果已绑定,直接跳转到登录页面
			UserQq user = UserQq.dao.getUserByOpenid(openid);
			if(user != null){
				//将此用户登录,并直接跳转到home页面
				UserOpenidForQqToken token = new UserOpenidForQqToken();
				token.setOpenid(openid);
				token.setUserId(user.getUserId().toString());
				Subject subject = SecurityUtils.getSubject();
				subject.login(token);
				//将登录信息保存到登录日志中
				LoginLog.dao.saveloginLog(user.getUserId(),IpUtils.getRemoteHost(getRequest()));
				//并将用户的状态信息重新更新到sys_user_qq表中
				user.setToken(accessToken);
				user.setNickname(userInfo.get("nickname").toString());
				user.setHeadImg(userInfo.get("figureurl_qq_2").toString());
				user.update();
				redirect("/home");
                //更新sys_user表中的用户的头像字段
                User u = UserUtils.getUser();
                u.setHeadImg(userInfo.get("figureurl_qq_2").toString());
                u.update();
				return;
			}

			setAttr("userInfo",userInfo);
			setAttr("openid",openid);
			setAttr("accessToken",accessToken);
		}
		//create a token in case  repeat commit
		createToken("qqBindToken",60*30);
		render("login_qq.jsp");

	}

	@ActionKey("/login_qq_redirect")
	public void login_qq_redirect() throws Exception {
		boolean qqBindToken = validateToken("qqBindToken");
		String jumpBind = getPara("jumpBind");
		//如果用户跳过了账户绑定,则需要在系统中新建用户,并将该用户与该QQ绑定
		if ("1".equals(jumpBind)) {
			if(qqBindToken == false){
				//如果是重复提交,直接返回,并提示
				setAttr("tip","请不要重复提交");
				qq();
				return;
			}
			User u = new User();
			u.setType(1);
			u.setLoginName("tx_"+getPara("nickname"));
			u.setPassword(getPara("openid"));
			u.setName(getPara("nickname"));
            u.setHeadImg(getPara("headImg"));
			u.setCreateBy(1L);
			u.setCreateDate(new Date());
			u.setDelFlag(0);
			u.save();
			saveUserBasicInfo(u.getId());
			//将用户与该QQ号进行绑定
			UserQq q = new UserQq();
			q.setUserId(u.getId());
			q.setOpenid(getPara("openid"));
			q.setToken(getPara("token"));
			q.setNickname(getPara("nickname"));
			q.setHeadImg(getPara("headImg"));
			q.setCreateBy(u.getId());
			q.setCreateDate(new Date());
			UserQq.dao.deleteOtherQQ(u.getId());
			q.save();
			//将此用户做登录处理
			UserOpenidForQqToken token = new UserOpenidForQqToken();
			token.setOpenid(getPara("openid"));
			token.setUserId(u.getId().toString());
			Subject subject = SecurityUtils.getSubject();
			subject.login(token);

		}
		render("login_qq_redirect.jsp");

	}

	/**
	 * QQ 绑定校验
	 */
	@ActionKey("/login_qq_valid")
	public void login_qq_valid(){
		String openid = getPara("openid");
		String accessToken = getPara("accessToken");
		String nickname = getPara("nickname");
		String headImg = getPara("headImg");
		//如果登录成功,跳转到注册成功页面
		if (UserUtils.getUser().getId() != null) {
			redirect("/login_qq_redirect");
			return;
		}
		//如果出现错误,则,重新跳转回用户绑定页面
		setAttr("openid",openid);
		setAttr("accessToken",accessToken);
		Map<String,Object> userInfo = new HashMap<String,Object>();
		userInfo.put("nickname",nickname);
		userInfo.put("figureurl_qq_2",headImg);
		setAttr("userInfo",userInfo);
		//create a token in case  repeat commit
		createToken("qqBindToken",60*30);
		render("login_qq.jsp");

	}

    /**
     *方法loginByPhoneAndDynamicNum的功能描述:根据手机号与动态验证码校验登录
     *@author yaoyt
     *@time 16/3/14 下午3:32
     */
    @ActionKey("dynamicLogin")
    public void loginByPhoneAndDynamicNum(){
        //重复登录BUG处理
        SavedRequest savedRequest = WebUtils.getSavedRequest(getRequest());
        //如果存在被拦截的链接,则不处理,否则,登出,重新登录
        SecurityUtils.getSubject().logout();

        String phone = getPara("phone");
        String dynamicNum = getPara("dynamicNum");
        String msg;
        //校验该验证码是否匹配
        String code = CacheKit.get("checkCode", phone);
        setAttr("phone",phone);
        setAttr("dynamicNum",dynamicNum);
        if(dynamicNum == null || !dynamicNum.equals(code)){
            msg = "验证码不正确";
//            setAttr("phoneErr",msg);
//            render("login.jsp");
            setAttr("loginErr",msg);
            render("../v2/sys/login.jsp");
            return;
        }
        //校验该手机号对应的账户是否存在
        User u = User.dao.findByPhoneNum(phone);
        if(null == u){
            msg = "该账户不存在";
//            setAttr("phoneErr",msg);
//            render("login.jsp");
            setAttr("loginErr",msg);
            render("../v2/sys/login.jsp");
            return;
        }
        //将该用户登录系统
        UserOpenidForQqToken token = new UserOpenidForQqToken();
        token.setUserId(u.getId().toString());
        Subject subject = SecurityUtils.getSubject();
        subject.login(token);
        //将登录信息保存到登录日志中
        LoginLog.dao.saveloginLog(u.getId(),IpUtils.getRemoteHost(getRequest()));
        //增加登录积分
        new PointController().dailyLoginPoint();//获取每日登录积分
        redirect("/home");
        return;
    }


	/**
	 * 插入用户相关的基础数据
	 */
	protected void saveUserBasicInfo(Long userId){
		//向云铺设置的基础表中插入数据
		SettingBasic b = new SettingBasic();
		b.set("user_id",userId);
		b.set("create_by", userId);
		b.set("create_date", new Date());
		b.set("del_flag", false);
		b.save();
		//向个人表中插入数据
		Person p = new Person();
		p.set("user_id", userId);
		p.set("create_by", 0);
		p.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		p.set("del_flag", false);
		p.save();
		//向公司表中插入数据
		Company c = new Company();
		c.set("user_id", userId);
		c.set("create_by", 0);
		c.set("create_date", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		c.set("del_flag", false);
		c.save();
		//向角色表中插入数据
		UserRole ur = new UserRole();
		ur.set("user_id",userId);
		String roleName = Dict.dao.getNameByValue(1, "user_type").get("label");
		ur.set("role_id",Role.dao.findRoleByName(roleName).getId());
		ur.save();
	}


}
