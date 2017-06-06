package com.lockbur.trackr.mapper;

import com.lockbur.trackr.domain.Role;

import java.util.List;

public interface RoleMapper {

    /**
     * 保存
     *
     * @param entity
     */
    public void insert(Role entity);

    /**
     * 查询用户角色
     *
     * @param uid
     * @return
     */
    public List<Role> findRolesByUid(Integer uid);

    /**
     * 查询所有
     *
     * @return
     */
    public List<Role> findAll();


    /**
     * 主键查询
     *
     * @param id
     * @return
     */
    public Role findById(Integer id);


    /**
     * 修改
     *
     * @param entity
     */
    public void update(Role entity);


}
