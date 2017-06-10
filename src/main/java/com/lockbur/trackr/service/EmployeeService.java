package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.User;

/**
 * 登录员工管理
 * Created by wangkun23 on 2017/6/10.
 */
public interface EmployeeService {

    /**
     * 判断是否登录成功
     *
     * @return
     */
    public boolean isAuthenticated();

    /**
     * 获得当前用户
     *
     * @return
     */
    public User getCurrentUser();

    /**
     * 获得登录时记录的用户
     *
     * @return
     */
    public User getCurrentUserByPrincipal();

    /**
     * 获得当前用户ID
     *
     * @return
     */
    public Integer getCurrentUserId();
}
