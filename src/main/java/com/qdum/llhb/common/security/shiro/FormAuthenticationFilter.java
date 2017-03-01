package com.qdum.llhb.common.security.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;

import com.qdum.llhb.common.utils.CookieUtils;
import com.qdum.llhb.memPoint.controller.PointController;
import com.qdum.llhb.salesmancode.model.SalesmanCode;
import com.qdum.llhb.sys.model.LoginLog;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;

public class FormAuthenticationFilter extends org.apache.shiro.web.filter.authc.FormAuthenticationFilter {

	public static final String DEFAULT_CAPTCHA_PARAM = "validateCode";

	private String captchaParam = DEFAULT_CAPTCHA_PARAM;

    private String salesmanCodeParam = "salesmanCode";


    public String getSalesmanCodeParam() {
        return salesmanCodeParam;
    }

    protected  String getSalesmanCode(ServletRequest request){
        return WebUtils.getCleanParam(request,getSalesmanCodeParam());
    }

    public String getCaptchaParam() {
		return captchaParam;
	}

	protected String getCaptcha(ServletRequest request) {
		return WebUtils.getCleanParam(request, getCaptchaParam());
	}

	@Override
	public boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        //重复登录BUG处理
        SavedRequest savedRequest = WebUtils.getSavedRequest(request);
        //如果存在被拦截的链接,则不处理,否则,登出,重新登录
        /*if(null == savedRequest){
            SecurityUtils.getSubject().logout();
        }*/
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
            //如果salesmanCode 不为null,且salesmanCode合法,则更新sys_user表中的salesmanCode字段
            String salesmanCode = getSalesmanCode(request);
            if(null != salesmanCode && null != SalesmanCode.dao.getSalesCodeByCode(salesmanCode)){
                User.dao.updateSalesmanCode(user,salesmanCode);
            }

        }
        //判断拦截的successfull url 是否为 可处理链接(危废服务记忆链接),
        //Yes,则不做处理,跳转到之前拦截的链接
        //No,则清除保存到session中的之前拦截的链接,跳转到/home
        SavedRequest savedRequest = WebUtils.getSavedRequest(request);
        if(null != savedRequest){
            String saveRequestUrl = savedRequest.getRequestUrl();
            if(!saveRequestUrl.contains("requestTest?code")){
                WebUtils.getAndClearSavedRequest(request);
            }
        }
        this.issueSuccessRedirect(request, response);
		return false;
	}



}
