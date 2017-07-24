package com.lockbur.trackr.mapper;

import com.lockbur.trackr.domain.Role;
import com.lockbur.trackr.domain.User;
import com.lockbur.trackr.rest.Pageable;

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
     * 分页查询角色列表
     *
     * @param pageable
     * @return
     */
    public List<Role> findByPage(Pageable pageable);

    /**
     * *
     * 分页查询 count
     *
     * @param pageable
     * @return
     */
    public Long countByPage(Pageable pageable);


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
