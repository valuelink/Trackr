package com.lockbur.trackr.service;

import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.model.RoleModel;
import com.lockbur.trackr.rest.Page;
import com.lockbur.trackr.rest.Pageable;

import java.util.List;

/**
 * 角色管理
 * Created by wangkun23 on 2016/12/2.
 */
public interface RoleService {


    /**
     * 新增角色信息
     *
     * @param role
     */
    public void save(RoleModel role);

    /**
     * @param roleIds
     * @return
     */
    public List<String> findAuthority(List<Integer> roleIds);


    /**
     * 查询所有角色
     *
     * @return
     */
    public Page<Role> findByPage(Pageable pageable);


    /**
     * 根据主键查询
     *
     * @return
     */
    public RoleModel findById(Integer id);


    /**
     * 修改角色权限
     *
     * @param role
     */
    public void update(RoleModel role);


    /**
     * 根据用户ID查询角色
     *
     * @return
     */
    public Role findRoleByUserId(Integer userId);


}
