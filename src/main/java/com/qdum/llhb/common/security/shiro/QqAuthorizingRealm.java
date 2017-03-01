package com.qdum.llhb.common.security.shiro;

import com.qdum.llhb.sys.model.Menu;
import com.qdum.llhb.sys.model.User;
import com.qdum.llhb.sys.utils.UserUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.Date;
import java.util.List;

public class QqAuthorizingRealm extends AuthorizingRealm {

    /**
     * 授权函数
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SystemAuthorizingRealm.Principal principal = (SystemAuthorizingRealm.Principal) getAvailablePrincipal(principals);
        User user = User.dao.findByUsername(principal.getLoginName());
        if (user != null) {
            UserUtils.putCache("user", user);
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            List<Menu> list = UserUtils.getMenuList();
            for (Menu menu : list) {
                if (StringUtils.isNotBlank(menu.getPermission())) {
                    // 添加基于Permission的权限信息
                    info.addStringPermission(menu.getPermission());
                }
            }
            // 更新登录IP和时间
            user.setLoginIp(SecurityUtils.getSubject().getSession().getHost());
            user.setLoginDate(new Date());
            User.dao.save(user);
            return info;
        } else {
            return null;
        }
    }

    /**
     * 认证回调函数, 登录时调用
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        UserOpenidForQqToken token = (UserOpenidForQqToken) authcToken;
        User user = User.dao.findById(token.getUserId());
        if (user != null) {
            return new SimpleAuthenticationInfo(new SystemAuthorizingRealm.Principal(user),
                    null, null, getName());
        } else {
            return null;
        }
    }


}
