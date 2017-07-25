package com.lockbur.trackr.mapper;

import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.domain.UserRole;

/**
 * 用户与角色对应关系
 * Created by wangkun23 on 2017/7/25.
 */
public interface UserRoleMapper {

    /**
     * 用户角色关系
     *
     * @param userRole
     */
    public void insert(UserRole userRole);

    /**
     * 根据用户ID，获取用户角色
     */
    public Role findRoleByUserId(Integer userId);


    /**
     * 删除用户的角色信息
     *
     * @param userId
     */
    public void deleteByUserId(Integer userId);

}
