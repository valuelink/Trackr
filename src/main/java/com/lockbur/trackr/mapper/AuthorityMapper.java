package com.lockbur.trackr.mapper;


import com.lockbur.trackr.domain.Authority;

import java.util.List;


public interface AuthorityMapper {

    /***
     * @param entity
     */
    public void insert(Authority entity);

    /**
     * @param roleIds
     * @return
     */
    public List<String> findAuthorityByRoles(List<Integer> roleIds);


    /**
     * 查询一个角色对应的权限列表
     *
     * @param roleId
     * @return
     */
    public List<String> findAuthorityByRoleId(Integer roleId);

    /**
     * 根据角色删除权限，主要用于在修改角色权限，时保存新的权限信息
     *
     * @param roleId
     */
    public void deleteByRoleId(Integer roleId);

    /**
     * 删除用户的权限信息
     *
     * @param userId
     */
    public void deleteByUserId(Integer userId);


    /**
     * 查询用户的附加权限信息
     *
     * @param userId
     */
    public List<String> findAuthorityByUserId(Integer userId);
}
