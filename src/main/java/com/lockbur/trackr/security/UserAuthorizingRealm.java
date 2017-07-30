package com.lockbur.trackr.security;

import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.service.UserService;
import com.lockbur.trackr.utils.SecurityPasswordUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * shiro 认证
 * Created by wangkun23 on 2017/6/22.
 */
@Component
public class UserAuthorizingRealm extends AuthorizingRealm {


    @Autowired
    private UserService userService;

    /**
     * 认证(登录时调用)
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        String username = usernamePasswordToken.getUsername();
        String password = new String(usernamePasswordToken.getPassword());
        //查询用户信息
        User user = userService.selectByUserName(username);
        //账号不存在
        if (user == null) {
            throw new UnknownAccountException("账号不存在");
        }
        //密码错误
        if (!SecurityPasswordUtils.matchPassphrase(user.getPassword(), user.getSalt(), password)) {
            throw new IncorrectCredentialsException("账号或密码不正确");
        }
        //账号锁定
        if (user.getStatus() == 0) {
            throw new LockedAccountException("账号已被锁定,请联系管理员");
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, password, getName());
        return info;
    }

    /**
     * 授权(验证权限时调用)
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//		User user = (SysUserEntity)principals.getPrimaryPrincipal();
//		Long userId = user.getUserId();
//
//		//用户权限列表
//		Set<String> permsSet = sysMenuService.getUserPermissions(userId);

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
//		info.setStringPermissions(permsSet);
        return info;
    }
}
