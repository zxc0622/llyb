package com.qdum.llhb.common.security.shiro;

import com.qdum.llhb.common.utils.CookieUtils;
import com.qdum.llhb.memPoint.controller.PointController;
import com.qdum.llhb.sys.model.LoginLog;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.model.UserQq;
import com.qdum.llhb.sys.utils.UserUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * qq 登录绑定校验
 */
public class FormQQAuthenticationFilter extends org.apache.shiro.web.filter.authc.FormAuthenticationFilter {

	public static final String DEFAULT_CAPTCHA_PARAM = "validateCode";

	private String captchaParam = DEFAULT_CAPTCHA_PARAM;

	public String getCaptchaParam() {
		return captchaParam;
	}

	protected String getCaptcha(ServletRequest request) {
		return WebUtils.getCleanParam(request, getCaptchaParam());
	}

	protected String getOpenid(ServletRequest request){
		return WebUtils.getCleanParam(request,"openid");
	}

	protected String getToken(ServletRequest request){
		return WebUtils.getCleanParam(request,"accessToken");
	}

	protected String getNickname(ServletRequest request){
		return WebUtils.getCleanParam(request,"nickname");
	}

	protected String getHeadImg(ServletRequest request){
		return WebUtils.getCleanParam(request,"headImg");
	}


	@Override
	public boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
		SecurityUtils.getSubject().logout();
		return super.onPreHandle(request, response, mappedValue);
	}

	protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
		String username = getUsername(request);
		String password = getPassword(request);
		if (password==null){
			password = "";
		}
		boolean rememberMe = isRememberMe(request);
		String host = getHost(request);
		String captcha = getCaptcha(request);
		String code = CookieUtils.getCookie((HttpServletRequest)request, "validateCode");
		return new UsernamePasswordToken(username, password.toCharArray(), rememberMe, host, captcha,code);

	}
    /**
     * 登录插入日志 zhangxm
     */
    public boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {
    	User user = UserUtils.getUser();
        if (user.getId() != null) {
        	new PointController().dailyLoginPoint();//获取每日登录积分
        	//LoginLog log = new LoginLog();
        	//log.set("log_type","LOGIN").set("log_time", new Date()).set("log_user", user.getId()).set("del_flag",0).set("log_ip", request.getRemoteAddr()).save();
            LoginLog.dao.saveloginLog(user.getId(),request.getRemoteAddr());
        }
        //查询sys_user_qq中是否有该用户的信息,如果有,则更新,如果没有,则插入
        UserQq qUser = UserQq.dao.getUserByUserId(user.getId());
        if(null == qUser){
            //将此QQ号与登录用户绑定
            qUser = new UserQq();
            qUser.setUserId(UserUtils.getUser().getId());
            qUser.setOpenid(getOpenid(request));
            qUser.setToken(getToken(request));
            qUser.setNickname(getNickname(request));
            qUser.setHeadImg(getHeadImg(request));
            qUser.setCreateBy(qUser.getUserId());
            qUser.setCreateDate(new Date());
            UserQq.dao.deleteOtherQQ(qUser.getUserId());
            qUser.save();
        }else{
            qUser.setOpenid(getOpenid(request));
            qUser.setToken(getToken(request));
            qUser.setNickname(getNickname(request));
            qUser.setHeadImg(getHeadImg(request));
            qUser.update();
        }
        //将图片信息保存到sys_user表中的head_img字段中
        user.setHeadImg(getHeadImg(request));
        user.update();
		this.issueSuccessRedirect(request, response);
		return false;
	}
}
